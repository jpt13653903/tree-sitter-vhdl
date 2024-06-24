// #define DEBUG
//------------------------------------------------------------------------------

#include <stdio.h>
#include <string.h>
//------------------------------------------------------------------------------

#include "tree_sitter/parser.h"
#include "debug_macros.h"
//------------------------------------------------------------------------------

typedef struct ScannerTag{
    bool is_in_directive;
} Scanner;
//------------------------------------------------------------------------------

#include "TokenType.h"
#include "TokenTree.h"
//------------------------------------------------------------------------------

// These headers contain the "register_*" functions
#include "core.h"

#include "libraries/std/env.h"
#include "libraries/std/standard.h"
#include "libraries/std/textio.h"

#include "libraries/ieee/std_logic_1164.h"
#include "libraries/ieee/numeric_std.h"
#include "libraries/ieee/fixed_pkg.h"
#include "libraries/ieee/float_pkg.h"
#include "libraries/ieee/math_real.h"
#include "libraries/ieee/math_complex.h"
//------------------------------------------------------------------------------

static TokenTree* token_tree     = 0;
static int        instance_count = 0;
//------------------------------------------------------------------------------

void* tree_sitter_vhdl_external_scanner_create()
{
    if(!token_tree){
        token_tree = token_tree_new();
        if(!token_tree){
            error("Cannot allocate memory for the token tree");
            return 0;
        }

        debug("Building the token tree...");

        register_core               (token_tree);
        register_std_env            (token_tree);
        register_std_standard       (token_tree);
        register_std_textio         (token_tree);
        register_ieee_std_logic_1164(token_tree);
        register_ieee_numeric_std   (token_tree);
        register_ieee_fixed_pkg     (token_tree);
        register_ieee_float_pkg     (token_tree);
        register_ieee_math_real     (token_tree);
        register_ieee_math_complex  (token_tree);

        debug("Balancing the token tree");
        token_tree_balance(token_tree);
    }
    instance_count++;

    Scanner* scanner = ts_calloc(1, sizeof(Scanner));

    return scanner;
}
//------------------------------------------------------------------------------

void tree_sitter_vhdl_external_scanner_destroy(Scanner* scanner)
{
    ts_free(scanner);

    instance_count--;
    if(!instance_count){
        if(token_tree) token_tree_free(token_tree);
        token_tree = 0;
    }
}
//------------------------------------------------------------------------------

unsigned tree_sitter_vhdl_external_scanner_serialize(Scanner* scanner, char* buffer)
{
    memcpy(buffer, scanner, sizeof(Scanner));
    return sizeof(Scanner);
}
//------------------------------------------------------------------------------

void tree_sitter_vhdl_external_scanner_deserialize(Scanner* scanner, const char* buffer, unsigned length)
{
    memcpy(scanner, buffer, length);
}
//------------------------------------------------------------------------------

static void skip_whitespace(Scanner* scanner, TSLexer* lexer)
{
    if(scanner->is_in_directive){
        while(lexer->lookahead == ' ' || lexer->lookahead == '\t'){
            debug("Skipping whitespace");
            lexer->advance(lexer, true);
        }
    }else{
        while(lexer->lookahead == ' '  || lexer->lookahead == '\t' ||
              lexer->lookahead == '\n' || lexer->lookahead == '\r' ){
            debug("Skipping whitespace and newlines");
            lexer->advance(lexer, true);
        }
    }
}
//------------------------------------------------------------------------------

static bool bounded_token(TSLexer* lexer, int32_t bound)
{
    while(!lexer->eof(lexer)){
        if(lexer->lookahead == bound){
            lexer->advance(lexer, false);
            lexer->mark_end(lexer);
            if(lexer->lookahead != bound) return true;
        }
        lexer->advance(lexer, false);
    }
    return false;
}
//------------------------------------------------------------------------------

static bool is_letter_or_digit(int32_t lookahead)
{
    return (lookahead >= 'a' && lookahead <= 'z') ||
           (lookahead >= '0' && lookahead <= '9');
}
//------------------------------------------------------------------------------

static bool finish_identifier(TSLexer* lexer, bool expect_letter)
{
    int32_t lookahead = lowercase(lexer->lookahead);
    bool    result = false;

    if(expect_letter){
        if(!is_letter_or_digit(lookahead)) return false;
    }

    while(!lexer->eof(lexer)){
        lexer->mark_end(lexer);
        if(lookahead == '_') lookahead = advance(lexer);
        if(!is_letter_or_digit(lookahead)) return result;
        lookahead = advance(lexer);
        result = true;
    }
    return result;
}
//------------------------------------------------------------------------------

static bool is_special_value(int32_t value)
{
    switch(value){
        case 'u':
        case 'x':
        case 'z':
        case 'w':
        case 'l':
        case 'h':
        case '-':
            return true;
        default:
            return false;
    }
}
//------------------------------------------------------------------------------

static bool binary_string_literal(TSLexer* lexer)
{
    while(!lexer->eof(lexer)){
        if(lexer->lookahead == '_') lexer->advance(lexer, false);
        if((lexer->lookahead < '0' || lexer->lookahead > '1') &&
           !is_special_value(lowercase(lexer->lookahead))) break;
        lexer->advance(lexer, false);
    }
    if(lexer->lookahead != '"') return false;
    lexer->advance(lexer, false);
    lexer->mark_end(lexer);
    return true;
}
//------------------------------------------------------------------------------

static bool octal_string_literal(TSLexer* lexer)
{
    while(!lexer->eof(lexer)){
        if(lexer->lookahead == '_') lexer->advance(lexer, false);
        if((lexer->lookahead < '0' || lexer->lookahead > '7') &&
           !is_special_value(lowercase(lexer->lookahead))) break;
        lexer->advance(lexer, false);
    }
    if(lexer->lookahead != '"') return false;
    lexer->advance(lexer, false);
    lexer->mark_end(lexer);
    return true;
}
//------------------------------------------------------------------------------

static bool decimal_string_literal(TSLexer* lexer)
{
    while(!lexer->eof(lexer)){
        if(lexer->lookahead == '_') lexer->advance(lexer, false);
        if((lexer->lookahead < '0' || lexer->lookahead > '9') &&
           !is_special_value(lowercase(lexer->lookahead))) break;
        lexer->advance(lexer, false);
    }
    if(lexer->lookahead != '"') return false;
    lexer->advance(lexer, false);
    lexer->mark_end(lexer);
    return true;
}
//------------------------------------------------------------------------------

static bool is_hex_digit(int32_t character)
{
    return (character >= '0' && character <= '9') ||
           (character >= 'a' && character <= 'f') ||
           (character >= 'A' && character <= 'F');
}
//------------------------------------------------------------------------------

static bool hex_string_literal(TSLexer* lexer)
{
    while(!lexer->eof(lexer)){
        if(lexer->lookahead == '_') lexer->advance(lexer, false);
        if(!is_hex_digit(lexer->lookahead) &&
           !is_special_value(lowercase(lexer->lookahead))) break;
        lexer->advance(lexer, false);
    }
    if(lexer->lookahead != '"') return false;
    lexer->advance(lexer, false);
    lexer->mark_end(lexer);
    return true;
}
//------------------------------------------------------------------------------

static bool finish_string_literal(TSLexer* lexer, TokenType type)
{
    switch(type){
        case BASE_SPECIFIER_BINARY:  return binary_string_literal (lexer);
        case BASE_SPECIFIER_OCTAL:   return octal_string_literal  (lexer);
        case BASE_SPECIFIER_DECIMAL: return decimal_string_literal(lexer);
        case BASE_SPECIFIER_HEX:     return hex_string_literal    (lexer);
        default:
            error("Unrecognised type %s", token_type_to_string(type));
            return false;
    }
}
//------------------------------------------------------------------------------

static void finish_line_comment(TSLexer* lexer)
{
    while(!lexer->eof(lexer)){
        if(lexer->lookahead == '\r' || lexer->lookahead == '\n'){
            lexer->advance(lexer, false);
            lexer->mark_end(lexer);
            return;
        }
        lexer->advance(lexer, false);
    }
}
//------------------------------------------------------------------------------

static bool finish_block_comment(TSLexer* lexer)
{
    while(!lexer->eof(lexer)){
        if(lexer->lookahead == '*'){
            lexer->advance(lexer, false);
            if(lexer->lookahead == '/'){
                lexer->advance(lexer, false);
                lexer->mark_end(lexer);
                return true;
            }
        }else{
            lexer->advance(lexer, false);
        }
    }
}
//------------------------------------------------------------------------------

static bool may_start_with_digit(const bool* valid_symbols)
{
    return valid_symbols[TOKEN_DECIMAL_LITERAL]       ||
           valid_symbols[TOKEN_DECIMAL_LITERAL_FLOAT] ||
           valid_symbols[TOKEN_BASED_LITERAL]         ||
           valid_symbols[TOKEN_BASED_LITERAL_FLOAT]   ||
           valid_symbols[TOKEN_BIT_STRING_LITERAL];
}
//------------------------------------------------------------------------------

static int parse_integer(TSLexer* lexer)
{
    int result = 0;
    while(!lexer->eof(lexer)){
        lexer->mark_end(lexer);
        if(lexer->lookahead == '_') lexer->advance(lexer, false);
        if(lexer->lookahead < '0' || lexer->lookahead > '9') return result;

        result *= 10;
        result += lexer->lookahead - '0';
        lexer->advance(lexer, false);
    }
    return result;
}
//------------------------------------------------------------------------------

static bool parse_decimal_exponent(TSLexer* lexer)
{
    lexer->advance(lexer, false);
    if(lexer->lookahead == '+' || lexer->lookahead == '-') lexer->advance(lexer, false);
    if(lexer->lookahead < '0' || lexer->lookahead > '9') return false;

    parse_integer(lexer);

    return true;
}
//------------------------------------------------------------------------------

static bool parse_decimal_fraction(TSLexer* lexer)
{
    lexer->advance(lexer, false);
    if(lexer->lookahead < '0' || lexer->lookahead > '9') return false;

    lexer->result_symbol = TOKEN_DECIMAL_LITERAL_FLOAT;
    parse_integer(lexer);

    if(lexer->lookahead == 'e' || lexer->lookahead == 'E'){
        return parse_decimal_exponent(lexer);
    }
    return true;
}
//------------------------------------------------------------------------------

static int to_digit(int32_t character)
{
    if(character >= '0' && character <= '9') return character - '0';
    if(character >= 'a' && character <= 'z') return character - 'a' + 10;
    if(character >= 'A' && character <= 'Z') return character - 'A' + 10;
    return -1;
}
//------------------------------------------------------------------------------

static bool based_integer(TSLexer* lexer, int base)
{
    while(!lexer->eof(lexer)){
        lexer->mark_end(lexer);
        if(lexer->lookahead == '_') lexer->advance(lexer, false);
        int digit = to_digit(lexer->lookahead);
        if(digit < 0) return true;
        if(digit >= base) return false;
        lexer->advance(lexer, false);
    }
    return true;
}
//------------------------------------------------------------------------------

static bool parse_base_literal(TSLexer* lexer, int base)
{
    lexer->advance(lexer, false);
    lexer->result_symbol = TOKEN_BASED_LITERAL;

    if(!based_integer(lexer, base)) return false;
    if(lexer->lookahead == '.'){
        lexer->advance(lexer, false);
        lexer->result_symbol = TOKEN_BASED_LITERAL_FLOAT;
        if(!based_integer(lexer, base)) return false;
    }
    if(lexer->lookahead != '#') return false;
    lexer->advance(lexer, false);
    lexer->mark_end(lexer);
    if(lexer->lookahead == 'e' || lexer->lookahead == 'E'){
        lexer->result_symbol = TOKEN_BASED_LITERAL_FLOAT;
        return parse_decimal_exponent(lexer);
    }
    return true;
}
//------------------------------------------------------------------------------

static bool parse_digit_based_literal(TSLexer* lexer)
{
    TokenType type;

    lexer->result_symbol = TOKEN_DECIMAL_LITERAL;

    int base = parse_integer(lexer);
    debug("base = %d", base);
    // NOTE: VHDL-2008 limits the base to 16, but I feel it's pointless to
    //       enforce, so I don't.  A future version will most likely relax
    //       that rule.

    switch(lowercase(lexer->lookahead)){
        case '.':
            return parse_decimal_fraction(lexer);

        case 'e':
            lexer->result_symbol = TOKEN_DECIMAL_LITERAL_FLOAT;
            return parse_decimal_exponent(lexer);

        case '#':
            return parse_base_literal(lexer, base);

        case 'b':
            lexer->advance(lexer, false);
            if(lexer->lookahead != '"') return true;
            lexer->advance(lexer, false);
            lexer->result_symbol = TOKEN_BIT_STRING_LITERAL;
            return finish_string_literal(lexer, BASE_SPECIFIER_BINARY);
        case 'o':
            lexer->advance(lexer, false);
            if(lexer->lookahead != '"') return true;
            lexer->advance(lexer, false);
            lexer->result_symbol = TOKEN_BIT_STRING_LITERAL;
            return finish_string_literal(lexer, BASE_SPECIFIER_OCTAL);
        case 'd':
            lexer->advance(lexer, false);
            if(lexer->lookahead != '"') return true;
            lexer->advance(lexer, false);
            lexer->result_symbol = TOKEN_BIT_STRING_LITERAL;
            return finish_string_literal(lexer, BASE_SPECIFIER_DECIMAL);
        case 'x':
            lexer->advance(lexer, false);
            if(lexer->lookahead != '"') return true;
            lexer->advance(lexer, false);
            lexer->result_symbol = TOKEN_BIT_STRING_LITERAL;
            return finish_string_literal(lexer, BASE_SPECIFIER_HEX);

        case 'u':
        case 's':
            switch(advance(lexer)){
                case 'b':
                    type = BASE_SPECIFIER_BINARY;
                    break;
                case 'o':
                    type = BASE_SPECIFIER_OCTAL;
                    break;
                case 'x':
                    type = BASE_SPECIFIER_HEX;
                    break;
                default:
                    return true;
            }
            lexer->advance(lexer, false);
            if(lexer->lookahead != '"') return true;
            lexer->advance(lexer, false);
            lexer->result_symbol = TOKEN_BIT_STRING_LITERAL;
            return finish_string_literal(lexer, type);

        default:
            return true;
    }
}
//------------------------------------------------------------------------------

static bool graphic_characters(TSLexer* lexer)
{
    if(lexer->lookahead == '\n' || lexer->lookahead == '\r') return false;

    while(!lexer->eof(lexer)){
        debug("lookahead = %c(0x%x)", (char)lexer->lookahead, lexer->lookahead);
        if(lexer->lookahead == ' '  || lexer->lookahead == '\t' ||
           lexer->lookahead == '\n' || lexer->lookahead == '\r'){
            return true;
        }
        lexer->advance(lexer, false);
    }
    return false;
}
//------------------------------------------------------------------------------

static void show_looking_for(const bool* valid_symbols)
{
    #ifdef DEBUG
        debug("Looking for:");
        for(int n = 0; n < ERROR_SENTINEL; n++){
            if(valid_symbols[n]) printf("    %s\n", token_type_to_string(n));
        }
        printf("\n");
    #endif
}
//------------------------------------------------------------------------------

bool tree_sitter_vhdl_external_scanner_scan(Scanner* scanner, TSLexer* lexer, const bool* valid_symbols)
{
    if(valid_symbols[ERROR_SENTINEL]){
        debug("Error correction mode");
        // return false;
    }else{
        show_looking_for(valid_symbols);
    }

    skip_whitespace(scanner, lexer);

    if(valid_symbols[END_OF_FILE] && lexer->eof(lexer)){
        lexer->result_symbol = END_OF_FILE;
        debug("Returning type END_OF_FILE");
        return true;

    }else if(valid_symbols[IDENTIFIER] && lexer->lookahead == '\\'){
        lexer->advance(lexer, false);
        if(!bounded_token(lexer, '\\')) return false;
        lexer->result_symbol = IDENTIFIER;
        debug("Returning type IDENTIFIER");
        return true;

    }else if(valid_symbols[TOKEN_CHARACTER_LITERAL] && lexer->lookahead == '\''){
        lexer->advance(lexer, false);
        if(lexer->eof(lexer)) return false;
        lexer->advance(lexer, false);
        if(lexer->lookahead != '\'') return false;
        lexer->advance(lexer, false);
        lexer->result_symbol = TOKEN_CHARACTER_LITERAL;
        debug("Returning type TOKEN_CHARACTER_LITERAL");
        return true;

    }else if(lexer->lookahead >= '0' && lexer->lookahead <= '9'){
        if(!may_start_with_digit(valid_symbols)) return false;
        if(!parse_digit_based_literal(lexer)) return false;
        debug("returning type %s", token_type_to_string(lexer->result_symbol));
        return true;

    }else if(!valid_symbols[ERROR_SENTINEL] && valid_symbols[DIRECTIVE_BODY] && graphic_characters(lexer)){
        lexer->result_symbol = DIRECTIVE_BODY;
        debug("returning type DIRECTIVE_BODY");
        return true;
    }

    bool first_char_is_letter = (lexer->lookahead >= 'a' && lexer->lookahead <= 'z') ||
                                (lexer->lookahead >= 'A' && lexer->lookahead <= 'Z');

    bool first_char_is_double_quote = (lexer->lookahead == '"');

    TypeNode* type = token_tree_match(token_tree, lexer);

    if(!type && first_char_is_letter){
        /* This works because all registered tokens in the search tree that
         * start with a letter are also valid identifiers.  If the tree search
         * exits early, whatever came before is a valid identifier
         *
         * The underscore corner cases are handled by IDENTIFIER_EXPECTING_LETTER
         */
        lexer->mark_end(lexer);
        finish_identifier(lexer, false);
        lexer->result_symbol = IDENTIFIER;
        debug("Returning type IDENTIFIER");
        return valid_symbols[IDENTIFIER];
    }

    if(!type && first_char_is_double_quote){
        if(!bounded_token(lexer, '"')) return false;
        lexer->result_symbol = TOKEN_STRING_LITERAL;
        debug("Returning type TOKEN_STRING_LITERAL");
        return valid_symbols[TOKEN_STRING_LITERAL];
    }

    bool found_can_be_identifier    = false;
    bool found_cannot_be_identifier = false;

    while(type){
        if(type->type == COMMENT_LINE_START){
            finish_line_comment(lexer);
            lexer->result_symbol = TOKEN_COMMENT;
            debug("Returning type TOKEN_COMMENT");
            return true;

        }else if(type->type == COMMENT_BLOCK_START){
            if(finish_block_comment(lexer)){
                lexer->result_symbol = TOKEN_COMMENT;
                debug("Returning type TOKEN_COMMENT");
                return true;
            }

        }else if(can_start_identifier(type->type) &&
            finish_identifier(lexer, type->type == IDENTIFIER_EXPECTING_LETTER)){
            lexer->result_symbol = IDENTIFIER;
            debug("Returning type IDENTIFIER");
            return true;

        }else if(is_base_specifier(type->type)){
            if(finish_string_literal(lexer, type->type)){
                lexer->result_symbol = TOKEN_BIT_STRING_LITERAL;
                debug("Returning type TOKEN_BIT_STRING_LITERAL");
                return true;
            }

        }else if(type == TOKEN_OPERATOR_SYMBOL){
            if(lexer->lookahead == '"'){
                lexer->advance(lexer, false);
                if(!bounded_token(lexer, '"')) return false;
                lexer->result_symbol = TOKEN_STRING_LITERAL;
                if(valid_symbols[TOKEN_STRING_LITERAL]){
                    debug("Returning type TOKEN_STRING_LITERAL");
                    return true;
                }else{
                    debug("Returning false");
                    return false;
                }
            }
            if(valid_symbols[TOKEN_OPERATOR_SYMBOL]){
                lexer->result_symbol = TOKEN_OPERATOR_SYMBOL;
                debug("Returning type TOKEN_OPERATOR_SYMBOL");
                return true;
            }else if(valid_symbols[TOKEN_STRING_LITERAL]){
                lexer->result_symbol = TOKEN_STRING_LITERAL;
                debug("Returning type TOKEN_STRING_LITERAL");
                return true;
            }
            debug("Returning false");
            return false;

        }else if(type->type < ERROR_SENTINEL && valid_symbols[type->type]){
            lexer->result_symbol = type->type;

            if(scanner->is_in_directive){
               scanner->is_in_directive = (type->type != DIRECTIVE_NEWLINE);
            }else{
               scanner->is_in_directive = (type->type == DELIMITER_GRAVE_ACCENT);
            }

            debug("Returning type %s", token_type_to_string(type->type));
            return true;

        }else if(can_be_identifier(scanner, type->type)){
            found_can_be_identifier = true;
        }else{
            found_cannot_be_identifier = true;
        }
        type = type->next;
    }
    if(valid_symbols[IDENTIFIER] && found_can_be_identifier && !found_cannot_be_identifier){
        lexer->result_symbol = IDENTIFIER;
        debug("Returning type IDENTIFIER");
        return true;
    }

    debug("Returning false...");
    return false;
}
//------------------------------------------------------------------------------


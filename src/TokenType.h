#ifndef TokenType_h
#define TokenType_h
//------------------------------------------------------------------------------

typedef enum TokenTypeTag{
    IDENTIFIER,

    RESERVED_ABS,
    RESERVED_ACCESS,
    RESERVED_AFTER,
    RESERVED_ALIAS,
    RESERVED_ALL,
    RESERVED_AND,
    RESERVED_ARCHITECTURE,
    RESERVED_ARRAY,
    RESERVED_ASSERT,
    RESERVED_ASSUME,
    RESERVED_ATTRIBUTE,
    RESERVED_BEGIN,
    RESERVED_BLOCK,
    RESERVED_BODY,
    RESERVED_BUFFER,
    RESERVED_BUS,
    RESERVED_CASE,
    RESERVED_COMPONENT,
    RESERVED_CONFIGURATION,
    RESERVED_CONSTANT,
    RESERVED_CONTEXT,
    RESERVED_COVER,
    RESERVED_DEFAULT,
    RESERVED_DISCONNECT,
    RESERVED_DOWNTO,
    RESERVED_ELSE,
    RESERVED_ELSIF,
    RESERVED_END,
    RESERVED_ENTITY,
    RESERVED_EXIT,
    RESERVED_FAIRNESS,
    RESERVED_FILE,
    RESERVED_FOR,
    RESERVED_FORCE,
    RESERVED_FUNCTION,
    RESERVED_GENERATE,
    RESERVED_GENERIC,
    RESERVED_GROUP,
    RESERVED_GUARDED,
    RESERVED_IF,
    RESERVED_IMPURE,
    RESERVED_IN,
    RESERVED_INERTIAL,
    RESERVED_INOUT,
    RESERVED_IS,
    RESERVED_LABEL,
    RESERVED_LIBRARY,
    RESERVED_LINKAGE,
    RESERVED_LITERAL,
    RESERVED_LOOP,
    RESERVED_MAP,
    RESERVED_MOD,
    RESERVED_NAND,
    RESERVED_NEW,
    RESERVED_NEXT,
    RESERVED_NOR,
    RESERVED_NOT,
    RESERVED_NULL,
    RESERVED_OF,
    RESERVED_ON,
    RESERVED_OPEN,
    RESERVED_OR,
    RESERVED_OTHERS,
    RESERVED_OUT,
    RESERVED_PACKAGE,
    RESERVED_PARAMETER,
    RESERVED_PORT,
    RESERVED_POSTPONED,
    RESERVED_PROCEDURE,
    RESERVED_PROCESS,
    RESERVED_PROPERTY,
    RESERVED_PROTECTED,
    RESERVED_PRIVATE,
    RESERVED_PURE,
    RESERVED_RANGE,
    RESERVED_RECORD,
    RESERVED_REGISTER,
    RESERVED_REJECT,
    RESERVED_RELEASE,
    RESERVED_REM,
    RESERVED_REPORT,
    RESERVED_RESTRICT,
    RESERVED_RETURN,
    RESERVED_ROL,
    RESERVED_ROR,
    RESERVED_SELECT,
    RESERVED_SEQUENCE,
    RESERVED_SEVERITY,
    RESERVED_SIGNAL,
    RESERVED_SHARED,
    RESERVED_SLA,
    RESERVED_SLL,
    RESERVED_SRA,
    RESERVED_SRL,
    RESERVED_STRONG,
    RESERVED_SUBTYPE,
    RESERVED_THEN,
    RESERVED_TO,
    RESERVED_TRANSPORT,
    RESERVED_TYPE,
    RESERVED_UNAFFECTED,
    RESERVED_UNITS,
    RESERVED_UNTIL,
    RESERVED_USE,
    RESERVED_VARIABLE,
    RESERVED_VIEW,
    RESERVED_VMODE,
    RESERVED_VPKG,
    RESERVED_VPROP,
    RESERVED_VUNIT,
    RESERVED_WAIT,
    RESERVED_WHEN,
    RESERVED_WHILE,
    RESERVED_WITH,
    RESERVED_XNOR,
    RESERVED_XOR,

    RESERVED_END_MARKER, // Internal use only

    DIRECTIVE_BODY,
    DIRECTIVE_CONSTANT_BUILTIN,
    DIRECTIVE_ERROR,
    DIRECTIVE_NEWLINE,
    DIRECTIVE_PROTECT,
    DIRECTIVE_WARNING,

    DIRECTIVE_END_MARKER, // Internal use only

    DELIMITER_GRAVE_ACCENT,
    DELIMITER_BOX,

    DELIMITER_END_MARKER, // Internal use only

    TOKEN_DECIMAL_LITERAL,
    TOKEN_DECIMAL_LITERAL_FLOAT,
    TOKEN_BASED_LITERAL,
    TOKEN_BASED_LITERAL_FLOAT,
    TOKEN_CHARACTER_LITERAL,
    TOKEN_STRING_LITERAL,
    TOKEN_BIT_STRING_LITERAL,
    TOKEN_OPERATOR_SYMBOL,
    TOKEN_COMMENT,

    TOKEN_END_MARKER, // Internal use only

    ATTRIBUTE_FUNCTION,
    ATTRIBUTE_IMPURE_FUNCTION,
    ATTRIBUTE_MODE_VIEW,
    ATTRIBUTE_PURE_FUNCTION,
    ATTRIBUTE_RANGE,
    ATTRIBUTE_SIGNAL,
    ATTRIBUTE_SUBTYPE,
    ATTRIBUTE_TYPE,
    ATTRIBUTE_VALUE,

    LIBRARY_ATTRIBUTE,
    LIBRARY_CONSTANT,
    LIBRARY_CONSTANT_BOOLEAN,
    LIBRARY_CONSTANT_CHARACTER,
    LIBRARY_CONSTANT_DEBUG,
    LIBRARY_CONSTANT_UNIT,
    LIBRARY_FUNCTION,
    LIBRARY_NAMESPACE,
    LIBRARY_TYPE,

    END_OF_FILE,

    ERROR_SENTINEL,

    // For internal use only...
    COMMENT_LINE_START,
    COMMENT_BLOCK_START,

    BASE_SPECIFIER_BINARY,
    BASE_SPECIFIER_OCTAL,
    BASE_SPECIFIER_DECIMAL,
    BASE_SPECIFIER_HEX,

    // Used to handle identifier corner cases
    IDENTIFIER_EXPECTING_LETTER
} TokenType;
//------------------------------------------------------------------------------

const char* token_type_to_string(TokenType type);

bool can_be_identifier   (Scanner* scanner, TokenType type);
bool can_start_identifier(TokenType type);
bool is_base_specifier   (TokenType type);
//------------------------------------------------------------------------------

#ifdef DEBUG
    const char* token_type_to_string(TokenType type)
    {
        switch(type){
            case IDENTIFIER:                               return "IDENTIFIER";

            case RESERVED_ABS:                             return "RESERVED_ABS";
            case RESERVED_ACCESS:                          return "RESERVED_ACCESS";
            case RESERVED_AFTER:                           return "RESERVED_AFTER";
            case RESERVED_ALIAS:                           return "RESERVED_ALIAS";
            case RESERVED_ALL:                             return "RESERVED_ALL";
            case RESERVED_AND:                             return "RESERVED_AND";
            case RESERVED_ARCHITECTURE:                    return "RESERVED_ARCHITECTURE";
            case RESERVED_ARRAY:                           return "RESERVED_ARRAY";
            case RESERVED_ASSERT:                          return "RESERVED_ASSERT";
            case RESERVED_ASSUME:                          return "RESERVED_ASSUME";
            case RESERVED_ATTRIBUTE:                       return "RESERVED_ATTRIBUTE";
            case RESERVED_BEGIN:                           return "RESERVED_BEGIN";
            case RESERVED_BLOCK:                           return "RESERVED_BLOCK";
            case RESERVED_BODY:                            return "RESERVED_BODY";
            case RESERVED_BUFFER:                          return "RESERVED_BUFFER";
            case RESERVED_BUS:                             return "RESERVED_BUS";
            case RESERVED_CASE:                            return "RESERVED_CASE";
            case RESERVED_COMPONENT:                       return "RESERVED_COMPONENT";
            case RESERVED_CONFIGURATION:                   return "RESERVED_CONFIGURATION";
            case RESERVED_CONSTANT:                        return "RESERVED_CONSTANT";
            case RESERVED_CONTEXT:                         return "RESERVED_CONTEXT";
            case RESERVED_COVER:                           return "RESERVED_COVER";
            case RESERVED_DEFAULT:                         return "RESERVED_DEFAULT";
            case RESERVED_DISCONNECT:                      return "RESERVED_DISCONNECT";
            case RESERVED_DOWNTO:                          return "RESERVED_DOWNTO";
            case RESERVED_ELSE:                            return "RESERVED_ELSE";
            case RESERVED_ELSIF:                           return "RESERVED_ELSIF";
            case RESERVED_END:                             return "RESERVED_END";
            case RESERVED_ENTITY:                          return "RESERVED_ENTITY";
            case RESERVED_EXIT:                            return "RESERVED_EXIT";
            case RESERVED_FAIRNESS:                        return "RESERVED_FAIRNESS";
            case RESERVED_FILE:                            return "RESERVED_FILE";
            case RESERVED_FOR:                             return "RESERVED_FOR";
            case RESERVED_FORCE:                           return "RESERVED_FORCE";
            case RESERVED_FUNCTION:                        return "RESERVED_FUNCTION";
            case RESERVED_GENERATE:                        return "RESERVED_GENERATE";
            case RESERVED_GENERIC:                         return "RESERVED_GENERIC";
            case RESERVED_GROUP:                           return "RESERVED_GROUP";
            case RESERVED_GUARDED:                         return "RESERVED_GUARDED";
            case RESERVED_IF:                              return "RESERVED_IF";
            case RESERVED_IMPURE:                          return "RESERVED_IMPURE";
            case RESERVED_IN:                              return "RESERVED_IN";
            case RESERVED_INERTIAL:                        return "RESERVED_INERTIAL";
            case RESERVED_INOUT:                           return "RESERVED_INOUT";
            case RESERVED_IS:                              return "RESERVED_IS";
            case RESERVED_LABEL:                           return "RESERVED_LABEL";
            case RESERVED_LIBRARY:                         return "RESERVED_LIBRARY";
            case RESERVED_LINKAGE:                         return "RESERVED_LINKAGE";
            case RESERVED_LITERAL:                         return "RESERVED_LITERAL";
            case RESERVED_LOOP:                            return "RESERVED_LOOP";
            case RESERVED_MAP:                             return "RESERVED_MAP";
            case RESERVED_MOD:                             return "RESERVED_MOD";
            case RESERVED_NAND:                            return "RESERVED_NAND";
            case RESERVED_NEW:                             return "RESERVED_NEW";
            case RESERVED_NEXT:                            return "RESERVED_NEXT";
            case RESERVED_NOR:                             return "RESERVED_NOR";
            case RESERVED_NOT:                             return "RESERVED_NOT";
            case RESERVED_NULL:                            return "RESERVED_NULL";
            case RESERVED_OF:                              return "RESERVED_OF";
            case RESERVED_ON:                              return "RESERVED_ON";
            case RESERVED_OPEN:                            return "RESERVED_OPEN";
            case RESERVED_OR:                              return "RESERVED_OR";
            case RESERVED_OTHERS:                          return "RESERVED_OTHERS";
            case RESERVED_OUT:                             return "RESERVED_OUT";
            case RESERVED_PACKAGE:                         return "RESERVED_PACKAGE";
            case RESERVED_PARAMETER:                       return "RESERVED_PARAMETER";
            case RESERVED_PORT:                            return "RESERVED_PORT";
            case RESERVED_POSTPONED:                       return "RESERVED_POSTPONED";
            case RESERVED_PROCEDURE:                       return "RESERVED_PROCEDURE";
            case RESERVED_PROCESS:                         return "RESERVED_PROCESS";
            case RESERVED_PROPERTY:                        return "RESERVED_PROPERTY";
            case RESERVED_PROTECTED:                       return "RESERVED_PROTECTED";
            case RESERVED_PRIVATE:                         return "RESERVED_PRIVATE";
            case RESERVED_PURE:                            return "RESERVED_PURE";
            case RESERVED_RANGE:                           return "RESERVED_RANGE";
            case RESERVED_RECORD:                          return "RESERVED_RECORD";
            case RESERVED_REGISTER:                        return "RESERVED_REGISTER";
            case RESERVED_REJECT:                          return "RESERVED_REJECT";
            case RESERVED_RELEASE:                         return "RESERVED_RELEASE";
            case RESERVED_REM:                             return "RESERVED_REM";
            case RESERVED_REPORT:                          return "RESERVED_REPORT";
            case RESERVED_RESTRICT:                        return "RESERVED_RESTRICT";
            case RESERVED_RETURN:                          return "RESERVED_RETURN";
            case RESERVED_ROL:                             return "RESERVED_ROL";
            case RESERVED_ROR:                             return "RESERVED_ROR";
            case RESERVED_SELECT:                          return "RESERVED_SELECT";
            case RESERVED_SEQUENCE:                        return "RESERVED_SEQUENCE";
            case RESERVED_SEVERITY:                        return "RESERVED_SEVERITY";
            case RESERVED_SIGNAL:                          return "RESERVED_SIGNAL";
            case RESERVED_SHARED:                          return "RESERVED_SHARED";
            case RESERVED_SLA:                             return "RESERVED_SLA";
            case RESERVED_SLL:                             return "RESERVED_SLL";
            case RESERVED_SRA:                             return "RESERVED_SRA";
            case RESERVED_SRL:                             return "RESERVED_SRL";
            case RESERVED_STRONG:                          return "RESERVED_STRONG";
            case RESERVED_SUBTYPE:                         return "RESERVED_SUBTYPE";
            case RESERVED_THEN:                            return "RESERVED_THEN";
            case RESERVED_TO:                              return "RESERVED_TO";
            case RESERVED_TRANSPORT:                       return "RESERVED_TRANSPORT";
            case RESERVED_TYPE:                            return "RESERVED_TYPE";
            case RESERVED_UNAFFECTED:                      return "RESERVED_UNAFFECTED";
            case RESERVED_UNITS:                           return "RESERVED_UNITS";
            case RESERVED_UNTIL:                           return "RESERVED_UNTIL";
            case RESERVED_USE:                             return "RESERVED_USE";
            case RESERVED_VARIABLE:                        return "RESERVED_VARIABLE";
            case RESERVED_VIEW:                            return "RESERVED_VIEW";
            case RESERVED_VMODE:                           return "RESERVED_VMODE";
            case RESERVED_VPKG:                            return "RESERVED_VPKG";
            case RESERVED_VPROP:                           return "RESERVED_VPROP";
            case RESERVED_VUNIT:                           return "RESERVED_VUNIT";
            case RESERVED_WAIT:                            return "RESERVED_WAIT";
            case RESERVED_WHEN:                            return "RESERVED_WHEN";
            case RESERVED_WHILE:                           return "RESERVED_WHILE";
            case RESERVED_WITH:                            return "RESERVED_WITH";
            case RESERVED_XNOR:                            return "RESERVED_XNOR";
            case RESERVED_XOR:                             return "RESERVED_XOR";

            case RESERVED_END_MARKER:                      return "RESERVED_END_MARKER";

            case DIRECTIVE_BODY:                           return "DIRECTIVE_BODY";
            case DIRECTIVE_CONSTANT_BUILTIN:               return "DIRECTIVE_CONSTANT_BUILTIN";
            case DIRECTIVE_ERROR:                          return "DIRECTIVE_ERROR";
            case DIRECTIVE_NEWLINE:                        return "DIRECTIVE_NEWLINE";
            case DIRECTIVE_PROTECT:                        return "DIRECTIVE_PROTECT";
            case DIRECTIVE_WARNING:                        return "DIRECTIVE_WARNING";

            case DIRECTIVE_END_MARKER:                     return "DIRECTIVE_END_MARKER";

            case DELIMITER_GRAVE_ACCENT:                   return "DELIMITER_GRAVE_ACCENT";
            case DELIMITER_BOX:                            return "DELIMITER_BOX";

            case DELIMITER_END_MARKER:                     return "DELIMITER_END_MARKER";

            case TOKEN_DECIMAL_LITERAL:                    return "TOKEN_DECIMAL_LITERAL";
            case TOKEN_DECIMAL_LITERAL_FLOAT:              return "TOKEN_DECIMAL_LITERAL_FLOAT";
            case TOKEN_BASED_LITERAL:                      return "TOKEN_BASED_LITERAL";
            case TOKEN_BASED_LITERAL_FLOAT:                return "TOKEN_BASED_LITERAL_FLOAT";
            case TOKEN_CHARACTER_LITERAL:                  return "TOKEN_CHARACTER_LITERAL";
            case TOKEN_STRING_LITERAL:                     return "TOKEN_STRING_LITERAL";
            case TOKEN_BIT_STRING_LITERAL:                 return "TOKEN_BIT_STRING_LITERAL";
            case TOKEN_OPERATOR_SYMBOL:                    return "TOKEN_OPERATOR_SYMBOL";
            case TOKEN_COMMENT:                            return "TOKEN_COMMENT";

            case TOKEN_END_MARKER:                         return "TOKEN_END_MARKER";

            case ATTRIBUTE_FUNCTION:                       return "ATTRIBUTE_FUNCTION";
            case ATTRIBUTE_IMPURE_FUNCTION:                return "ATTRIBUTE_IMPURE_FUNCTION";
            case ATTRIBUTE_MODE_VIEW:                      return "ATTRIBUTE_MODE_VIEW";
            case ATTRIBUTE_PURE_FUNCTION:                  return "ATTRIBUTE_PURE_FUNCTION";
            case ATTRIBUTE_RANGE:                          return "ATTRIBUTE_RANGE";
            case ATTRIBUTE_SIGNAL:                         return "ATTRIBUTE_SIGNAL";
            case ATTRIBUTE_SUBTYPE:                        return "ATTRIBUTE_SUBTYPE";
            case ATTRIBUTE_TYPE:                           return "ATTRIBUTE_TYPE";
            case ATTRIBUTE_VALUE:                          return "ATTRIBUTE_VALUE";

            case LIBRARY_ATTRIBUTE:                        return "LIBRARY_ATTRIBUTE";
            case LIBRARY_CONSTANT:                         return "LIBRARY_CONSTANT";
            case LIBRARY_CONSTANT_BOOLEAN:                 return "LIBRARY_CONSTANT_BOOLEAN";
            case LIBRARY_CONSTANT_CHARACTER:               return "LIBRARY_CONSTANT_CHARACTER";
            case LIBRARY_CONSTANT_DEBUG:                   return "LIBRARY_CONSTANT_DEBUG";
            case LIBRARY_CONSTANT_UNIT:                    return "LIBRARY_CONSTANT_UNIT";
            case LIBRARY_FUNCTION:                         return "LIBRARY_FUNCTION";
            case LIBRARY_NAMESPACE:                        return "LIBRARY_NAMESPACE";
            case LIBRARY_TYPE:                             return "LIBRARY_TYPE";

            case END_OF_FILE:                              return "END_OF_FILE";

            case ERROR_SENTINEL:                           return "ERROR_SENTINEL";

            case COMMENT_LINE_START:                       return "COMMENT_LINE_START";
            case COMMENT_BLOCK_START:                      return "COMMENT_BLOCK_START";

            case BASE_SPECIFIER_BINARY:                    return "BASE_SPECIFIER_BINARY";
            case BASE_SPECIFIER_OCTAL:                     return "BASE_SPECIFIER_OCTAL";
            case BASE_SPECIFIER_DECIMAL:                   return "BASE_SPECIFIER_DECIMAL";
            case BASE_SPECIFIER_HEX:                       return "BASE_SPECIFIER_HEX";

            case IDENTIFIER_EXPECTING_LETTER:              return "IDENTIFIER_EXPECTING_LETTER";

            default: return "Unknown type";
        }
    }
#else
    #define token_type_to_string(...) "DEBUG not defined for TokenType.h"
#endif
//------------------------------------------------------------------------------

bool can_be_identifier(Scanner* scanner, TokenType type)
{
    if(scanner->is_in_directive){
        return can_start_identifier(type);
    }else{
        return (type == IDENTIFIER) ||
               (type >  RESERVED_END_MARKER && type < DIRECTIVE_END_MARKER) ||
               (type >  TOKEN_END_MARKER    && type < ERROR_SENTINEL);
    }
}
//------------------------------------------------------------------------------

bool can_start_identifier(TokenType type)
{
    return (type >= IDENTIFIER       && type < DIRECTIVE_END_MARKER) ||
           (type >  TOKEN_END_MARKER && type < ERROR_SENTINEL      ) ||
           (type == IDENTIFIER_EXPECTING_LETTER);
}
//------------------------------------------------------------------------------

bool is_base_specifier(TokenType type)
{
    return (type >= BASE_SPECIFIER_BINARY && type <= BASE_SPECIFIER_HEX);
}
//------------------------------------------------------------------------------

#endif
//------------------------------------------------------------------------------

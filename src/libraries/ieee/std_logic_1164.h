#ifndef std_logic_1164_h
#define std_logic_1164_h
//------------------------------------------------------------------------------

#include "../../TokenType.h"
//------------------------------------------------------------------------------

static void register_ieee_std_logic_1164_types(TokenTree* token_tree)
{
    token_tree_insert(token_tree, "std_ulogic",        LIBRARY_TYPE);
    token_tree_insert(token_tree, "std_ulogic_vector", LIBRARY_TYPE);
    token_tree_insert(token_tree, "std_logic",         LIBRARY_TYPE);
    token_tree_insert(token_tree, "std_logic_vector",  LIBRARY_TYPE);
    token_tree_insert(token_tree, "x01",               LIBRARY_TYPE);
    token_tree_insert(token_tree, "x01z",              LIBRARY_TYPE);
    token_tree_insert(token_tree, "ux01",              LIBRARY_TYPE);
    token_tree_insert(token_tree, "ux01z",             LIBRARY_TYPE);
}
//------------------------------------------------------------------------------

static void register_ieee_std_logic_1164_functions(TokenTree* token_tree)
{
    token_tree_insert(token_tree, "resolved",             LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_bit",               LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_bitvector",         LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_stdulogic",         LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_stdlogicvector",    LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_stdulogicvector",   LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_01",                LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_x01",               LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_x01z",              LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_ux01",              LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "is_x",                 LIBRARY_FUNCTION);
}
//------------------------------------------------------------------------------

static void register_ieee_std_logic_1164_aliases(TokenTree* token_tree)
{
    token_tree_insert(token_tree, "to_bit_vector",        LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_bv",                LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_std_logic_vector",  LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_slv",               LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_std_ulogic_vector", LIBRARY_FUNCTION);
    token_tree_insert(token_tree, "to_sulv",              LIBRARY_FUNCTION);
}
//------------------------------------------------------------------------------

void register_ieee_std_logic_1164(TokenTree* token_tree)
{
    register_ieee_std_logic_1164_types    (token_tree);
    register_ieee_std_logic_1164_functions(token_tree);
    register_ieee_std_logic_1164_aliases  (token_tree);
}
//------------------------------------------------------------------------------

#endif
//------------------------------------------------------------------------------


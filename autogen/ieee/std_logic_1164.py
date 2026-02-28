def types(token_list):
    token_list.append(('std_ulogic',        'LIBRARY_TYPE'))
    token_list.append(('std_ulogic_vector', 'LIBRARY_TYPE'))
    token_list.append(('std_logic',         'LIBRARY_TYPE'))
    token_list.append(('std_logic_vector',  'LIBRARY_TYPE'))
    token_list.append(('x01',               'LIBRARY_TYPE'))
    token_list.append(('x01z',              'LIBRARY_TYPE'))
    token_list.append(('ux01',              'LIBRARY_TYPE'))
    token_list.append(('ux01z',             'LIBRARY_TYPE'))
#-------------------------------------------------------------------------------

def constants(token_list):
    token_list.append(('"0', 'STRING_LITERAL_STD_LOGIC_START'))
    token_list.append(('"1', 'STRING_LITERAL_STD_LOGIC_START'))
    token_list.append(('"u', 'STRING_LITERAL_STD_LOGIC_START'))
    token_list.append(('"x', 'STRING_LITERAL_STD_LOGIC_START'))
    token_list.append(('"z', 'STRING_LITERAL_STD_LOGIC_START'))
    token_list.append(('"w', 'STRING_LITERAL_STD_LOGIC_START'))
    token_list.append(('"l', 'STRING_LITERAL_STD_LOGIC_START'))
    token_list.append(('"h', 'STRING_LITERAL_STD_LOGIC_START'))
    token_list.append(('"-', 'STRING_LITERAL_STD_LOGIC_START'))

    token_list.append(('"0"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
    token_list.append(('"1"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
    token_list.append(('"u"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
    token_list.append(('"x"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
    token_list.append(('"z"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
    token_list.append(('"w"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
    token_list.append(('"l"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
    token_list.append(('"h"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
    token_list.append(('"-"', 'TOKEN_STRING_LITERAL_STD_LOGIC'))
#-------------------------------------------------------------------------------

def functions(token_list):
    token_list.append(('resolved',             'LIBRARY_FUNCTION'))
    token_list.append(('to_bit',               'LIBRARY_FUNCTION'))
    token_list.append(('to_bitvector',         'LIBRARY_FUNCTION'))
    token_list.append(('to_stdulogic',         'LIBRARY_FUNCTION'))
    token_list.append(('to_stdlogicvector',    'LIBRARY_FUNCTION'))
    token_list.append(('to_stdulogicvector',   'LIBRARY_FUNCTION'))
    token_list.append(('to_01',                'LIBRARY_FUNCTION'))
    token_list.append(('to_x01',               'LIBRARY_FUNCTION'))
    token_list.append(('to_x01z',              'LIBRARY_FUNCTION'))
    token_list.append(('to_ux01',              'LIBRARY_FUNCTION'))
    token_list.append(('is_x',                 'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def aliases(token_list):
    token_list.append(('to_bit_vector',        'LIBRARY_FUNCTION'))
    token_list.append(('to_bv',                'LIBRARY_FUNCTION'))
    token_list.append(('to_std_logic_vector',  'LIBRARY_FUNCTION'))
    token_list.append(('to_slv',               'LIBRARY_FUNCTION'))
    token_list.append(('to_std_ulogic_vector', 'LIBRARY_FUNCTION'))
    token_list.append(('to_sulv',              'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def register(token_list):
    types    (token_list)
    constants(token_list)
    functions(token_list)
    aliases  (token_list)
#-------------------------------------------------------------------------------


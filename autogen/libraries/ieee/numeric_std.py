def register_ieee_numeric_std_types(token_list):
    token_list.append(('unresolved_unsigned', 'LIBRARY_TYPE'))
    token_list.append(('unresolved_signed',   'LIBRARY_TYPE'))
    token_list.append(('unsigned',            'LIBRARY_TYPE'))
    token_list.append(('signed',              'LIBRARY_TYPE'))
#-------------------------------------------------------------------------------

def register_ieee_numeric_std_constants(token_list):
    token_list.append(('CopyRightNotice', 'LIBRARY_CONSTANT'))
#-------------------------------------------------------------------------------

def register_ieee_numeric_std_functions(token_list):
    token_list.append(('find_leftmost',  'LIBRARY_FUNCTION'))
    token_list.append(('find_rightmost', 'LIBRARY_FUNCTION'))
    token_list.append(('shift_left',     'LIBRARY_FUNCTION'))
    token_list.append(('shift_right',    'LIBRARY_FUNCTION'))
    token_list.append(('rotate_left',    'LIBRARY_FUNCTION'))
    token_list.append(('rotate_right',   'LIBRARY_FUNCTION'))
    token_list.append(('resize',         'LIBRARY_FUNCTION'))
    token_list.append(('to_integer',     'LIBRARY_FUNCTION'))
    token_list.append(('to_unsigned',    'LIBRARY_FUNCTION'))
    token_list.append(('to_signed',      'LIBRARY_FUNCTION'))
    token_list.append(('std_match',      'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def register_ieee_numeric_std_aliases(token_list):
    token_list.append(('u_unsigned', 'LIBRARY_TYPE'))
    token_list.append(('u_signed',   'LIBRARY_TYPE'))
#-------------------------------------------------------------------------------

def register_ieee_numeric_std(token_list):
    register_ieee_numeric_std_types    (token_list)
    register_ieee_numeric_std_constants(token_list)
    register_ieee_numeric_std_functions(token_list)
    register_ieee_numeric_std_aliases  (token_list)
#-------------------------------------------------------------------------------


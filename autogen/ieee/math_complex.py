def types(token_list):
    token_list.append(('complex',         'LIBRARY_TYPE'))
    token_list.append(('positive_real',   'LIBRARY_TYPE'))
    token_list.append(('principal_value', 'LIBRARY_TYPE'))
    token_list.append(('complex_polar',   'LIBRARY_TYPE'))
#-------------------------------------------------------------------------------

def constants(token_list):
    token_list.append(('math_cbase_1', 'LIBRARY_CONSTANT'))
    token_list.append(('math_cbase_j', 'LIBRARY_CONSTANT'))
    token_list.append(('math_czero',   'LIBRARY_CONSTANT'))
#-------------------------------------------------------------------------------

def functions(token_list):
    token_list.append(('cmplx',               'LIBRARY_FUNCTION'))
    token_list.append(('get_principal_value', 'LIBRARY_FUNCTION'))
    token_list.append(('complex_to_polar',    'LIBRARY_FUNCTION'))
    token_list.append(('polar_to_complex',    'LIBRARY_FUNCTION'))
    token_list.append(('arg',                 'LIBRARY_FUNCTION'))
    token_list.append(('conj',                'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def register(token_list):
    types    (token_list)
    constants(token_list)
    functions(token_list)
#-------------------------------------------------------------------------------


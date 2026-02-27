def register_ieee_float_pkg_types(token_list):
    token_list.append(('unresolved_float',    'LIBRARY_TYPE'))
    token_list.append(('float',               'LIBRARY_TYPE'))
    token_list.append(('unresolved_float32',  'LIBRARY_TYPE'))
    token_list.append(('float32',             'LIBRARY_TYPE'))
    token_list.append(('unresolved_float64',  'LIBRARY_TYPE'))
    token_list.append(('float64',             'LIBRARY_TYPE'))
    token_list.append(('unresolved_float128', 'LIBRARY_TYPE'))
    token_list.append(('float128',            'LIBRARY_TYPE'))
    token_list.append(('valid_fpstate',       'LIBRARY_TYPE'))
#-------------------------------------------------------------------------------

def register_ieee_float_pkg_constants(token_list):
    token_list.append(('nan',                'LIBRARY_CONSTANT'))
    token_list.append(('quiet_nan',          'LIBRARY_CONSTANT'))
    token_list.append(('neg_inf',            'LIBRARY_CONSTANT'))
    token_list.append(('neg_normal',         'LIBRARY_CONSTANT'))
    token_list.append(('neg_denormal',       'LIBRARY_CONSTANT'))
    token_list.append(('neg_zero',           'LIBRARY_CONSTANT'))
    token_list.append(('pos_zero',           'LIBRARY_CONSTANT'))
    token_list.append(('pos_denormal',       'LIBRARY_CONSTANT'))
    token_list.append(('pos_normal',         'LIBRARY_CONSTANT'))
    token_list.append(('pos_inf',            'LIBRARY_CONSTANT'))
    token_list.append(('isx',                'LIBRARY_CONSTANT'))

    token_list.append(('fphdlsynth_or_real', 'LIBRARY_CONSTANT'))
#-------------------------------------------------------------------------------

def register_ieee_float_pkg_functions(token_list):
    token_list.append(('classfp',      'LIBRARY_FUNCTION'))
    token_list.append(('add',          'LIBRARY_FUNCTION'))
    token_list.append(('subtract',     'LIBRARY_FUNCTION'))
    token_list.append(('multiply',     'LIBRARY_FUNCTION'))
    token_list.append(('dividebyp2',   'LIBRARY_FUNCTION'))
    token_list.append(('mac',          'LIBRARY_FUNCTION'))
    token_list.append(('eq',           'LIBRARY_FUNCTION'))
    token_list.append(('ne',           'LIBRARY_FUNCTION'))
    token_list.append(('lt',           'LIBRARY_FUNCTION'))
    token_list.append(('gt',           'LIBRARY_FUNCTION'))
    token_list.append(('le',           'LIBRARY_FUNCTION'))
    token_list.append(('ge',           'LIBRARY_FUNCTION'))
    token_list.append(('to_float32',   'LIBRARY_FUNCTION'))
    token_list.append(('to_float64',   'LIBRARY_FUNCTION'))
    token_list.append(('to_float128',  'LIBRARY_FUNCTION'))
    token_list.append(('to_float',     'LIBRARY_FUNCTION'))
    token_list.append(('realtobits',   'LIBRARY_FUNCTION'))
    token_list.append(('bitstoreal',   'LIBRARY_FUNCTION'))
    token_list.append(('break_number', 'LIBRARY_FUNCTION'))
    token_list.append(('normalize',    'LIBRARY_FUNCTION'))
    token_list.append(('copysign',     'LIBRARY_FUNCTION'))
    token_list.append(('logb',         'LIBRARY_FUNCTION'))
    token_list.append(('nextafter',    'LIBRARY_FUNCTION'))
    token_list.append(('unordered',    'LIBRARY_FUNCTION'))
    token_list.append(('finite',       'LIBRARY_FUNCTION'))
    token_list.append(('isnan',        'LIBRARY_FUNCTION'))
    token_list.append(('zerofp',       'LIBRARY_FUNCTION'))
    token_list.append(('nanfp',        'LIBRARY_FUNCTION'))
    token_list.append(('qnanfp',       'LIBRARY_FUNCTION'))
    token_list.append(('pos_inffp',    'LIBRARY_FUNCTION'))
    token_list.append(('neg_inffp',    'LIBRARY_FUNCTION'))
    token_list.append(('neg_zerofp',   'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def register_ieee_float_pkg_aliases(token_list):
    token_list.append(('u_float',    'LIBRARY_TYPE'))
    token_list.append(('u_float32',  'LIBRARY_TYPE'))
    token_list.append(('u_float64',  'LIBRARY_TYPE'))
    token_list.append(('u_float128', 'LIBRARY_TYPE'))
#-------------------------------------------------------------------------------

def register_ieee_float_pkg(token_list):
    register_ieee_float_pkg_types    (token_list)
    register_ieee_float_pkg_constants(token_list)
    register_ieee_float_pkg_functions(token_list)
    register_ieee_float_pkg_aliases  (token_list)
#-------------------------------------------------------------------------------


def types(token_list):
    token_list.append(('fixed_round_style_type',    'LIBRARY_TYPE'))
    token_list.append(('fixed_overflow_style_type', 'LIBRARY_TYPE'))
    token_list.append(('round_type',                'LIBRARY_TYPE'))
    token_list.append(('unresolved_ufixed',         'LIBRARY_TYPE'))
    token_list.append(('unresolved_sfixed',         'LIBRARY_TYPE'))
    token_list.append(('ufixed',                    'LIBRARY_TYPE'))
    token_list.append(('sfixed',                    'LIBRARY_TYPE'))
#-------------------------------------------------------------------------------

def constants(token_list):
    token_list.append(('fixed_round',    'LIBRARY_CONSTANT'))
    token_list.append(('fixed_truncate', 'LIBRARY_CONSTANT'))
    token_list.append(('fixed_saturate', 'LIBRARY_CONSTANT'))
    token_list.append(('fixed_wrap',     'LIBRARY_CONSTANT'))

    token_list.append(('round_nearest',  'LIBRARY_CONSTANT'))
    token_list.append(('round_inf',      'LIBRARY_CONSTANT'))
    token_list.append(('round_neginf',   'LIBRARY_CONSTANT'))
    token_list.append(('round_zero',     'LIBRARY_CONSTANT'))
#-------------------------------------------------------------------------------

def functions(token_list):
    token_list.append(('divide',       'LIBRARY_FUNCTION'))
    token_list.append(('reciprocal',   'LIBRARY_FUNCTION'))
    token_list.append(('remainder',    'LIBRARY_FUNCTION'))
    token_list.append(('modulo',       'LIBRARY_FUNCTION'))
    token_list.append(('add_carry',    'LIBRARY_FUNCTION'))
    token_list.append(('scalb',        'LIBRARY_FUNCTION'))
    token_list.append(('is_negative',  'LIBRARY_FUNCTION'))
    token_list.append(('to_ufixed',    'LIBRARY_FUNCTION'))
    token_list.append(('to_real',      'LIBRARY_FUNCTION'))
    token_list.append(('to_sfixed',    'LIBRARY_FUNCTION'))
    token_list.append(('ufixed_high',  'LIBRARY_FUNCTION'))
    token_list.append(('ufixed_low',   'LIBRARY_FUNCTION'))
    token_list.append(('sfixed_high',  'LIBRARY_FUNCTION'))
    token_list.append(('sfixed_low',   'LIBRARY_FUNCTION'))
    token_list.append(('saturate',     'LIBRARY_FUNCTION'))
    token_list.append(('to_ufix',      'LIBRARY_FUNCTION'))
    token_list.append(('to_sfix',      'LIBRARY_FUNCTION'))
    token_list.append(('ufix_high',    'LIBRARY_FUNCTION'))
    token_list.append(('ufix_low',     'LIBRARY_FUNCTION'))
    token_list.append(('sfix_high',    'LIBRARY_FUNCTION'))
    token_list.append(('sfix_low',     'LIBRARY_FUNCTION'))
    token_list.append(('from_string',  'LIBRARY_FUNCTION'))
    token_list.append(('from_ostring', 'LIBRARY_FUNCTION'))
    token_list.append(('from_hstring', 'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def aliases(token_list):
    token_list.append(('u_ufixed',           'LIBRARY_TYPE'))
    token_list.append(('u_sfixed',           'LIBRARY_TYPE'))

    token_list.append(('from_bstring',       'LIBRARY_FUNCTION'))
    token_list.append(('from_binary_string', 'LIBRARY_FUNCTION'))
    token_list.append(('from_octal_string',  'LIBRARY_FUNCTION'))
    token_list.append(('from_hex_string',    'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def register(token_list):
    types    (token_list)
    constants(token_list)
    functions(token_list)
    aliases  (token_list)
#-------------------------------------------------------------------------------


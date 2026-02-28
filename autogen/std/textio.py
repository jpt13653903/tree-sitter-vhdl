def types(token_list):
    token_list.append(('line',              'LIBRARY_TYPE'))
    token_list.append(('line_vector',       'LIBRARY_TYPE'))
    token_list.append(('text',              'LIBRARY_TYPE'))
    token_list.append(('side',              'LIBRARY_TYPE'))
    token_list.append(('side_range_record', 'LIBRARY_TYPE'))
    token_list.append(('width',             'LIBRARY_TYPE'))
#-------------------------------------------------------------------------------

def constants(token_list):
    token_list.append(('right',  'LIBRARY_CONSTANT'))
    token_list.append(('left',   'LIBRARY_CONSTANT'))

    #- These are files that open std_input and std_output
    token_list.append(('input',  'LIBRARY_CONSTANT'))
    token_list.append(('output', 'LIBRARY_CONSTANT'))
#-------------------------------------------------------------------------------

def functions(token_list):
    token_list.append(('file_open',     'LIBRARY_FUNCTION'))
    token_list.append(('file_open',     'LIBRARY_CONSTANT'))
    token_list.append(('file_close',    'LIBRARY_FUNCTION'))
    token_list.append(('file_rewind',   'LIBRARY_FUNCTION'))
    token_list.append(('file_seek',     'LIBRARY_FUNCTION'))
    token_list.append(('file_truncate', 'LIBRARY_FUNCTION'))
    token_list.append(('file_state',    'LIBRARY_FUNCTION'))
    token_list.append(('file_mode',     'LIBRARY_FUNCTION'))
    token_list.append(('file_position', 'LIBRARY_FUNCTION'))
    token_list.append(('file_size',     'LIBRARY_FUNCTION'))
    token_list.append(('file_canseek',  'LIBRARY_FUNCTION'))
    token_list.append(('read',          'LIBRARY_FUNCTION'))
    token_list.append(('write',         'LIBRARY_FUNCTION'))
    token_list.append(('flush',         'LIBRARY_FUNCTION'))
    token_list.append(('endfile',       'LIBRARY_FUNCTION'))
    token_list.append(('justify',       'LIBRARY_FUNCTION'))
    token_list.append(('readline',      'LIBRARY_FUNCTION'))
    token_list.append(('sread',         'LIBRARY_FUNCTION'))
    token_list.append(('oread',         'LIBRARY_FUNCTION'))
    token_list.append(('hread',         'LIBRARY_FUNCTION'))
    token_list.append(('writeline',     'LIBRARY_FUNCTION'))
    token_list.append(('tee',           'LIBRARY_FUNCTION'))
    token_list.append(('owrite',        'LIBRARY_FUNCTION'))
    token_list.append(('hwrite',        'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def aliases(token_list):
    token_list.append(('string_read',  'LIBRARY_FUNCTION'))
    token_list.append(('bread',        'LIBRARY_FUNCTION'))
    token_list.append(('binary_read',  'LIBRARY_FUNCTION'))
    token_list.append(('octal_read',   'LIBRARY_FUNCTION'))
    token_list.append(('hex_read',     'LIBRARY_FUNCTION'))
    token_list.append(('swrite',       'LIBRARY_FUNCTION'))
    token_list.append(('string_write', 'LIBRARY_FUNCTION'))
    token_list.append(('bwrite',       'LIBRARY_FUNCTION'))
    token_list.append(('binary_write', 'LIBRARY_FUNCTION'))
    token_list.append(('octal_write',  'LIBRARY_FUNCTION'))
    token_list.append(('hex_write',    'LIBRARY_FUNCTION'))
#-------------------------------------------------------------------------------

def register(token_list):
    types    (token_list)
    constants(token_list)
    functions(token_list)
    aliases  (token_list)
#-------------------------------------------------------------------------------


{:cimport, :internalize, :eq, :ffi, :lib, :cstr} = require 'test.unit.helpers'

-- fs = cimport './src/os/os.h'
-- remove these statements once 'cimport' is working properly for misc1.h
input = lib
ffi.cdef [[
void input_init(void);
bool input_ready(void);
]]

eof = false

describe 'input function', ->
    describe 'input_ready', ->
        it 'returns EOF after init and no input pending', ->
          input.input_init
          eq eof, input.input_ready!

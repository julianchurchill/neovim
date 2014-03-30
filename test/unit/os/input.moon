{:cimport, :internalize, :eq, :ffi, :lib, :cstr} = require 'test.unit.helpers'

-- fs = cimport './src/os/os.h'
-- remove these statements once 'cimport' is working properly for misc1.h
input = lib
ffi.cdef [[
void input_init(void);
bool input_ready(void);
uint32_t input_read(char* buf, uint32_t count);
]]

eof = false

describe 'input function', ->

    before_each ->
      input.input_init

    describe 'input_ready', ->
        it 'returns EOF after init and no input pending', ->
          eq eof, input.input_ready!

    describe 'input_read', ->
        it 'returns 0 count when reading 0 into buf', ->
            eq 0, input.input_read buf, 0

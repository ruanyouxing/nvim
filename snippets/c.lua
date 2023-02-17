local snippets = {}
local ls = require 'luasnip'
local s = ls.s
local t = ls.t
local i = ls.i
local fmt = require('luasnip.extras.fmt').fmt

local boilerplate = s(
  'boilerplate',
  fmt(
    [[
  #include<stdio.h>

  int main(int argc, char[] **argv)
  {{
    {}
    return 0;
  }}
]],
    { i(1, '') }
  )
)

table.insert(snippets, boilerplate)
return snippets

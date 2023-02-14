local snippets = {}
local ls = require 'luasnip'
local s = ls.s
local t = ls.t
local i = ls.i

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local firstSnippet = s('FirstSnippet', { t 'This is my first Snippet!', i(1, 'placeholertext') })
local secondSnippet = s(
  'secondSnippet',
  fmt(
    [[
  local {} = function({})
    {}
  end
]],
    {
      i(1, 'var'),
      i(2, 'arg'),
      i(3, 'body'),
    }
  )
)

table.insert(snippets, firstSnippet)
table.insert(snippets, secondSnippet)
return snippets

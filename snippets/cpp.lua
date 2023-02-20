local snippets = {}
local ls = require 'luasnip'
local s = ls.s
local t = ls.t
local i = ls.i
local fmt = require('luasnip.extras.fmt').fmt
local addSnippets = function(snippet)
  table.insert(snippets, snippet)
end
addSnippets(s(
  'main',
  fmt(
    [[
  int main(int argc, char **argv)
  {{
    {}
    return 0;
  }}
]],
    { i(1, '') }
  )
))

addSnippets(
  s(
    'Class',
    fmt(
      [[
  class {className} {classInheritence} {{
    private:
      {privateVars}
    public:
      {publicVars}
     {className}(){{
      {constructorFunc}
    }}
     ~{className}(){{
       {destructionFunc}
    }}
  }};
]],
      {
        className = i(1),
        classInheritence = i(2),
        privateVars = i(3),
        publicVars = i(4),
        constructorFunc = i(5),
        destructionFunc = i(6),
      },
      { repeat_duplicates = true }
    )
  )
)

return snippets

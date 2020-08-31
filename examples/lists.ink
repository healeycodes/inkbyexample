intro := 'We use the composite value for lists and maps. At runtime, lists are hashmaps with string keys as indices.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
each := std.each
f := std.format

'
    },
    {
        docs: 'Lists can be declared with array syntax.'
        code: 'names := [\'Alice\', \'Andrew\', \'Benny\']
log(names)
'
    },
    {
        docs: 'We imported <code>std.format</code>, which allows template strings, as <code>f</code>.'
        code: '
indexer := (name, index) => (
    values := {
        index: index
        name: name
    }
    log(f(\'{{ index }} - {{ name }}\', values))
)
each(names, indexer)
'
    },
    {
        docs: 'To access an element we use the dot syntax.'
        code: 'log(names.0) `` first element
log(names.(len(names) - 1)) `` last element
'
    }
]

end := ''

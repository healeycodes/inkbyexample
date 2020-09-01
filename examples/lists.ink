intro := 'Lists and maps share the same data structure — the composite value. At runtime, lists are hashmaps with string keys representing indices.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
each := std.each
append := std.append
slice := std.slice
range := std.range

'
    },
    {
        docs: 'Lists can be declared with array syntax.'
        code: 'names := [\'Alice\', \'Andrew\', \'Benny\']
log(names)
'
    },
    {
        docs: 'To access or mutate an element we use the dot syntax.'
        code: 'log(names.0) `` first element
log(names.(len(names) - 1)) `` last element

names.0 := \'Madeline\'
log(names)
'
    },
    {
        docs: ''
        code: '
indexer := (name, index) => (
    log(index)
    log(name)
)
each(names, indexer)
'
    },
    {
        docs: '<code>std.range</code> works similar to Python\'s <code>range</code>. It takes start, end, and step values and returns a list.'
        code: '
numbers := range(0, 6, 1)
log(numbers)
'
    },
    {
        docs: 'We can get a sublist with <code>std.slice</code>, and add to the end of a list with <code>std.append</code>.'
        code: '
half := slice(numbers, 0, 3)
log(half)

first := [-3, -2, -1, 0]
second := [1, 2, 3]
append(first, second)
log(first)
'
    }
]

end := ''

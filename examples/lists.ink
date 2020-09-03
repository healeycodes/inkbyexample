intro := 'Lists and maps share the same data structure — the composite value. At runtime, lists are hashmaps with string keys representing indices.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
reverse := std.reverse
slice := std.slice
range := std.range
each := std.each
join := std.join


'
    },
    {
        docs: 'Lists can be declared with array syntax.'
        code: 'names := [\'Alice\', \'Andrew\']
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
        docs: 'Like strings, we can append to the end of a list by mutating what would be the next index value.'
        code: 'names.len(names) := \'Francisca\'
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
        docs: 'We can get a sublist with <code>std.slice</code>, and join two lists to create a third with <code>std.join</code>.'
        code: '
half := slice(numbers, 0, 3)
log(half)

first := [98, 99]
second := [100, 101]
third := join(first, second)
log(third)

'
    },
    {
        docs: 'To reverse, use <code>std.reverse</code>. For other list utilities, refer to the <a href="https://dotink.co/docs/lib/">standard library</a>.'
        code: '
log(reverse([\'one\', \'two\', \'three\', ]))
'
    }
]

end := ''

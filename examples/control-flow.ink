intro := 'Instead of <code>if</code>/<code>else</code> branching, match expressions are used for control flow.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
filter := std.filter
log := std.log


'
    },
    {
        docs: 'Like the <code>switch</code> expression from other programming languages, the case clauses are checked from top to bottom. The checking stops when there\'s a match.'
        code: 'error := true
error :: {
    false -> log(\'No problem!\')
    true -> log(\'There is a problem..\')
}

'
    },
    {
        docs: 'The default, or <code>else</code>, branch is signified with the underscore character. This will match anything.'
        code: 'device := \'windows\'
device :: {
    \'linux\' -> log(\'Linux!\')
    \'macOS\' -> log(\'Mac!\')
    _ -> log(\'Neither Linux or Mac.\')
}

'
    },
    {
        docs: 'Composite values are deep compared so the underscore can be used to catch complex objects that, while different, have a similar characteristic.'
        code: 'first := {
    code: 2,
    user: \'alice@google\'
}
second := {
    code: 2,
    user: \'claire@amazon\'
}

checkEvent := event => event :: {
    {code: 2, user: _} -> log(\'All good!\')
    _ -> log(\'Bad event..\')
}

checkEvent(first)
checkEvent(second)

'
    },
    {
        docs: '<code>std.filter</code> can be passed a match expression. Here we use it to filter out odd numbers.'
        code: 'numbers := [1, 2, 3, 4, 5, 6]
onlyEven := num => num % 2 :: {
    0 -> true
    _ -> false
}
even := filter(numbers, onlyEven)
log(even)

'
    }
]

end := ''

intro := 'Like lists, maps use the composite value — Ink\'s single built-in data structure. At runtime, maps are hashmaps with string keys.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
clone := std.clone
each := std.each
log := std.log


'
    },
    {
        docs: ''
        code: 'observation := {
    weather: \'Sunny\'
    \'observedAt\': {
        time: 124125412
    }
}
log(observation)

'
    },
    {
        docs: 'Like lists, we use the dot syntax to access and mutate.'
        code: 'observation.(\'weather\') := \'Raining\'

'
    },
    {
        docs: 'If we know the key before runtime, we can use a shortcut and just write it out.'
        code: 'observation.weather := \'Raining\'
log(observation)

'
    },
    {
        docs: '<code>std.clone</code> can be used to create a copy of a map.'
        code: 'cloned := clone(observation)

'
    },
    {
        docs: 'We can iterate through the keys by calling <code>keys</code>.'
        code: 'each(keys(observation), (key) => (
    log(observation.(key))
))
'
    }
]

end := ''

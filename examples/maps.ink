intro := 'Like lists, maps use the composite value — the single built-in data structure. At runtime, maps are hashmaps with string keys.'

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
        docs: 'An identifier directly following the dot evaluates as a key.'
        code: 'observation.weather := \'Raining\'
log(observation)
'
    },
    {
        docs: '<code>std.clone</code> can be used to create a copy of a composite value so it works for both lists and maps.'
        code: 'cloned := clone(observation)
'
    },
    {
        docs: 'Here we iterate through the keys.'
        code: 'each(keys(observation), (key) => (
    log(observation.(key))
))
'
    }
]

end := ''

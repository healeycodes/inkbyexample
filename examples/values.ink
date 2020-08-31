intro := 'Ink has number, string, boolean, null, and composite values. Here are a few basic examples.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
'
    },
    {
        docs: 'Strings, which can be added together with +.'
        code: 'name := \'ada\' + \' \' + \'lovelace\'
log(name)
'
    },
    {
        docs: 'Numbers, which support arithmetic operations, and more advanced functions using built-in native functions.'
        code: 'length := (0.5 + 2 * 3 / 4 - 5) + ~6 % 7
log(length)

year := pow(10, 3) * 2 + 20
log(year)
'
    },
    {
        docs: 'Boolean.'
        code: 'authed := true
log(authed)
log(~authed)
'
    },
    {
        docs: 'Null.'
        code: 'exists := ()
log(exists)
'
    },
    {
        docs: 'Ink does not have immutable constants. By convention constant variables start with a capital letter. Otherwise, camelCase is used.'
        code: 'Language := \'Ink\'
'
    },
]

end := ''
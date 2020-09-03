intro := 'Ink has number, string, boolean, null, and composite values. Here are a few basic examples.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log


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
        docs: 'Strings, which can be added together with <code>+</code>, and appended to by mutating what would be the next index value.'
        code: 'name := \'ada\' + \' \' + \'lovelace\'
log(name)
name.len(name) := \'!\'
log(name)

'
    },
    {
        docs: 'Boolean.'
        code: 'authed := true
log(authed)
log(~authed)
log(true | false)
log(true & false)

'
    },
    {
        docs: 'Null.'
        code: 'exists := ()
log(exists)

'
    },
    {
        docs: 'Composite values, which are used for lists and maps.'
        code: 'primes := [2, 3, 5, 7]
log(primes)

menu := {
    apples: 1.00
    oranges: 1.50
}
log(menu)

'
    },
    {
        docs: 'We can get the value of a type with <code>type</code>.'
        code: 'log(type(0))

'
    }
]

end := ''
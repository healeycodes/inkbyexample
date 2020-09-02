intro := ''

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
'
    },
    {
        docs: 'Functions are created with the arrow <code>=&#x3E;</code> symbol.'
        code: '
shout := (word) => word + \'!\'
log(shout(\'Hello\'))

multiply := (x, y) => x * y
log(multiply(2, 8))
'
    },
    {
        docs: 'When a group of expressions follow the arrow symbol, the result of the final expression is the return value.'
        code: '` single argument parentheses are optional`
sayAndMultiply := num => (
    log(\'About to multiply \' + string(num) + \':\')

    ` the return value `
    num * num
)
log(sayAndMultiply(8))
'
    },
    {
        docs: 'Here\'s an example of tail recursion.'
        code: 'factorial := n => n :: {
    0 -> 1
    _ -> n * factorial(n-1)
}
log(factorial(5))
'
    },
    {
        docs: 'It\'s natural to use closures — functions that have access to the parent scope after the parent function has closed.'
        code: 'makeMultiplier := x => (
    y := y => x * y
)
multiplySeven := makeMultiplier(7)
multiplyTwenty := makeMultiplier(20)
log(multiplySeven(2))
log(multiplyTwenty(4))
'
    },
    {
        docs: 'This is also known as currying — functions that immediately evalute and return another function.'
        code: 'greeting := a => b => a + \' \' + b
message := greeting(\'Hello there,\')(\'General Kenobi\')
log(message)
'
    }
]

end := ''

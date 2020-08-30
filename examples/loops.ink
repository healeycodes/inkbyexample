intro := 'In Ink, there isn\'t a <code>for</code> loop construct. Instead, tail recursion is used.
          The standard library contains utility functions like <code>each</code>, <code>map</code>, <code>reduce</code>, <code>range</code>, and <code>filter</code>.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
filter := std.filter
range := std.range
each := std.each

start := 1
end := 9
step := 1
'
    },
    {
        docs: 'Like Python\'s <code>range</code>, we can create a composite value of the numbers 1 through 8 using <code>std.range</code>.'
        code: 'numbers := range(start, end, step)
log(numbers)
'
    },
    {
        docs: 'We can loop over these numbers with <code>std.each</code>.'
        code: 'each(numbers, num => log(num))
'
    },
    {
        docs: 'Perhaps we only want the even numbers.'
        code: 'evenNumbers := filter(numbers, num => num % 2 :: {
    0 -> true
    _ -> false
})
each(evenNumbers, num => log(num))
'
    },
    {
        docs: 'Or the sum if they were squared.'
        code: 'squares := map(numbers, num => num * num)
sumOfSquares := reduce(squares,
    (acc, item) => acc + item, 0
)
log(sumOfSquares)
'
    }
]

end := ''

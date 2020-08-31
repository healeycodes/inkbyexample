intro := 'Instead of a <code>for</code> loop construct, we use tail recursion.
          The standard library contains utility functions like <code>each</code>, <code>map</code>, and <code>reduce</code>.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
reduce := std.reduce
range := std.range
each := std.each
map := std.map

start := 0
end := 7
step := 1
'
    },
    {
        docs: 'Like Python\'s <code>range</code>, we can create a list of the numbers 0 through 6 using <code>std.range</code>.'
        code: 'numbers := range(start, end, step)
log(numbers)
'
    },
    {
        docs: 'We can loop over these numbers with <code>std.each</code>, which accepts a list and a function as arguments.'
        code: 'logger := num => log(num)
each(numbers, logger)
'
    },
    {
        docs: 'Let\'s create a new list with the squares of these numbers with <code>std.map</code>.'
        code: 'squares := map(numbers, num => num * num)
log(squares)
'
    },
    {
        docs: 'We can get the sum of these squares by using <code>std.reduce</code>.'
        code: 'sum := reduce(squares, (acc, num) => acc + num, 0)
log(sum)'
    }
]

end := 'For a full list of utility functions see the standard library <a href="https://dotink.co/docs/lib/">documentation</a>.
Example usage can be found in the source code of <code>std</code>.'

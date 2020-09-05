intro := 'Instead of a <code>for</code> loop construct, we use <a href="https://en.wikipedia.org/wiki/Tail_call">tail recursion</a>.
          The standard library contains utility functions — like <code>std.each</code>, <code>std.map</code>, and <code>std.reduce</code> — that can be used in place of a <code>for</code> loop.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
reduce := std.reduce
each := std.each
map := std.map


'
    },
    {
        docs: ''
        code: 'numbers := [0, 1, 2, 3, 4, 5, 6]

'
    },
    {
        docs: 'We can loop over a list with <code>std.each</code>, which accepts a list and a function as arguments.'
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

end := ''

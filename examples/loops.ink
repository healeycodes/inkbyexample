intro := 'Instead of a <code>for</code> loop construct, we use tail recursion.
          The standard library contains utility functions like <code>each</code>, <code>map</code>, <code>reduce</code>, and <code>filter</code>.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log
filter := std.filter
reduce := std.reduce
range := std.range
each := std.each
map := std.map

start := 1
end := 9
step := 1
'
    },
    {
        docs: 'Like Python\'s <code>range</code>, we can create a list of the numbers 1 through 8 using <code>std.range</code>.'
        code: 'numbers := range(start, end, step)
log(numbers)
'
    },
    {
        docs: 'We can loop over these numbers with <code>std.each</code>, which accepts a list and a function as arguments. Here the function is inlined but it can be defined beforehand too.'
        code: 'each(numbers, num => log(num))
'
    },
    {
        docs: 'Let\'s filter out the odd numbers with <code>std.filter</code> and then display them.'
        code: 'onlyEven := num => num % 2 :: {
    0 -> true
    _ -> false
}
evenNumbers := filter(numbers, onlyEven)
each(evenNumbers, num => log(num))
'
    }
]

end := ''

intro := 'The <code>quicksort</code> library provides a minimal Quicksort implementation that uses Hoare\'s partitioning.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log

qs := load(\'../vendor/quicksort\')
sortBy := qs.sortBy
sort! := qs.sort!
sort := qs.sort


'
    },
    {
        docs: 'We can sort a list in ascending order with <code>sort</code>.'
        code: 'numbers := [921, 14, 0, 0.002]
log(sort(numbers))

'
    },
    {
        docs: 'Function definitions that end in <code>!</code> mutate their arguments — like <code>sort!</code>.'
        code: 'temperatures := [33, 1, 5, 22]
sort!(temperatures)

` the existing list has changed `
log(temperatures)

'
    },
    {
        docs: '<code>sortBy</code> allows us to pass a predicate — a function that each item should be measured with.'
        code: 'menu := {
    apples: 1.50
    oranges: 2.00
    coconut: 3.50
    grapes: 1.75
}
items := [\'apples\', \'oranges\', \'coconut\', \'grapes\']

` sort items by their menu price `
log(sortBy(items, item => menu.(item)))

'
    }
]

end := ''

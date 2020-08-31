
            std := load('../vendor/std')
log := std.log
reduce := std.reduce
range := std.range
each := std.each
map := std.map

start := 0
end := 7
step := 1

            numbers := range(start, end, step)
log(numbers)

            logger := num => log(num)
each(numbers, logger)

            squares := map(numbers, num => num * num)
log(squares)

            sum := reduce(squares, (acc, num) => acc + num, 0)
log(sum)
std := load('../vendor/std')
each := std.each
log := std.log

str := load('../vendor/str')
split := str.split


dir('../examples/', files => each(files.data, file => file.dir :: {
    false -> (
        example := split(file.name, '.ink').0
        load('../tmp/' + example)
    )
    _ -> 'skip directory'
}))

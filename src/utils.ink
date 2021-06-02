std := load('../vendor/std')
str := load('../vendor/str')

cat := std.cat
log := std.log
map := std.map
encode := std.encode
hex := std.hex
digit? := str.digit?
letter? := str.letter?
upper := str.upper

urlEncode := s => cat(
    map(s, c => c :: {
        '-' -> c
        '_' -> c
        '~' -> c
        '.' -> c
        _ -> digit?(c) | letter?(c) :: {
            true -> c
            false -> len(hex(point(c))) < 10 :: {
                true -> '%0' + hex(point(c))
                false -> '%' + hex(point(c))
            }
        }
    }), ''
)

log(urlEncode('
'))

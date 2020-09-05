intro := 'Ink has access to standard input (stdin) and standard output (stdout). You can pipe input to an Ink program in the form <code>echo "Hello, World!" | ink program.ink</code>.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
scan := std.scan
log := std.log
f := std.format


'
    },
    {
        docs: 'To send data to standard output we can use the builtin <code>out</code>, which accepts a string, or the helper <code>std.log</code> which accepts strings and non-strings and adds a linebreak.'
        code: 'out(\'Hello, with a manual linebreak.
\')
log(7) `` print a number
log([1, 2]) `` a composite
log(() => ()) `` a function
log(()) `` or null
'
    },
    {
        docs: 'For reading in data from standard input, there is the builtin <code>in</code> as well as the helper <code>std.scan</code> which reads in a line.'
        code: 'prompt := (msg, cb) => (
    log(msg)
    scan(cb)
)
` usage:
prompt(\'Are you sure?\', msg => (
    log(msg)
))`

'
    },
    {
        docs: '<code>std.format</code> allows us to build template strings and pass in a map of values.'
        code: 'log(f(\'A message without any passed in values.\', {}))
log(f(\'The time is: {{ time }}.\', {time: time()}))
'
    }
]

end := ''

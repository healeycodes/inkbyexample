intro := ''

rows := [
    {
        docs: 'Our first program will print the classic "hello world" message. Here\'s the full source code.'
        code: 'std := load(\'../vendor/std\')
log := std.log

log(\'hello world\')'
    },
    {
        docs: 'We can add comments using the grave accent (U+0060). Anything between these two characters is commented out.'
        code: '`
A multiline comment
`

` A commonly used docstring format `
'
    },
    {
        docs: 'A double accent will comment the rest of the line.'
        code: '`` log(\'This should not run!\')
'
    }
]




end := 'To run the program, put the code in <code>hello-world.ink</code> and run it with the interpreter.'

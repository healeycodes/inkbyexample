intro := 'Our first program will print the classic "hello world" message. Here\'s the full source code.'

rows := [
    {
        docs: 'Ink programs can be imported by calling <code>load</code> and passing the relative path without <code>.ink</code>. Top level values are brought in as a map.'
        code: 'std := load(\'../vendor/std\')
log := std.log

log(\'hello world\')'
    },
    {
        docs: 'We can add comments using the grave accent (U+0060). Anything between these two characters is commented out.'
        code: '` A commonly used docstring format `

`
A multiline comment
`
'
    },
    {
        docs: 'A double accent will comment the rest of the line.'
        code: '`` log(\'This should not run!\')
'
    }
]




end := 'To run the program, put the code in <code>hello-world.ink</code> and run it with the interpreter.'

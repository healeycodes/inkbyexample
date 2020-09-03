intro := 'Ink can spawn child processes. The stdout data is passed to a callback when the process ends.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
each := std.each
log := std.log


'
    },
    {
        docs: 'Let\'s take a look at the files in the directory relative to the executing file (in this instance, this website\'s build script).'
        code: 'path := \'ls\' `` path to executable
arguments := []
stdin := \'\'
stdoutFn := out => log(out)
exec(path, arguments, stdin, stdoutFn)

'
    },
    {
        docs: '<code>args</code> gives us the command-line arguments for the current context. This can be useful if you\'re chaining Ink programs.'
        code: '
log(\'Arguments:\')
each(args(), arg => log(\'  \' + arg))
'
    }
]

end := ''

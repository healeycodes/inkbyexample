intro := ''

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
        docs: 'Tangibly related is getting the command-line arguments for the current context.'
        code: '
log(\'Arguments:\')
each(args(), arg => log(\'  \' + arg))
'
    }
]

end := ''

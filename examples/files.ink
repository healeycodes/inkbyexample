intro := 'You will usually interact with files through two <a href="https://dotink.co/docs/lib/">standard library</a> APIs — <code>std.readFile</code> and <code>std.writeFile</code>. The <a href="https://dotink.co/docs/runtime/">runtimes and builtins</a> documentation lists the operating system interfaces.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
writeFile := std.writeFile
readFile := std.readFile
slice := std.slice
log := std.log


'
    },
    {
        docs: 'Let\'s read in the README for this project.'
        code: '
readFile(\'../README.md\', data => (
    log(\'Read:\')
    log(
    ` data is the entire file content `
    slice(data, 0, 16))
))

'
    },
    {
        docs: 'If the read fails, null is passed to the callback. The read can fail if you try to access a file that doesn\'t exist. So we should handle that.'
        code: '
readFile(\'../doesnt-exist.md\', data => data :: {
    () -> log(\'The read failed.\')
    _ -> log(\'The read succeeded.\')
})

'
    },
    {
        docs: 'Here we write content to a file. If the file exists, it\'s truncated — otherwise the file is created. The path is relative to the executing file.'
        code: '
path := \'../tmp/_writeExample.txt\'
data := \'Some data. \'
writeFile(path, data, cb => cb :: {
    ` either true or null `
    true -> log(\'The write succeeded.\')
    _ -> log(\'The write failed.\')
})

'
    },
    {
        docs: '<code>make</code> can be used to recursively create directories.'
        code: '
make(\'../tmp/_makeExample/\', cb => cb.type :: {
    \'error\' -> (
        log(\'Make:\')
        log(\'  \' + string(cb.message))
    )
    _ -> log(\'Make succeeded.\')
})

'
    },
    {
        docs: 'We can get directory information with <code>dir</code>.'
        code: '
dir(\'../src/\', cb => cb.type :: {
    \'error\' -> log(\'Dir failed.\')
    ` cb.data is a list of files and directories`
    _ -> (
        log(\'Dir:\')
        log(\'  \' + string(cb.data.0))
    )
})

'
    },
    {
        docs: 'Similarly, <code>stat</code> returns metadata about an object in the file tree.'
        code: '

stat(\'../README.md\', cb => cb.type :: {
    \'error\' -> log(\'Stat failed.\')
    _ -> (
        log(\'Stat:\')
        log(\'  \' + string(cb))
    )
})

'
    }
]

end := 'We\'re not using ordered callbacks so the order of the logs will be dependant on the system calls when this website was last built and the code was evaluated. This is an example of Ink\'s event loop!'
    
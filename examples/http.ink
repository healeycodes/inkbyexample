intro := 'Ink can both send and receive HTTP requests. Both have a similar event shape.'

rows := [
    {
        docs: ''
        code: 'std := load(\'../vendor/std\')
log := std.log


'
    },
    {
        docs: 'We can initiate an HTTP request with <code>req</code>. It returns a function that aborts the request. Let\'s also time this request.'
        code: '
t := time()
data := {
    method: \'GET\'
    url: \'https://example.org\'
    headers: {}
    body: \'\'
}

close := req(data, evt => evt.type :: {
    ` this matches during a request fail 
      or if the request is aborted `
    \'error\' -> log(\'Error: \' + evt.message)
    _ -> (
        log(\'Req: \')
        elasped := string(time() - t)
        log(\'  elapsed time: \' + elasped)
        log(\'  \' + string(keys(evt.data)))
    )
})
log(\'This code runs while we request.\')
`` close() would abort the request


'
    },
    {
        docs: 'A HTTP web server can be started with <code>listen</code>. Similar to <code>req</code>, it returns a function that stops the server.'
        code: '
resp := {
    status: 200
    headers: {\'Content-Type\': \'text/plain\'}
    body: \'Hello from Ink land!\'
}
close := listen(\'0.0.0.0:80\', evt => evt.type :: {
    \'error\' -> log(\'Error: \' + evt.message)
    \'req\' -> (evt.end)(resp)
})
log(\'This code runs while we listen.\')

` stop the server `
close()
'
    }
]

end := ''

std := load('../vendor/std')
writeFile := std.writeFile
readFile := std.readFile
append := std.append
reduce := std.reduce
each := std.each
f := std.format
map := std.map
cat := std.cat
log := std.log

str := load('../vendor/str')
replace := str.replace
lower := str.lower
split := str.split

highlight := load('highlight').main

` in order to execute the code examples, they need to be written to disk `
evaluate := (fileName, source, cb) => (
    writeFile('../tmp/' + fileName + '.ink', source, err => err :: {
            () -> log('error creating source code file for: ' + example)
            _ -> (
                exec(args().0, ['-isolate', '../tmp/' + fileName + '.ink'], '', result => result :: {
                    () -> log('error executing program for: ' + example)
                    _ -> cb(result)
                })
            )
    })
)

renderIndexPage := (template, examples) => (
    ` render the index page with the list of examples and links `
    exampleList := reduce(examples, (acc, item) => (
        acc := acc + f('<li>
                        <a href="{{ path }}">{{ name }}</a>
                    </li>', {
            name: item
            path: replace(lower(item), ' ', '-') + '.html'
        })
    ), '')
    
    page := f(template, {
        firstExample: replace(lower(examples.0), ' ', '-') + '.html'
        exampleList: exampleList})
    writeFile('../public/index.html', page, result => result :: {
        () -> log('error writing index.html')
    })
)

renderExamplePages := (template, examples) => (
    each(examples, (example, i) => (
        fileName := replace(lower(example), ' ', '-')
        data := load('../examples/' + fileName)
        source := reduce(data.rows, (acc, item) => acc := acc + '
' + item.code, '')

        evaluate(fileName, source, result => (
            ` pages link to the next example if one exists `
            len(examples) :: {
                (i + 1) -> next := ''
                _ -> next := f('<p class="next">
                                    Next example: <a href="{{ path }}">{{ example }}</a>.
                                </p>',
                    {
                        path: replace(lower(examples.(i + 1)), ' ', '-') + '.html'
                        example: examples.(i + 1)
                    })
            }

            page := f(template, {
                name: example
                rows: reduce(data.rows, (acc, item) => (
                        class := (len(item.code) :: {
                            0 -> 'empty'
                            _ -> ''
                        })
                        acc := acc + f('<tr>
                                            <td class="docs"><p>{{ docs }}</p></td>
                                            <td class="code leading {{ class }}">
                                                <pre>{{ code }}</pre>
                                            </td>
                                        </tr>',
                        {
                            docs: item.docs
                            code: highlight(item.code)
                            class: class
                        })
                    ), f('<tr>
                            <td class="docs"><p>{{ intro }}</p></td>
                            <td class="code leading empty"></td>
                        </tr>',
                        {
                            intro: data.intro
                        })
                )
                program: f('<table>
                                <tr>
                                    <td class="docs"><p>{{ end }}</p></td>
                                    <td class="code leading">
                                        <pre><span class="gp">$</span> ink {{ fileName }}
<span class="go">{{ result }}</span></pre>
                                    </td>
                                </tr>
                            </table>',
                {
                    fileName: fileName + '.ink'
                    result: result.data
                    end: data.end
                })
                next: next
            })

            writeFile('../public/' + fileName + '.html', page, result => result :: {
                () -> log('error creating example: ' + example)
            })
        ))
    ))
)

` move over static content `
moveStatic := () => dir('../static', item => (
    each(item.data, file => (
        readFile('../static/' + file.name, data => (
            writeFile('../public/' + file.name, data, result => result :: {
                () -> log('error creating static file: ' + file.name)
            })
        ))
    ))
))

` setup folders `
createPublic := cb => make('../public', result => result :: {
    () -> log('error creating public folder')
    _ -> (
        moveStatic()
        cb()
    )
})
createTmp := () => make('../tmp', result => result :: {
    () -> log('error creating tmp folder')
})

examples := load('../examples').all
createPublic(() => (
    readFile('../templates/index.html', template => template :: {
        () -> log('error reading index template')
        _ -> renderIndexPage(template, examples)
    })
    readFile('../templates/example.html', template => template :: {
        () -> log('error reading example template')
        _ -> renderExamplePages(template, examples)
    })
))
createTmp()

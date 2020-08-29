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

renderIndexPage := (allExamples) => (
    ` render the index page with the list of examples and links `
    exampleList := reduce(allExamples, (acc, item) => (
        acc := acc + f('<li>
                        <a href="{{ path }}">{{ name }}</a>
                    </li>', {
            name: item
            path: replace(lower(item), ' ', '-') + '.html'
        })
    ), '')
    readFile('../templates/index.html', index => (
        page := f(index, {
            firstExample: replace(lower(allExamples.0), ' ', '-') + '.html'
            exampleList: exampleList})
        writeFile('../public/index.html', page, err => err :: {
            () -> log('error writing index.html')
        })
    ))
)

renderExamplePages := (allExamples) => (
    readFile('../templates/example.html', exampleTemplate => (

        each(allExamples, (example, i) => (
            fileName := replace(lower(example), ' ', '-')
            data := load('../examples/' + fileName)
            source := reduce(data.rows, (acc, item) => acc := acc + '
            ' + item.code, '')

            ` in order to execute the code examples, they need to be written to disk `
            writeFile('../tmp/' + fileName + '.ink', source, err => err :: {
                () -> log('error creating source code file for: ' + example)
                _ -> (
                    exec(args().0, ['-isolate', '../tmp/' + fileName + '.ink'], '', result => result :: {
                        () -> log('error executing program for: ' + example)
                        _ -> (

                            ` pages link to the next example if one exists `
                            len(allExamples) :: {
                                (i + 1) -> next := ''
                                _ -> next := f('<p class="next">
                                                Next example: <a href="{{ path }}">{{ example }}</a>.
                                            </p>', {
                                                path: replace(lower(allExamples.(i + 1)), ' ', '-') + '.html'
                                                example: allExamples.(i + 1)
                                            })
                            }

                            page := f(exampleTemplate, {
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
                                                    </tr>', {
                                                        docs: item.docs
                                                        code: item.code
                                                        class: class
                                    })
                                ), f('<tr>
                                        <td class="docs"><p>{{ intro }}</p></td>
                                        <td class="code leading empty"></td>
                                    </tr>', {intro: data.intro}))
                                program: f('<table>
                                                <tr>
                                                    <td class="docs"><p>{{ end }}</p></td>
                                                    <td class="code leading">
                                                        <pre><span class="gp">$</span> ink {{ fileName }}
<span class="go">{{ result }}</span></pre>
                                                    </td>
                                                </tr>
                                            </table>', {
                                    fileName: fileName + '.ink'
                                    result: result.data
                                    end: data.end
                                })
                                next: next
                            })

                            writeFile('../public/' + fileName + '.html', page, err => err :: {
                                () -> log('error creating example: ' + example)
                            })
                        )
                    })
                )
            })
        ))
    ))
)

` move over static content `
moveStatic := (cb) => dir('../static', item => (
    each(item.data, file => (
        readFile('../static/' + file.name, data => (
            writeFile('../public/' + file.name, data, err => err :: {
                () -> log('error creating static file: ' + file.name)
                _ -> cb()
            })
        ))
    ))
))

` setup folders and clear any old files `
createPublic := cb => make('../public', err => err :: {
    () -> log('error creating public folder')
    _ -> dir('../public', item => each(item.data, file => (
        delete('../public/' + file.name, err => err :: {
            () -> log('error deleting public file: ' + file.name)
            _ -> moveStatic(cb)
        })
    )))
})
createTmp := () => make('../tmp', err => err :: {
    () -> log('error creating tmp folder')
    _ -> dir('../tmp', item => each(item.data, file => (
        delete('../tmp/' + file.name, err => err :: {
            () -> log('error deleting tmp file: ' + file.name)
        })
    )))
})

readFile('../examples.txt', examples => (
    createPublic(() => (
        allExamples := split(examples, ',')
        renderIndexPage(allExamples)
        renderExamplePages(allExamples)
    ))
    createTmp()
))

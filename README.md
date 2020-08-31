# Ink by Example

Content and build toolchain for [Ink by Example](https://inkbyexample.com), a site that teaches [Ink](https://dotink.co/) via annotated example programs.

All tooling is written in Ink and the programs are evaluated as part of the build process.

<br>


Style/structure taken from [Go by Example](https://github.com/mmcgrana/gobyexample) by Mark McGranaghan.

## Add an Annotated Program

- Add the title to `examples.txt`
- Create a matching Ink program in `/examples` that exports `intro`, `rows`, and `end`.
- A title of `Foo Bar` needs a program named `foo-bar.ink`

```
intro := 'The introduction precedes the code sections. It can be left empty.'

rows := [
    {
        docs: 'A that function adds two numbers together. This text will appear on the left of the code.'
        code: 'add := (x, y) => x + y'
    },
    {
        docs: 'A function multiplies two numbers together.'
        code: 'multiply := (x, y) => x * y'
    }
]

end := 'The end section is on the left of the program output. It can also be left empty.'
```

<br>

## Contributing

Raise an issue or a PR. I'm happy to help out! You can also DM me on Twitter @healeycodes

<br>

## Build

`make build-linux` or `make build-mac`

<br>

Note: the programs are written to `/tmp` to get the output. This can also be helpful for debugging.

The website is built to `/public`.

<br>

## Deploy

Serve the `/public` directory.

<br>

### License

Go by Example is copyright Mark McGranaghan and licensed under a
[Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).

Everything else is licensed under MIT.

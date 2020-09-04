# Ink by Example

Content and build toolchain for [Ink by Example](https://inkbyexample.com), a site that teaches [Ink](https://dotink.co/) via annotated example programs.

All tooling is written in Ink and the programs are evaluated as part of the build process.

Syntax highlighting powered by [September](https://github.com/thesephist/september).

<br>

![Image of httsp://inkbyexample.com](https://github.com/healeycodes/inkbyexample/blob/main/static/preview.png)

<br>

## Add an Annotated Program

- Add the title to `examples.ink`
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

end := 'The end section is left of the terminal output. It can also be left empty.'
```

<br>

## Contributing

Raise an issue before starting a PR. **I'm happy to help out!** You can also DM me on Twitter @healeycodes

<br>

## Build

`make build-linux` or `make build-mac`

The website is built to `/public`.

<br>

## Test

Not a super mature test setup but you can check stdout after testing for any errors in the example programs.

`make test-linux` or `make test-mac`

<br>

## Deploy

This repository uses Netlify for CI/CD and there's a `netlify.toml` with the configuration required.

Otherwise, serve the `/public` directory.

<br>

### License

Style/structure taken from [Go by Example](https://github.com/mmcgrana/gobyexample) by Mark McGranaghan.

Go by Example is copyright Mark McGranaghan and licensed under a
[Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).

Everything else is licensed under MIT.

# Ink by Example

Content and build toolchain for [Ink by Example](https://inkbyexample.com), a site that teaches Ink via annotated example programs.

All tooling is written in Ink too!

<br>

Style/structure heavily borrowed from [Go by Example](https://github.com/mmcgrana/gobyexample) by Mark McGranaghan.

## Adding an Annotated Program

- Add the title to `examples.txt`
- Create a matching Ink program in `/examples` that exports `intro`, `rows`, and `end`.

A title of `Foo Bar` requires `foo-bar.ink`. Check `hello-world.ink` for an example.

Inside program files, `docs` becomes the left-side description and `code` becomes the right-side code snippet.

The code is appended and ran as a program as part of the build process so it must be valid. The output is displayed under the annotated program.

## Build

`cd ./src`

`./ink-linux ./build.ink`

## Deploy

Serve the files inside `/public`

<br>

### License

Go by Example is copyright Mark McGranaghan and licensed under a
[Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).

Everything else is licensed under MIT.

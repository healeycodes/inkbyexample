` adapted from https://github.com/thesephist/september to enabled HTML syntax highlighting `

std := load('../vendor/std')

log := std.log
map := std.map
each := std.each
slice := std.slice
cat := std.cat

Tokenize := load('../vendor/tokenize')
Tok := Tokenize.Tok
tokenize := Tokenize.tokenizeWithComments

` associating token types with their highlight colors `
colorFn := tok => tok.type :: {
	(Tok.Separator) -> s => s

	(Tok.Comment) -> s => '<span class="c">' + s + '</span>'

	(Tok.Ident) -> s => s
	(Tok.EmptyIdent) -> s => s

	(Tok.NumberLiteral) -> s => '<span class="m">' + s + '</span>'
	(Tok.StringLiteral) -> s => '<span class="s">' + s + '</span>'
	(Tok.TrueLiteral) -> s => '<span class="kc">' + s + '</span>'
	(Tok.FalseLiteral) -> s => '<span class="kc">' + s + '</span>'

	(Tok.AccessorOp) -> s => '<span class="o">' + s + '</span>'
	(Tok.EqOp) -> s => '<span class="o">' + s + '</span>'

	(Tok.FunctionArrow) -> s => '<span class="nf">' + s + '</span>'

	` operators are all Name.Function color `
	(Tok.KeyValueSeparator) -> s => '<span class="nf">' + s + '</span>'
	(Tok.DefineOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.MatchColon) -> s => '<span class="nf">' + s + '</span>'
	(Tok.CaseArrow) -> s => '<span class="nf">' + s + '</span>'
	(Tok.SubOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.NegOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.AddOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.MulOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.DivOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.ModOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.GtOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.LtOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.AndOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.OrOp) -> s => '<span class="nf">' + s + '</span>'
	(Tok.XorOp) -> s => '<span class="nf">' + s + '</span>'

	(Tok.LParen) -> s => '<span class="p">' + s + '</span>'
	(Tok.RParen) -> s => '<span class="p">' + s + '</span>'
	(Tok.LBracket) -> s => '<span class="p">' + s + '</span>'
	(Tok.RBracket) -> s => '<span class="p">' + s + '</span>'
	(Tok.LBrace) -> s => '<span class="p">' + s + '</span>'
	(Tok.RBrace) -> s => '<span class="p">' + s + '</span>'

	_ -> () `` should error, unreachable
}

main := prog => (
	tokens := tokenize(prog)
	spans := map(tokens, (tok, i) => {
		colorFn: [tok.type, tokens.(i + 1)] :: {
			` direct function calls are marked Name.Function color
				on a best-effort basis `
			[
				Tok.Ident
				{type: Tok.LParen, val: _, line: _, col: _, i: _}
			] -> s => '<span class="nf">' + s + '</span>'
			_ -> colorFn(tok)
		}
		start: tok.i
		end: tokens.(i + 1) :: {
			() -> len(prog)
			_ -> tokens.(i + 1).i
		}
	})
	pcs := map(
		spans
		span => (span.colorFn)(slice(prog, span.start, span.end))
	)
	cat(pcs, '')
)

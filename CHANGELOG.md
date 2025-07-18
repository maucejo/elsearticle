# [v1.0.0](https://github.com/maucejo/elsearticle/releases/tag/v1.0.0)

- Refactoring of the format handling
- Inclusion of the font used by the original `elsarticle` template

# [v0.4.3](https://github.com/maucejo/elsearticle/releases/tag/v0.4.3)

- Fix bug [#10](https://github.com/maucejo/elsearticle/pull/10) - Thanks @dkantereivin

# [v0.4.2](https://github.com/maucejo/elsearticle/releases/tag/v0.4.2)

- Fix bug [#9](https://github.com/maucejo/elsearticle/pull/9) - Thanks @benni012

# [v0.4.1](https://github.com/maucejo/elsearticle/releases/tag/v0.4.1)

- Fix bug [#7](https://github.com/maucejo/elsearticle/issues/7) - Thanks @joneuhauser

# [v0.4.0](https://github.com/maucejo/elsearticle/releases/tag/v0.4.0)

- Add equation sub-numbering based on the `equate` package

# [v0.3.0](https://github.com/maucejo/elsearticle/releases/tag/v0.3.0)

- Add the `line-numbering` option to the `#elsearticle()` command

# [v0.2.1](https://github.com/maucejo/elsearticle/releases/tags/v0.2.1)

- Fix bug [#5](https://github.com/maucejo/elsearticle/issues/5) - Thanks @jamesrswift

# [v0.2.0](https://github.com/maucejo/elsearticle/releases/tags/v0.2.0)

- Add support for the `subpar` package. The API for `subfigure` is now a wraper around `subpar.grid` with `numbering` and `numbering-sub-ref` adapted to the `context` (main body or `appendix`)
- The previous API for `subfigure` is is deprecated and no more supported
- Simplify the customization of `ref` and `figure`


# [v0.1.0](https://github.com/maucejo/elsearticle/releases/tags/v0.1.0)

*Article format*

- [x] Preprint
- [x] Review
- [x] 1p
- [x] 3p
- [x] 5p

*Environment*

- [x] Implementation of the `appendix` environment

*Figures and tables*

- [x] Implementation of the `subfigure` environment
- [x] Proper referencing of figure, subfigures and tables w.r.t. the context
- [x] Recreation of the `link` to cross-reference figures, subfigures and tables

*Equations*

- [x] Proper referencing of equations w.r.t. the context
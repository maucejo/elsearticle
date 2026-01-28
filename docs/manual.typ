#import "@preview/mantys:1.0.2": *
#import "@preview/swank-tex:0.1.0": LaTeX
#import "@preview/cheq:0.2.2": *

#show: checklist.with(fill: eastern.lighten(95%), stroke: eastern, radius: .2em)


#let abstract = [
  #package[elsearticle] is a Typst template that aims to mimic the Elsevier article #LaTeX class, a.k.a. elsarticle.cls, provided by Elsevier to format manuscript properly for submission to their journals.
]

#show: mantys(
  name: "elsearticle.typ",
  version: "2.1.0",
  authors: ("Mathieu Aucejo",),

  license: "MIT",
  description: "Typst template for Elsevier article submissions",
  repository: "https://github.com/maucejo/elsearticle",

  title: "elsearticle class for Typst",
  date: datetime.today(),

  abstract: abstract,
  show-index: false
)

= About

#package[Elsearticle] is a Typst template that aims to mimic the Elsevier article #LaTeX class, a.k.a. elsarticle.cls, provided by Elsevier to format manuscript properly for submission to their journals.

#package[elsearticle] is designed to be as close as possible to the original class, whose specification can be found in the #link("http://assets.ctfassets.net/o78em1y1w4i4/3ro3yQff1q67JHmLi1sAqV/1348e3852f277867230fc4b84a801734/elsdoc-1.pdf")[#text("documentation", fill: eastern)].  The template is still in development and may not be fully compatible with all Elsevier journals.

This manual provides an overview of the features of the #package[elsearticle] template and how to use it.

To mimic the look and feel of the original elsarticle.cls, the following fonts must be used:
- #link("https://www.ctan.org/pkg/xits", "XITS") and XITS Math for the best compatibility with the original elsarticle.cls;
- #link("https://github.com/stipub/stixfonts", "STIX Two Text") and STIX Two Math as a reasonable alternative;
- New Computer Modern and New Computer Modern Math are also defined to avoid compilation errors if the previous fonts are not available.

#warning-alert()[The template is provided as is by the Typst community and is not affiliated with Elsevier.]

= Usage

== Using elsearticle

To use the #package[elsearticle] template, you need to include the following line at the beginning of your `typ` file:
#codesnippet[```typ
#import "@preview/elsearticle:2.0.0": *
```
]

== Initializing the template

After importing #package[elsearticle], you have to initialize the template by a show rule with the #cmd[elsearticle] command. This function takes an optional argument to specify the title of the document.
#codesnippet[```typ
#show: elsearticle.with(
  ...
)
```
]

#cmd[elsearticle] takes the following arguments:
#command("elsearticle", ..args(
  title: none,
  authors: (),
  institutions: (),
  abstract: none,
  journal: none,
  keywords: (),
  format: "preprint",
  numcol: 1,
  line-numbering: false,
  [body])
)[#argument("title", default: none, types: "string")[Title of the paper]

#argument("authors", default: (), types: array)[
  Array containing the list of authors of the article. Each author is defined as a dictionary with the following keys:
  - `name`: Name of the author (required) #dtypes(str, content)
  - `affiliations`: List of affiliations of the author (required) #dtype(array)
  - `corresponding`: Corresponding author (optional, default: false) #dtype(bool)
  - `email`: Email of the corresponding author (optional) #dtypes(str, content)

  #codesnippet[```typc
  authors: (
      (
        name: "J. Doe",
        affiliations: ("a", "b"),
        corresponding: true,
        email: "jdoe@univ.edu",
      ),
      (
        name: "J. Smith",
        affiliations: ("b",),
      ),
    )
  ```]
]

#argument("affiliations", default: (), types: dictionary)[
  Dictionary containing the list of affiliations of the article. Each affiliation is defined as a key-value pair, where the key is a #dtype(str) representing the affiliation ID and the value is a #dtypes(str, content) giving the name and the address of the affiliation.

  #codesnippet[
    ```typc
    affiliations: (
      "a": [Institution A, City A, Country A],
      "b": [Instritution B, City B, Country B],
    )
    ```
  ]

  #info-alert[If the paper has only one author, `institutions`must be:
    - `("",)` in the `authors` #dtype(array) of #dtype(dictionary)
    - `("": [Institution name])` in the `institutions` #dtype(dictionary)
    to conform with the Elsevier template requirements.
  ]
]

#argument("abstract", default: none, types: "content")[Abstract of the paper]

#argument("journal", default: none, types: "string")[Name of the journal]

#argument("keywords", default: (), types: "array")[List of the keywords of the paper

Each element of the #dtype("array") is a #dtype("string") representing a keyword

#codesnippet[```typc
keywords: ("Keyword 1", "Keyword 2")
```]
]

#argument("format", default: "review", types: "string")[Format of the paper. Possible values are "preprint", "review", "1p", "3p" and "5p"
]

#argument("numcol", default: 1, types: "number")[Number of columns of the paper. Possible values are 1 and 2

#info-alert[According to the documentation of `elsearticle.cls` (see #link("https://assets.ctfassets.net/o78em1y1w4i4/3ro3yQff1q67JHmLi1sAqV/1348e3852f277867230fc4b84a801734/elsdoc-1.pdf", "here")), the number of columns is related to the format of the paper:
- 1p: Single column only
- 3p: Single or double column possible
- 5p: Double column only

To avoid unexpected behaviors, the value of the `numcol` argument is set to 1 by default and restricted to 1 or 2.
]

// #warning-alert[To make the implementation generic, the last line of the template is like:
//   #codesnippet[
//     ```typc
//     show: column(numcol, body)
//     ```
//   ]

// This means that a page break must be inserted using the #cmd[colbreak] command and not #cmd[pagebreak].
// ]
]

#argument("line-numbering", default: false, types: "bool")[Enable line numbering in the document]
]

== Additional features

The #package[elsearticle] template provides additional features to help you format your document properly.

=== Appendix

The template allows you to create appendices using the #cmd[appendix] environment. The appendices are then numbered with capital letters (A, B, C, etc.). Figures, tables and equations are numbered accordingly, e.g. Eq. (A.1).

To activate the appendix environment, all you have to do is to place the following command in your document:
#codesnippet[
  ```typ
  #show: appendix

  // Appendix content here
  ```
]

=== Subfigures

Subfigures are not built-in features of Typst, but the #package[elsearticle] template provides a way to handle them. It is based on the #package[subpar] package that allows you to create subfigures and properly reference them.

To create a subfigure, you can use the following syntax:

#codesnippet[
  ```typc
  #subfigure(
    figure(image("image1.png"), caption: []), <figa>,
    figure(image("image2.png"), caption: []), <figb>,
    columns: (1fr, 1fr),
    caption: [(a) Left image and (b) Right image],
    label: <fig>
  )
  ```
]

#info-alert()[The #cmd("subfigure") function is a wrapper around the #cmd[subpar.grid] function. The numbering is adapted to the context of the document (normal section or appendix).]

=== Equations

The equations are numbered with the format "(1)", "(2)" in normal sections and with the format "(A.1)", "(A.2)" in appendices. In addition to these numbering patterns, the #package[elsearticle] template provides the #cmd("nonumeq") to create unnumbered equations. The latter function can be used as follows:

#codesnippet[
  ```typ
  #nonumeq[$
    y = f(x)
    $
  ]
  ```
]

= Dependencies

The #package[elsearticle] template depends on the following packages:
- `equate:0.3.2`: For equation handling and numbering.
- `subpar:0.2.2`: For subfigure handling and numbering.

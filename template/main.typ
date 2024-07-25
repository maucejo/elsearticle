#import "../src/elsearticle.typ": *

#let abstract = lorem(100)

#show: elsearticle.with(
  title: "Psychohistory: a primer",
  authors: (
    (
      name: "H. Seldon",
      affiliation: "Psychohistory laboratory, Streeling university, Trantor",
      corr: "hari.seldon@str.edu",
      id: "a",
    ),
    (
      name: "G. Dornick",
      affiliation: "Mathematics laboratory, Synnax University, Synnax",
      corr: none,
      id: "b"
    ),
  ),
  journal: "Encyclopedia Galactica",
  abstract: abstract,
  keywords: ("Psychohistory", "Encyclopedia"),
  format: "preprint"
)

= Introduction

#lorem(100)

= Foundations

Psychohistory depends on the idea that, while one cannot foresee the actions of a particular individual, the laws of statistics as applied to large groups of people could predict the general flow of future events. Asimov used the analogy of a gas: An observer has great difficulty in predicting the motion of a single molecule in a gas, but with the kinetic theory can predict the mass action of the gas to a high level of accuracy @Sel10. Seldon applied this concept to the population of the Galactic Empire, which numbered one quintillion, by defining two axioms: #v(1em)

- the population whose behaviour was modelled should be sufficiently large to represent the entire society.

- the population should remain in ignorance of the results of the application of psychohistorical analyses because if it is aware, the group changes its behaviour. #v(1em)

Ebling Mis added these axioms:

- there would be no fundamental change in the society human reactions to stimuli would remain constant. #v(1em)

Golan Trevize in Foundation and Earth added this axiom:

- humans are the only sentient intelligence in the galaxy. #v(1em)

== Probability and Psychohistory

Psychohistory relies on the Seldon central limit theorem#footnote[It is actually the classical central limit theorem #emoji.face.lick]:

$
sqrt(n) (macron(X)_n - mu) / sigma-> cal(N)(0, 1),
$
where ...

== Features

=== Table

Below is @tab:tab1.

#let tab1 = {
  table(
  columns: 3,
  table.header(
    [Substance],
    [Subcritical °C],
    [Supercritical °C],
  ),
  [Hydrochloric Acid],
  [12.0], [92.1],
  [Sodium Myreth Sulfate],
  [16.6], [104],
  [Potassium Hydroxide],
  table.cell(colspan: 2)[24.7],
)
}

#figure(
    tab1,
    kind: table,
    caption : [Example]
) <tab:tab1>

=== Figures

Below is @fig:logo.

#figure(
  image("images/typst-logo.svg", width: 50%),
  caption : [Typst logo - Credit: \@fenjalien]
) <fig:logo>

=== Subfigures

Below are @figa and @figb, which are part of @fig:typst.

#subpar.grid(
  figure(image("images/typst-logo.svg"), caption: []), <figa>,
  figure(image("images/typst-logo.svg"), caption: []), <figb>,
  columns: (1fr, 1fr),
  caption: [A figure composed of two sub figures.],
  label: <fig:typst>,
)

#show: appendix
#let sub-figure-numbering = (m, n) => numbering("A.1a", counter(heading).get().first(), m, n)
#let figure-numbering = n => numbering("A.1", counter(heading).get().first(), n)

#let subpar-grid = subpar.grid.with(
  numbering: figure-numbering,
  numbering-sub-ref: sub-figure-numbering,
)

= Appendix A

== Figures

In @fig:app

#figure(
  image("images/typst-logo.svg", width: 50%),
  caption : [Books cover]
) <fig:app>

== Subfigures

Below are @figa-app and @figb-app, which are part of @fig:typst-app.

#subpar-grid(
  figure(image("images/typst-logo.svg"), caption: []), <figa-app>,
  figure(image("images/typst-logo.svg"), caption: []), <figb-app>,
  columns: (1fr, 1fr),
  caption: [A figure composed of two sub figures.],
  label: <fig:typst-app>,
)

== Tables

In @tab:app

#figure(
    tab1,
    kind: table,
    caption : [Example]
) <tab:app>

== Equations

In @eq

$
y = f(x)
$ <eq>

#nonumeq[$
    y = g(x)
    $
]

= Conclusion

Below are @figa-app2 and @figb-app2, which are part of @fig:typst-app2.
#subpar-grid(
  figure(image("images/typst-logo.svg"), caption: []), <figa-app2>,
  figure(image("images/typst-logo.svg"), caption: []), <figb-app2>,
  columns: (1fr, 1fr),
  caption: [A figure composed of two sub figures.],
  label: <fig:typst-app2>,
)

#bibliography("refs.bib")
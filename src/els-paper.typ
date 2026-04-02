#let paper-list = (
  a5: (width: 148mm, height: 210mm),
  a4: (width: 210mm, height: 297mm),
  ansi-a: (width: 216mm, height: 279mm),
  ansi-b: (width: 279mm, height: 432mm),
  us-letter: (width: 215.9mm, height: 279.4mm),
)

#let adapt-margins(margins, paper) = {
  let paper-width = paper-list.at(paper, default: paper-list.a4).width
  let paper-height = paper-list.at(paper, default: paper-list.a4).height
  let a4-width = paper-list.a4.width
  let a4-height = paper-list.a4.height

  let width = (paper-width - a4-width) / 2
  let height = (paper-height - a4-height) / 2
  (
    left: width + margins.left,
    right: width + margins.right,
    top: height + margins.top,
    bottom: height + margins.bottom,
  )
}
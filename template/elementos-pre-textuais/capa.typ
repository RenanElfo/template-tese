#let capa(titulo-do-trabalho, nome-do-autor, instituicao, curso) = {
  grid(
    columns: (0.14fr, 0.86fr),
    gutter: 15pt,
    [#align(left + horizon, image("/typst-logo.png", width: 100%))],
    align(horizon, upper(strong[
      #instituicao\
      #curso
    ])),
  )

  v(4cm)
  align(center, upper(strong[
    #set par(justify: false)
    #set text(hyphenate: false, weight: "semibold")
    #show title: set text(size: 1em / 1.4)
    #title(titulo-do-trabalho)
  ]))

  v(3cm)
  align(center, upper(strong(nome-do-autor)))

  v(1fr)

  import "../constants.typ": LOCAL-E-DATA
  LOCAL-E-DATA
  pagebreak()
}

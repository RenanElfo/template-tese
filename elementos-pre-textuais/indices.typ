#let imprimir() = [
  #import "../constants.typ" as const
  #import "../parameters.typ": impressao-frente-e-verso
  #set outline(title: [])
  #show outline.entry: it => link(
    it.element.location(),
    it.indented([#it.prefix() ---], [#it.inner()])
  )
  #let listas = ()

  #listas.push([
    #const.titulo-da-pagina([Lista de ilustrações])
    #outline(target: figure.where(kind: image))
  ])

  #listas.push([
    #const.titulo-da-pagina([Lista de tabelas])
    #outline(target: figure.where(kind: table))
  ])

  #listas.push([
    #import "../conteudo/lista-de-abreviaturas.typ": abreviaturas
    #const.titulo-da-pagina([Lista de abreviaturas e siglas])
    #v(1cm)
    #set align(right)
    #block(width: 90%)[
      #set align(left)
      #grid(
        columns: (1fr, 4fr),
        row-gutter: 8pt,
        column-gutter: 4pt,
        inset: 1pt,
        ..abreviaturas,
      )
    ]
  ])

  #listas.push([
    #import "../conteudo/lista-de-simbolos.typ": simbolos
    #const.titulo-da-pagina([Lista de símbolos])
    #v(1cm)
    #set align(right)
    #block(width: 90%)[
      #set align(left)
      #grid(
        columns: (1fr, 5fr),
        row-gutter: 8pt,
        column-gutter: 4pt,
        inset: 1pt,
        ..simbolos,
      )
    ]
  ])

  #listas.reduce((acc, it) => acc + pagebreak() + it)
  #pagebreak(to: if impressao-frente-e-verso { "odd" } else { none })

  #show outline.entry: it => link(
    it.element.location(),
    [
      // Isto esta comentado aqui ate eu descobri uma maneira melhor
      // de saber o tamanho da fonte no sumario sem precisar de
      // valores hard coded
      // #let heading-font-size = state("heading-font-size")
      // #heading-font-size.at(it.element.location())
      // #set text(size: heading-font-size.at(it.element.location()))
      #let size = if (type(it.element) == content
                    and it.element.func() == heading) {
        if it.element.level == 1 {
          1.4em
        } else if it.element.level == 2 {
          1.2em
        } else {
          1.0em
        }
      } else {
        1.0em
      }
      #set text(size: size)
      #set par(first-line-indent: 0pt)
      #let inner = if it.element.func() == heading and it.element.level == 1 {
        upper(it.inner())
      } else {
        it.inner()
      }
      #grid(columns: (1fr, 7fr), align: bottom, it.prefix(), inner)
      // #it.fields()
    ],
  )
  #const.titulo-da-pagina([Sumário])
  #outline()
  #pagebreak()
]

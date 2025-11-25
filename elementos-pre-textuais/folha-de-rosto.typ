#let imprimir() = [
  #import "../constants.typ" as const
  #import "../parameters.typ" as param
  #set align(center)
  #text(size: 14pt, param.nome-do-autor)

  #v(3cm)
  #block(width: 90%, strong(text(size: 16pt, param.titulo-do-trabalho)))

  #v(3cm)
  #const.TEXTO-DA-FOLHA-DE-ROSTO

  #v(3cm)
  #text(size: 12pt)[#param.instituicao]

  #v(3cm)
  #[
    #set text(size: 12pt)
    Orientador: #param.orientador\
    #for coorientador in param.coorientadores [
      Coorientador: #coorientador\
    ]
  ]

  #v(1fr)
  #const.LOCAL-E-DATA
  #pagebreak()
]

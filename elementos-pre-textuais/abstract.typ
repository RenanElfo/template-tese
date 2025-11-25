#let imprimir() = [
  #import "../constants.typ" as const
  #import "../parameters.typ" as param
  #const.titulo-da-pagina([Abstract])
  #set par(first-line-indent: 0pt)

  #import "../conteudo/abstract.typ" as abstract
  #abstract

  *Keywords:* #param.keywords.reduce((acc, it) => acc + ". " + it).

  #pagebreak()
]

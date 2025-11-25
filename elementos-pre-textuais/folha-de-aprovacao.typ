#let imprimir() = [
  #import "../constants.typ" as const
  #import "../parameters.typ" as param
  #set align(center)
  #text(size: 14pt, param.nome-do-autor)

  #v(1cm)
  #block(width: 90%, strong(text(size: 16pt, param.titulo-do-trabalho)))

  #v(1cm)
  #const.TEXTO-DA-FOLHA-DE-ROSTO

  #v(1cm)
  #let dia = const.DATA.dia
  #let dia = if dia != 1 [#dia] else [1º]
  #align(left)[
    Aprovado(a) em: #dia de #lower(param.mes-de-aprovacao) de
    #param.ano-de-aprovacao
  ]

  #v(1cm)
  #[
    #set align(center)
    #upper()[Banca Examinadora]
  ]

  #v(1cm)
  #[
    #set text(size: 12pt, hyphenate: false)
    #set block(width: 6cm, inset: (top: 0.3cm), stroke: (top: 1pt))
    #block[#param.orientador#linebreak()Orientador -- #param.instituicao]\
    #for coorientador in param.coorientadores [
      #block[#coorientador#linebreak()Coorientador -- #param.instituicao]\
    ]
    #block[#param.nome-do-autor#linebreak()#param.instituicao]
  ]

  #pagebreak()
]

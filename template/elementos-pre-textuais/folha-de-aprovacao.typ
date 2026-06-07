#import "../constants.typ" as const
#import "/parameters.typ" as param

#let folha-de-aprovacao() = {
  set align(center)
  text(size: 14em / 12, nome-do-autor)

  v(1cm)
  block(width: 90%, strong(text(size: 16em / 12, titulo-do-trabalho)))

  v(1cm)
  const.TEXTO-DA-FOLHA-DE-ROSTO

  v(1cm)
  let dia = const.DATA.dia
  let dia = if dia != 1 [#dia] else [1º]
  align(left)[
    Aprovado(a) em: #dia de #lower(const.DATA.mes) de
    #const.DATA.ano
  ]

  v(1cm)
  [
    #set align(center)
    #upper()[Banca Examinadora]
  ]

  v(1cm)
  {
    set text(hyphenate: false)
    set block(width: 6cm, inset: (top: 0.3cm), stroke: (top: 1pt))
    block[#orientador#linebreak()Orientador -- #instituicao]
    linebreak()
    for coorientador in coorientadores {
      block[#coorientador#linebreak()Coorientador -- #instituicao]
      linebreak()
    }
    block[#nome-do-autor#linebreak()#instituicao]
  }

  pagebreak()
}

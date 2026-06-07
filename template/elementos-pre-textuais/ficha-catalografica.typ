#import "../constants.typ" as const

#let ficha-catalografica() = {
  set align(bottom + center)
  let number-of-pages = context [#counter(page).final().at(0)]
  let mes = const.DATA.mes.replace(regex("^\w"), it => upper(it.text))
  rect(inset: (y: 0.5cm), width: 13.5cm)[
    #set align(left)
    #set par(first-line-indent: 0pt)
    #set text(size: 11em / 12)
    #nome-do-autor\
    #h(0.5cm)
    #titulo-do-trabalho/ #nome-do-autor. -- #localidade, #mes,
    #const.DATA.ano\-\
    #h(0.5cm)
    #number-of-pages\p. : il. (algumas color.) ; 30cm.

    #h(0.5cm)
    Orientador: #orientador\
    #for coorientador in coorientadores [
      #h(0.5cm)
      Coorientador: #coorientador\
    ]

    #h(0.5cm)
    #tipo-de-trabalho -- #instituicao, #mes, #const.DATA.ano.

    #h(0.5cm)
    #for (index, palavra) in palavras-chave.enumerate() [
      #(index + 1). #palavra.
    ]
    I. #orientador
    #for (index, coorientador) in coorientadores.enumerate() [
      #numbering("I.", (index + 2)) #coorientador.
    ]
    #numbering("I.", coorientadores.len() + 2) #instituicao #numbering(
      "I.",
      coorientadores.len() + 3,
    ) #titulo-do-trabalho.
  ]

  pagebreak()
}

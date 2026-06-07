#import "../constants.typ" as const

#let folha-de-rosto(
  titulo-do-trabalho,
  nome-do-autor,
  orientador,
  coorientadores,
  instituicao,
) = {
  set align(center)
  text(size: 14em / 12, nome-do-autor)

  v(3cm)
  block(width: 90%, strong(text(size: 16em / 12, titulo-do-trabalho)))

  v(3cm)
  const.TEXTO-DA-FOLHA-DE-ROSTO

  v(3cm)
  instituicao

  v(3cm)
  [
    Orientador: #orientador\
    #for coorientador in coorientadores [
      Coorientador: #coorientador\
    ]
  ]

  v(1fr)
  const.LOCAL-E-DATA
  pagebreak()
}

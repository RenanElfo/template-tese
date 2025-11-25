#import "parameters.typ" as param

#let DATA = (
  dia: param.dia-de-aprovacao,
  mes: param.mes-de-aprovacao,
  ano: param.ano-de-aprovacao
)
#let LOCAL-E-DATA = align(center, upper(strong[
  #param.localidade\
  #DATA.mes, #DATA.ano
]))
#let TEXTO-DA-FOLHA-DE-ROSTO = grid(
    columns: (1fr, 1fr),
    [],
    [
      #set align(left)
      #param.tipo-de-trabalho apresentada ao #param.curso da
      #param.instituicao, como parte dos requisitos para obtenção do título
      de #param.nome-do-titulo
    ],
  )

#let SINGLE-SPACING = 0.15em 
#let ONE-AND-HALF-SPACING = 0.5em 
#let DOUBLE-SPACING = 1.0em 

#let titulo-da-pagina(titulo) = [
  #set text(weight: "bold")
  #align(center)[#text(size: 24pt, titulo)]
]

#import "/template/funcoes-auxiliares/titulo-da-pagina.typ": titulo-da-pagina
#import "/parameters.typ" as param

#let resumo(texto-resumo, palavras-chave) = [
  #show: titulo-da-pagina.with(titulo: [Resumo])
  #set par(first-line-indent: 0pt)

  #texto-resumo

  *Palavras-chave:* #palavras-chave.reduce((acc, it) => acc + ". " + it).

  #pagebreak()
]

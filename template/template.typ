#let template(
  impressao-frente-e-verso: true,
  referencias-numericas: true,
  instituicao: [Instituto Xavier para Estudos Avançados],
  curso: [Curso do Ben 10],
  tipo-de-trabalho: [Tese],
  nome-do-titulo: [Doutor em Astrologia Eletrônica],
  titulo-do-trabalho: [
    Modelagem analítica da eletrodinâmica astrológica de anões medievais
  ],
  nome-do-autor: "Fulano de Tal",
  localidade: [Xique-Xique -- BA],
  data-de-aprovacao: datetime(
    day: 7,
    month: 10,
    year: 1582,
  ),
  orientador: [Mestre dos Magos],
  coorientadores: ([Mestre Splinter], [Senhor Miyagi]),
  palavras-chave: ("Eletrodinâmica", "Astrologia", "Anões", "Medieval"),
  keywords: ("Electronic", "Astrology", "Dwarves", "Medieval"),
  texto-resumo: [
    Uma modelagem analítica da eletrodinâmica de anões medievais foi feita a
    partir da aplicação das equações de Maxwell na sua forma diferencial na
    barba de cada um dos indivíduos analisados. Os anões foram categorizados
    pelo seus signos do zodíaco e a modelagem foi então utilizada para prever a
    resposta em frequência de cada anão em um grupo de teste.
  ],
  epigrafe: (
    frase: [
      O problema de citações encontradas na Internet é que elas estão
      frequentemente erradas
    ],
    autor: "Einstein",
  ),
  doc,
) = {
  import "constants.typ" as const
  import "/conteudo/resumo.typ" as resumo

  set document(
    title: titulo-do-trabalho,
    author: (nome-do-autor),
    description: [#resumo],
    keywords: palavras-chave + keywords,
  )

  let x-margin = if impressao-frente-e-verso {
    (inside: 3cm, outside: 2cm)
  } else {
    (left: 3cm, right: 2cm)
  }
  set page("a4", margin: (top: 3cm, bottom: 2cm, ..x-margin))
  set par(
    justify: true,
    first-line-indent: (all: true, amount: 1.3cm),
    spacing: 1.2em,
    leading: const.ONE-AND-HALF-SPACING,
  )
  set text(size: 12pt, lang: "pt", region: "br", bottom-edge: "descender")
  set enum(numbering: "a)")
  show link: set text(fill: rgb("#0000ee"))
  set heading(numbering: "1.1")

  set table(stroke: (x, y) => (
    top: if y <= 1 { 1pt } else { 0pt },
    bottom: 1pt,
  ))

  show figure: it => block(breakable: false, {
    text(size: 10em / 12, it.caption)
    it.body
  })

  show quote.where(block: true): it => {
    set text(size: 10em / 12)
    align(right, block(
      width: 80%,
      align(left, it),
    ))
  }


  import "elementos-pre-textuais/capa.typ": capa
  capa(titulo-do-trabalho, nome-do-autor, instituicao, curso)
  import "elementos-pre-textuais/folha-de-rosto.typ": folha-de-rosto
  folha-de-rosto(
    titulo-do-trabalho,
    nome-do-autor,
    orientador,
    coorientadores,
    instituicao,
  )
  import "elementos-pre-textuais/ficha-catalografica.typ": ficha-catalografica
  import "elementos-pre-textuais/folha-de-aprovacao.typ": folha-de-aprovacao
  include "elementos-pre-textuais/dedicatoria.typ"
  include "elementos-pre-textuais/agradecimentos.typ"
  import "elementos-pre-textuais/epigrafe.typ": epigrafe as epigrafe-func
  epigrafe-func(epigrafe)
  include "elementos-pre-textuais/resumo.typ"
  include "elementos-pre-textuais/abstract.typ"
  import "elementos-pre-textuais/indices.typ": indices
  indices(impressao-frente-e-verso)

  let paginas-pre-textuais = counter("paginas-pre-textuais")
  context {
    // Precisamos subtrair um, pois a ficha catalografica nao eh contada.
    // Precisamos subtrair um, tambem, porque o contador pega a primeira
    // folha textual. Por isso, subtraimos 2.
    paginas-pre-textuais.update(counter(page).get().first() - 2)
  }
  counter(page).update(1)
  set page(
    header: context {
      let number-alignment = if (
        impressao-frente-e-verso == false
          or calc.even(counter(page).get().first())
      ) {
        right
      } else {
        left
      }
      set align(number-alignment)
      counter(page).display("1")
    },
  )

  doc

  include "elementos-pos-textuais/bibliografia.typ"
  context {
    counter(page).update(
      counter(page).get().first() + paginas-pre-textuais.get().first(),
    )
  }
}

#let abnt-figure(fonte: none, ..args) = {
  if fonte == none {
    panic(
      "
      As normas ABNT preveem que as ilustrações possuam uma fonte, mesmo que
      tenham sido produzidas pelo próprio autor.
      ",
    )
  }
  let body = align(center, block(breakable: false, {
    args.pos().at(0) + text(size: 10em / 12, { "Fonte: " + fonte })
  }))
  figure(body, ..args.named())
}

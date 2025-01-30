#import "../template.typ": *
#import "@preview/physica:0.9.2": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0": plot, chart

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第9回",
  authors: (
    (
      name: env.STUDENT_NAME,
      id: env.STUDENT_ID,
      affiliation: env.STUDENT_AFFILIATION
    ),
  ),
  date: "2024 年 12 月 27 日",
)

=== (1)

チューニングした各ゲインを以下の表に示す。

#align(center)[
  #table(
    columns: (10em, 10em),
    inset: 10pt,
    align: center,
    table.header(
      [], [値]
    ),
    [$K_"vel"$], [$1200$],
    [$K_"dis"$], [$400$],
    [$K_"d_l"$], [$0.000024$],
  )
]

=== (2)

以下に時間応答として Scope のスクリーンショットを示す。

#align(center)[
  #image("image.png", width: 60%)
]

=== (3)

評価性能として問題文中に示された表をもとに以下に示す。

Simulink 上のブロックを用いて計算をした。

#align(center)[
  #table(
    columns: (1fr, 1fr),
    inset: 10pt,
    align: center,
    [相対速度偏差の絶対値を積分した値], [$12.5$],
    [相対距離偏差の絶対値を積分した値], [$24.4$],
  )
]

=== (4)

作成した simulink のモデルとして `task.slx` を提出した。

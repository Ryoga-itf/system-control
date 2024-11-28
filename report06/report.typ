#import "../template.typ": *
#import "@preview/physica:0.9.2": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0": plot, chart

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第6回",
  authors: (
    (
      name: env.STUDENT_NAME,
      id: env.STUDENT_ID,
      affiliation: env.STUDENT_AFFILIATION
    ),
  ),
  date: "2024 年 11 月 29 日",
)

== 演習課題 1

質量が $m$、抵抗力の減衰係数が $b$ のとき、

自動車に働く力の合計は、運動方程式により以下のように表せられる。

$
F(t) - b v(t) = m dv(v(t), t)
$

ラプラス変換を適用することにより、

$
cal(L) (F(t) - b v(t) ) = cal(L) (m dv(v(t), t)) \
F(s) - b V(s) = m s V(s) \
therefore V(s) = F(s) / (m s + b)
$

よって、伝達関数は


$
G(s) = V(s) / F(s) = 1 / (m s + b)
$

ここで、本問題において $m = 1000"kg"$、$b = 100"Ns/m"$ であるから、

$
G(s) = 1 / (1000 s + 100) = 1/100 dot 1/(10 s + 1)
$

このとき、ゲインと位相は

$
G(j omega) = 1/100 dot 1 / (10 j omega + 1)
$

$
A = abs(G(j omega))
&= abs(1/100 dot 1 / (10 j omega + 1)) \
&= 1/100 abs(1 / (10 j omega + 1)) \
&= 1/100 dot 1 / sqrt(1 + (10 omega)^2) \
&= 1/100 dot 1 / sqrt(1 + 100 omega^2) \
$

$
phi = angle G(j omega) = angle (10 j omega + 1) = -tan^(-1) (10 omega)
$

=== 1-1

前問より、

#align(center)[
  #table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: center,
    table.header(
      [$omega$], [Gain], [$angle G(j omega)$],
    ),
    ..range(-4, 3).map(t => calc.pow(10, t)).map(omega => (
      omega,
      0.01 / calc.sqrt(1 + 100 * omega * omega),
      -calc.atan(omega * 10).deg()
    )).flatten().map(v => $#v$)
  )
]

=== 1-2

前問より、

$
20 log abs(G(j omega)) = 20 log (1/100 dot 1 / sqrt(1 + 100 omega^2))
$

よって、

/ ゲイン線図:

#align(center)[
  #cetz.canvas({
    plot.plot(
      size: (13, 8),
      x-label: [$omega$],
      y-label: [Gain $["db"]$],
      x-format: v => $10^(#v)$,
      y-max: 40,
      y-grid: "major",
      y-tick-step: 20,
      {
        plot.add(
          domain: (-5, 5),
          omega_log => (
            20 * calc.log(calc.sqrt(1 / (0.01 + 100 * calc.pow(calc.pow(10, omega_log), 2))))
          )
        )
      }
    )
  })
]

/ 位相線図:

#align(center)[
  #cetz.canvas({
    plot.plot(
      size: (13, 8),
      x-label: [$omega$],
      y-label: [位相 $["deg"]$],
      x-format: v => $10^(#v)$,
      y-max: 10,
      y-min: -100,
      y-grid: "major",
      {
        plot.add(
          domain: (-5, 5),
          omega_log => (
            -calc.atan(calc.pow(10, omega_log) * 10).deg()
          )
        )
      }
    )
  })
]

== 演習課題 2

与えられた図より、伝達関数は

$
G(s) = (K_p / (m s + c)) / (1 + K_p / (m s + c)) = K_p / (m s + c + K_p)
$

また、$m = 1000"kg", c = 100"Ns/m"$ であるから、

$
G(s) = K_p / (1000 s + 100 + K_p)
$

よって極は、

$
s = - (100 + K_p) / 1000
$

したがって、

#align(center)[
  #table(
    columns: (10em, 10em),
    inset: 10pt,
    align: center,
    table.header(
      [$K$], [$s$]
    ),
    [$0$], [$-0.1$],
    [$1$], [$-0.101$],
    [$2$], [$-0.102$],
    [$infinity$], [$-infinity$],
  )
]

#align(center)[
  #image("fig1.jpg", width: 60%)
]

== 演習課題 3

ラプラス変換を適用すると、

$
Y(s)
&= cal(L) (1 - cos t) \
&= 1 / s - s / (s^2 + 1)
$

ステップ入力 $1 / s$ に対する応答が $Y(s)$ であるから、

$
Y(s) = G(s) dot 1 / s \
therefore G(s) = s dot Y(s) = s (1 / s - s / (s^2 + 1))
$

これを整理すると、

$
G(s)
&= s (1 / s - s / (s^2 + 1)) \
&= 1 - s^2 / (s^2 + 1) \
&= (s^2 + 1 - s^2) / (s^2 + 1) \
&= 1 / (s^2 + 1) \
$

これは 2 次システムの減衰項がゼロの純粋な調和振動子に対応。

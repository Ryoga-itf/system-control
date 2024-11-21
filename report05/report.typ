#import "../template.typ": *
#import "@preview/physica:0.9.2": *
#import "@preview/tenv:0.1.1": parse_dotenv

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第5回",
  authors: (
    (
      name: env.STUDENT_NAME,
      id: env.STUDENT_ID,
      affiliation: env.STUDENT_AFFILIATION
    ),
  ),
  date: "2024 年 11 月 22 日",
)

== 演習課題 1

入力関数をラプラス変換すると、

$
U(s) = cal(L) (U(t)) = cal(L) (sin t) = 1/(s^2 + 1)
$

よって、

$
Y(s) = G(s) U(s)
= (s^2 + 1) / (s^2 + 3s + 2) dot 1 / (s^2 + 1)
= 1/ ((s + 1)(s + 2))
= 1 / (s + 1) - 1 / (s + 2)
$

この応答 $y(t)$ は、

$
y(t) &= cal(L)^(-1) [ Y(s) ] \
     &= e^(-t) + e^(-2t)
$

== 演習課題 2

$
Y(s) = G(s) U(s) = (-s + 2) / (s^2 + 3s + 2) dot 1/s = (-s + 2) / ((s + 1)(s + 2)s)
$

左辺をを部分分数展開すると、

$
Y(s) = -3 / (s + 1) + 2 / (s + 2) + 1 / s
$

よって、この応答 $y(t)$ は、

$
y(t) &= cal(L)^(-1) [ Y(s) ] \
     &= -3 e^(-t) + 2 e^(-2t) + 1
$

この伝達関数の極は $p_1 = -1, p_2 = -2$
零点は $s = 2$

図示すると、@fig1 の通り

#figure(
  image("./fig1.png", width: 60%),
  caption: "概略図"
) <fig1>



また、伝達関数の極の実数が全て負であるから、システムは安定である。

== 演習課題 3

$m$ は質量であるから $m > 0$ と仮定してよい。
同様に、$k$ はバネ定数であり、$c$ はダンパの減衰係数であるから $k > 0, c > 0$ と仮定してよい。

この伝達関数の極を考える。
$D = c^2 - 4 m k$ とおく。

#set enum(numbering: "(i)")

+ $D > 0$ のとき、この伝達関数の極は、

  $
  p_1 = (-c + sqrt(c^2 - 4 m k)) / (2m),
  p_2 = (-c - sqrt(c^2 - 4 m k)) / (2m)
  $
  であり、これは実数。

  振動せず減衰するためには、$p_1, p_2$ がともに負であればよい。

  $
  p_1 < 0 <=> sqrt(c^2 - 4 m k) < c \
  
  therefore m k > 0
  $

  また、

  $
  p_2 < 0 <=> -sqrt(c^2 - 4 m k) < c
  $

  よって $p_1 < 0 and p_2 < 0 <=> m k > 0$

+ $D <= 0$ のとき、この伝達関数の極は、

  $
  p_1 = (-c + sqrt(c^2 - 4 m k)) / (2m),
  p_2 = (-c - sqrt(c^2 - 4 m k)) / (2m)
  $

  であり、この実部は $-c / (2m) < 0$ より、このシステムは安定

以上より、求める条件は

$
c^2 <= 4 m k or m k > 0
$

== 演習課題 4

== 演習課題 5


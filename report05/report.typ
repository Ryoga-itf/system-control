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
     &= 3 e^(-t) + 2 e^(-2t) + 1
$

この伝達関数の極は $p_1 = -1, p_2 = -2$
零点は $s = 2$

図示すると、@fig1 の通り

#figure(
  image("./fig1.png", width: 60%),
  caption: "概略図"
) <fig1>

また、安定性は、伝達関数の極の実数が全て負であるから、システムは安定である。

== 演習課題 3

== 演習課題 4

== 演習課題 5


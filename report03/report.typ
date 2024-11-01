#import "../template.typ": *
#import "@preview/physica:0.9.2": *
#import "@preview/tenv:0.1.1": parse_dotenv

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第3回",
  authors: (
    (
      name: env.STUDENT_NAME,
      id: env.STUDENT_ID,
      affiliation: env.STUDENT_AFFILIATION
    ),
  ),
  date: "2024 年 10 月 31 日",
)

== 演習課題 1

#align(center)[
  #image("image0.jpg", width: 70%)
]

== 演習課題 2

ブロック図は以下のようになる。

#align(center)[
  #image("image1.jpg", width: 70%)
]

また、運動方程式は次の通り

$
m accent(x, dot.double) =
  -k(x - x_0) - c(accent(x, dot) - accent(x_0, dot)) \
<=> m accent(x, dot.double) + c accent(x, dot)  + k x =
  c accent(x_0, dot) + k x_0
$

これに対してラプラス変換を行うと、

$
m s^2 X(s) + c s X(s) + k X(s) = c s X_0 (s) + k X_0 (s) \
=> X(s) (m s^2 + c s + k) = X_0 (s) (c s + k) \
therefore X(s) / (X_0 (s)) = (c s + k) / (m s^2 + c s + k)
$

== 演習課題 3

運動方程式は以下の通り

$
m accent(x, dot.double) = - k x - c accent(x, dot) - k x - c accent(x, dot) + f \
therefore m accent(x, dot.double) + 2 c accent(x, dot) + 2 k x = f
$

これに対して初期値を $0$ とし、ラプラス変換を行うと、

$
m s^2 X(s) + 2 c s X(s) + 2 k X(s) = F(s) \
<=> X(s) (m s^2 + 2 c s + 2 k) = F(x) \
therefore F(x) / X(s) = m s^2 + 2 c s + 2 k
$


== 演習課題 4

#align(center)[
  #image("image2.jpg", width: 70%)
]

$E(s)$ を上に示す図のようにおくと、

$
Y(s) &= G_1(s) E(s) \
E(s) &= X(s) - Y(s) G_2(s) (G_3(s) + G_4(s)) \

therefore
Y(s) &=  G_1(s) (X(s) - Y(s) G_2(s) (G_3(s) + G_4(s))) \
     &=  G_1(s) (X(s) - Y(s) G_2(s) G_3(s) - Y(s) G_2(s) G_4(s)) \
     &= G_1(s) X - Y(s)G_1(s)G_2(s)G_3(s) - Y(s)G_2(s)G_4(s) \
$

$
therefore
G_1(s)X(s) =  Y(s) (1 + G_1(s)G_2(s)G_3(s) + G_1(s)G_2(s)G_4(s)) \
$

$
therefore
Y(s) / X(s) = (G_1(s)) / (1 + G_1(s)G_2(s)G_3(s) + G_1(s)G_2(s)G_4(s))
$

== 演習課題 5

#set enum(numbering: "(1)")

+ 与えられた式の両辺に $4$ を掛けてラプラス変換を行うと、
  $
    Y(s) + 12 s Y(s) - 8 U(s) = 0 \
    therefore Y(s) (1 + 12 s) = 8 U(s) \
  $
  よって、
  $
    G(s) = Y(s) / U(s) = 8 / (1 + 12 s)
  $

+ 与式にラプラス変換を行うと、
  $
    s^3 Y(s) + 2 s^2 Y(s) + 5 Y(s) = s U(t) \
    therefore Y(s) (s^3 + 2 s^2 + 5) = s U(t) \
  $
  よって、
  $
    G(s) = Y(s) / U(s) = s / (s^3 + 2 s^2 + 5)
  $

+ 与式にラプラス変換を行うと、
  $
    s Y(s) + Y(s) + 1/s Y(s) - s Y(s) - s U(t) + 1/2 U(t) = 0 \
    therefore Y(s) (s + 1 + 1/s - s) = U(t) (s - 1/2) \
  $
  よって、
  $
    G(s) = Y(s) / U(s) = (s - 1/2) / (1 + 1/s) = (2 s^2 - s) / (2s + 2)
  $

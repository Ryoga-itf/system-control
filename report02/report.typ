#import "../template.typ": *
#import "@preview/physica:0.9.2": *
#import "@preview/tenv:0.1.1": parse_dotenv

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第2回",
  authors: (
    (
      name: env.STUDENT_NAME,
      id: env.STUDENT_ID,
      affiliation: env.STUDENT_AFFILIATION
    ),
  ),
  date: "2024 年 10 月 25 日",
)

== 問題 1

=== (1)

#image("image1.png", width: 60%)

=== (2)

$
m accent(x, dot.double) = f - k x - c accent(x, dot) - k x - c accent(x, dot) \
therefore m accent(x, dot.double) = f - 2k x - 2c accent(x, dot) \
$

よって、

$
m accent(x, dot.double) + 2c accent(x, dot) + 2k x = f
$


== 課題 2

$
cal(L)( M dv(x(t), t, 2) ) + cal(L)(D dv(x(t), t)) + cal(L)(K x(t)) = cal(L) (f(x))
$

$x(0) = x'(0) = 0$ また $cal(L){ delta(t) } = 1$ であるから、

$
M s^2 X(s) + D s X(s) + K X(s) = 1 \
therefore X(s) (M s^2 + D s + K) = 1
$

よって求める答は、

$
X(s) = 1 / (M s^2 + D s + K)
$

== 課題 3

#image("image2.png", width: 60%)

式は以下のようになる。

$
m accent(v, dot) (t) = f_x (t) - c v(t)
$

これをラプラス変換して、

$
m s V(s) = F_x (s) - c V(s) \
therefore 0 = F_x (s) - m s V(s) - c V(s)
$

== 課題 4

順に、

$
9 s^2 X(s) + X(s) = 1/s
$

$
s^2 X(s) + 3s X(s) + 2X(s) = 4/s
$

$
s X(s) + 3X(s) = 2 / (s^2 + 4)
$

$
m s^2 X(s) + 2c s X(s) + 2 k X(s) = F(s)
$

$
s Y(s) + a Y(s) = 1 / (s - k)
$

== 課題 5

$
cal(L) (f(t))
&= integral_0^inf e^(-s t) f(t) dd(t) \
&= integral_0^inf e^(-s t) sin omega t dd(t) \
&= [-1/s e^(-s t) sin omega t]_0^inf - integral_0^inf -omega/s e^(-s t) cos omega t dd(t) \
&= (0 - 0) + integral_0^inf omega/s e^(-s t) cos omega t dd(t) \
&= [-omega/s^2 e^(-s t) cos omega t]_0^inf - integral_0^inf w^2/s^2 e^(-s t) sin omega t dd(t) \
&= -(omega/s^2) - omega^2/s^2 integral_0^inf e^(-s t) sin omega t dd(t) \
&= -(omega/s^2) - omega^2/s^2 integral_0^inf e^(-s t) f(t) dd(t) \
&= -(omega/s^2) - omega^2/s^2 cal(L) (f(t)) \
$

よって、

$
cal(L) (f(t)) = omega / (s^2 + omega^2)
$

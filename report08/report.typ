#import "../template.typ": *
#import "@preview/physica:0.9.2": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0": plot, chart

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第8回",
  authors: (
    (
      name: env.STUDENT_NAME,
      id: env.STUDENT_ID,
      affiliation: env.STUDENT_AFFILIATION
    ),
  ),
  date: "2024 年 12 月 13 日",
)

== 演習課題 1

フィードバックシステムの偏差 $E(s)$ は、

$
E(s) = R(s) / (1 + K_p G(s))
$

であるから、

$
E(s)
= R(s) / (1 + K_p / (s^2 + 3s + 2))
= (R(s) (s^2 + 3s + 2)) / (s^2 + 3s + 2 + K_p)
$

ステップ入力であるため $R(s) = 1/s$

よって、

$
E(s)
= (s^2 + 3s + 2) / s(s^2 + 3s + 2 + K_p)
$

最終値の定理により

$
e(infinity)
= lim_(t -> infinity) e(t)
= lim_(s -> 0) s E(s)
= lim_(s -> 0) s (s^2 + 3s + 2) / s(s^2 + 3s + 2 + K_p)
= 2 / (2 + K_p)
$

+ $K_p = 1$ のとき
  定常偏差は $2 / 3$
+ $K_p = 5$ のとき
  定常偏差は $2 / 7$
+ $K_p = 20$ のとき
  定常偏差は $1 / 11$

以上より、$K_p$ の値が大きくなると、定常偏差はそれに反比例し、小さくなる。

== 演習課題 2

=== (a)

$
U(s) = C(s)E(s) = (K_p + K_I/s + s K_D) E(s)
$

と表すことができ、$K_p = 33, K_I = 30, K_D = 3$ であるから、

$
C(s)
= 33 + 30/s + 3s
= (3s^2 + 33s + 30) / s
= (3(s^2 + 11s + 10))/s
= (3(s + 1)(s + 10))/s
$

=== (b)

$
P(s) = 10 / ((s + 1)(s + 10))
$

であるから、

$
G(s)
&= Y(s) / R(s) \
&= (C(s) P(s)) / (1 + C(s) P(s)) \
&= 1
  / (1 + ((3(s + 1)(s + 10))/s) (10 / ((s + 1)(s + 10)) ))
  dot (3(s + 1)(s + 10))/s
  dot 10 / ((s + 1)(s + 10)) \
&= 1 / (1 + 30 / s) dot 30 / s \
&= 30 / (s + 30) \
$

ステップ入力であるため $R(s) = 1/s$ であるから、

$
Y(s)
= G(s) R(s)
= 30 / (s + 30) dot 1/s = 30 / (s(s+30)) = 1/s - 1/(s+30)
$

時間応答 $y(t)$ は $Y(s)$ に逆ラプラス変換を施すことで得られる。

$
y(t)
= cal(L)^(-1) { Y(s) }
= 1 - e^(-30t)
$

また、この応答波形を図示すると以下の通り。

#align(center)[
  #cetz.canvas({
    plot.plot(
      size: (15, 9),
      x-label: [$t$],
      x-min: 0,
      x-max: 1,
      x-grid: "major",
      x-tick-step: 0.1,
      y-tick-step: 0.1,
      y-label: [$y(t)$],
      y-max: 1.08,
      y-min: 0,
      y-grid: "major",
      {
        plot.add(
          domain: (0, 5),
          samples: 500,
          t => (
            1 - calc.exp(-30 * t)
          )
        )
      }
    )
  })
]

== 演習課題 3

$
G(s)
&= (C(s) P(s)) / (1 + C(s) P(s)) \
&= K / (s + 4) dot 1 / (s + 2) dot 1 / (1 + K / (s + 4) dot 1 / (s + 2)) \
&= K / ((s + 4)(s + 2)) dot ((s + 4)(s + 2)) / ((s + 4)(s + 2) + K) \
&= K / ((s + 4)(s + 2) + K)
$

$(s + 4)(s + 2) + K = s^2 + 6s + 8 + K = 0$ を満たす $s$ が極であり、その値は

$
s
= (-6 plus.minus sqrt(36 - 4(8 + K)))/2
= -3 plus.minus sqrt(1 - K)
$

この極の実部がすべて負であればシステムは安定である。
そのような $K$ の条件を考える。

+ $K < 1$ のとき

  極 $s$ の実部は $Re(s) = -3 plus.minus sqrt(1 - K)$

  $-3 - sqrt(1 - K)$ は常に負である。

  $-3 + sqrt(1 - K)$ が負になるためには $-3 + sqrt(1 - K) < 0 <=> sqrt(1 - K) < 3$ を満たせばよい。

  すなわち、$1 - K < 9 space therefore K > -8$

  $K < 1$ との共通部分は $-8 < K < 1$

+ $K = 1$ のとき、

  極 $s$ の実部は $Re(s) = Re(-3) = -3 < 0$ より安定。

+ $K > 1$ のとき、

  極 $s$ の実部は、$Re(s) = Re(-3 plus.minus i sqrt(K - 1)) = -3 < 0$ より安定


よって以上の共通部分を考えると、求めるべき条件は

$
K > -8
$

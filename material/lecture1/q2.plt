set terminal tikz size 8cm, 8cm
set output "q2.tex"
#set terminal wxt
set size square

set xlabel "$x / a$"
set ylabel "$V(x)\times L / 4$"
set xrange [-2.2:2.2]
set yrange [-0.1:1.1]

f(x) = cos(pi*x)**2

plot f(x) notitle
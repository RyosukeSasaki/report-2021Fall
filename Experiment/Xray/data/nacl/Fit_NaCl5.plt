reset
set term qt
set xrange [53.5:54]
pi = 3.1415926535

x0 = 53.72
BG = 48000
AG = -50
A = 100
sigma = 0.1
f1(x)=A/(sqrt(2*pi)*sigma)*exp(-(x-x0)**2/(2*sigma**2))
f2(x)=A/(2*sqrt(2*pi)*sigma)*exp(-(x-2*180/pi*asin(1.54433/1.54051*sin(x0/2*pi/180)))**2/(2*sigma**2))   
g(x)=f1(x)+f2(x)+BG+AG*x
fit [53.6:53.8] g(x) "NaCl.txt" via x0, sigma, A, BG, AG
plot "NaCl.txt" u 1:2,\
g(x)

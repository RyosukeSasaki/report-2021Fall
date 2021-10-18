set fit errorvariables
set fit quiet

fname = "thin/pipe-thin_P-vs-T_1.dat"
a=7
c=22
d=0.2
f(x) = a*exp(-(x-b)/c)+d
fit_end=270
fit_begin=120

while (fit_begin < fit_end) {b=fit_begin; fit [fit_begin:fit_end] f(x) fname via a,b,c,d; print sprintf("%f, %f", fit_begin, c_err); fit_begin = fit_begin + 1}
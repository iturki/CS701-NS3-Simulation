set view map
set xlabel "X"
set ylabel "Y"
set cblabel "SINR (dB)"
unset key
#assumes the rem file outputed is named lena-dual-stripe.rem. You can customize the name in the example file.
plot "lena-dual-stripe.rem" using ($1):($2):(10*log10($4)) with image
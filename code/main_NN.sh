# prepare executable
g++ Denoise_Data.cpp -o Denoise -O3
g++ Noise_Data.cpp -o Noise -O3
g++ Mesure_Data.cpp -o Mesure -O3
g++ GetMeanVar.cpp -o GetMeanVar -O3
g++ Plot.cpp -o Plot -O3

{ 
    sh GenData.sh CID22_png_g
}&
T1=${!}
{ 
    sh GenData.sh CID22_png_rgb 
}&
T2=${!}

wait ${T1}
wait ${T2}

rm Denoise
rm Noise
rm Mesure 
rm GetMeanVar
rm Plot
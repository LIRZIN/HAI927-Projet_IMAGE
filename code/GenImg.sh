
#
#echo "$ImgInLoc"
#for eachfile in $ImgInLoc
#do
    #echo "${eachfile%.*}";
#done

ImgInLoc="DB/$1/"
if [ "$2" = "N" ] 
then 
    if [ "$3" = "GAU" ] 
    then
        ImgOutLoc="DB/$1_$2/$3_$4_$5/"
        mkdir $ImgOutLoc

        ImgsIn=`ls $ImgInLoc`
        for eachfile in $ImgsIn
        do
            ./Noise $ImgInLoc $eachfile $ImgOutLoc $3 $4 $5 
        done
    elif [ "$3" = "IMP" ] || [ "$3" = "PES" ] || [ "$3" = "POI" ] || [ "$3" = "SPE" ] 
    then
        ImgOutLoc="DB/$1_$2/$3_$4/"
        mkdir $ImgOutLoc

        ImgsIn=`ls $ImgInLoc`
        for eachfile in $ImgsIn
        do
            ./Noise $ImgInLoc $eachfile $ImgOutLoc $3 $4 
        done
    fi

elif [ "$2" = "D" ] 
then 
    if [ "$4" = "MOY" ] || [ "$4" = "MED" ] 
    then
        ImgInLoc="DB/$1""_N""/$3/"
        ImgOutLoc="DB/$1_$2/$3_$4_$5/"
        mkdir $ImgOutLoc

        ImgsIn=`ls $ImgInLoc`
        for eachfile in $ImgsIn
        do
            ./Denoise $ImgInLoc $eachfile $ImgOutLoc $4 $5 
        done
    elif [ "$4" = "WIE" ] || [ "$4" = "FOU" ] || [ "$4" = "GRA" ] || [ "$4" = "PON" ]
    then
        ImgInLoc="DB/$1""_N""/$3/"
        ImgOutLoc="DB/$1_$2/$3_$4_$5_$6/"
        mkdir $ImgOutLoc

        ImgsIn=`ls $ImgInLoc`
        for eachfile in $ImgsIn
        do
            ./Denoise $ImgInLoc $eachfile $ImgOutLoc $4 $5 $6 
        done
    elif [ "$4" = "GAU" ] || [ "$4" = "NLM" ]
    then
        ImgInLoc="DB/$1""_N""/$3/"
        ImgOutLoc="DB/$1_$2/$3_$4_$5_$6_$7/"
        mkdir $ImgOutLoc

        ImgsIn=`ls $ImgInLoc`
        for eachfile in $ImgsIn
        do
            ./Denoise $ImgInLoc $eachfile $ImgOutLoc $4 $5 $6 $7 
        done
    fi
elif [ "$2" = "M" ] 
then 
    ImgsIn=`ls $ImgInLoc`
    DImg="DB/$1_D/$3/"

    for eachfile in $ImgsIn
    do
        for mode in PSNR SNR SSIM RMSE
        do
            txtfile="DB/$1_$2/$mode/{$mode}_$3.txt"

            ./Mesure $ImgInLoc$eachfile $DImg$eachfile $mode $txtfile
        done
    done

    ImgsIn=`ls ./DB/CID22_pgm/`
    DImg="./DB/CID22_pgm/"

    for eachfile in $ImgsIn
    do
        for mode in SNR 
        do
            txtfile="./{$mode}_CID22_pgm.txt"

            ./Mesure $DImg$eachfile $DImg$eachfile $mode $txtfile
        done
    done
elif [ "$2" = "F" ] 
then 
    for mode in PSNR SNR SSIM RMSE
    do
        txtfileIn="DB/$1_M/$mode/{$mode}_$3.txt"
        txtfileOut="DB/$1_M/$mode/{$mode}_$4.txt"

        tenth_arg=${10}

        ./GetMeanVar $txtfileIn $txtfileOut $5 $6 $7 $8 $9 $tenth_arg
    done
elif [ "$2" = "R" ] 
then 
    rm -f $1/*
    rmdir $1
fi
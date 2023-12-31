#include "src/image_ppm.h"
#include "src/mosaique_Color.h"

int main( int argc, char** argv )
{
    if( 0 ) //argc != 6 )
    {
        printf("Usage : ImgIn ImgOut DataBase_Grey DimX DimY\n\n");
        return 1;
    }

    int taille_imagette = 512;
    
    DataBase_Color DB( "./res/CID22", taille_imagette, taille_imagette );
    DB.load_DataBase_Color();

    mosaique_Color MPGM( "./res/ImgIn/beach.png", "./res/ImgOut/beach_outline_32.png", taille_imagette, taille_imagette );
    MPGM.copy_used_imagettes( std::string("./res/CID22_ppm/"), std::string(".ppm"), DB );
/*
    mosaique_Grey MPGM( "./res/ImgIn/beach.png", "./res/ImgOut/beach_outline_32.png", taille_imagette, taille_imagette );
    MPGM.load_ImgIn();
    MPGM.generate_ImgOut_outline( DB );
    MPGM.write_ImgOut();

    MPGM.load_ImgIn();
    MPGM.generate_ImgOut_PSNR( DB );
    MPGM.write_ImgOut();

    MPGM.set_ImgOutStr( "./mire_mean_32.png" );
    MPGM.generate_ImgOut_mean( DB );
    MPGM.write_ImgOut();

    MPGM.set_ImgOutStr( "./mire_var.pgm" );
    MPGM.generate_ImgOut_variance( DB );
    MPGM.write_ImgOut();
*/
    return 0;
}
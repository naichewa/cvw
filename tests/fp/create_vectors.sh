#!/bin/sh
BUILD="../../addins/TestFloat-3e/build/Linux-x86_64-GCC"
OUTPUT="./vectors"
echo "Creating ui32_to_f16 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even ui32_to_f16 > $OUTPUT/ui32_to_f16_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag ui32_to_f16 > $OUTPUT/ui32_to_f16_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax ui32_to_f16 > $OUTPUT/ui32_to_f16_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin ui32_to_f16 > $OUTPUT/ui32_to_f16_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag ui32_to_f16 > $OUTPUT/ui32_to_f16_rnm.tv
echo "Creating ui32_to_f32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even ui32_to_f32 > $OUTPUT/ui32_to_f32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag ui32_to_f32 > $OUTPUT/ui32_to_f32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax ui32_to_f32 > $OUTPUT/ui32_to_f32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin ui32_to_f32 > $OUTPUT/ui32_to_f32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag ui32_to_f32 > $OUTPUT/ui32_to_f32_rnm.tv
echo "Creating ui32_to_f64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even ui32_to_f64 > $OUTPUT/ui32_to_f64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag ui32_to_f64 > $OUTPUT/ui32_to_f64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax ui32_to_f64 > $OUTPUT/ui32_to_f64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin ui32_to_f64 > $OUTPUT/ui32_to_f64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag ui32_to_f64 > $OUTPUT/ui32_to_f64_rnm.tv
echo "Creating ui32_to_f128 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even ui32_to_f128 > $OUTPUT/ui32_to_f128_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag ui32_to_f128 > $OUTPUT/ui32_to_f128_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax ui32_to_f128 > $OUTPUT/ui32_to_f128_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin ui32_to_f128 > $OUTPUT/ui32_to_f128_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag ui32_to_f128 > $OUTPUT/ui32_to_f128_rnm.tv
echo "Creating ui64_to_f16 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even ui64_to_f16 > $OUTPUT/ui64_to_f16_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag ui64_to_f16 > $OUTPUT/ui64_to_f16_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax ui64_to_f16 > $OUTPUT/ui64_to_f16_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin ui64_to_f16 > $OUTPUT/ui64_to_f16_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag ui64_to_f16 > $OUTPUT/ui64_to_f16_rnm.tv
echo "Creating ui64_to_f32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even ui64_to_f32 > $OUTPUT/ui64_to_f32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag ui64_to_f32 > $OUTPUT/ui64_to_f32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax ui64_to_f32 > $OUTPUT/ui64_to_f32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin ui64_to_f32 > $OUTPUT/ui64_to_f32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag ui64_to_f32 > $OUTPUT/ui64_to_f32_rnm.tv
echo "Creating ui64_to_f64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even ui64_to_f64 > $OUTPUT/ui64_to_f64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag ui64_to_f64 > $OUTPUT/ui64_to_f64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax ui64_to_f64 > $OUTPUT/ui64_to_f64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin ui64_to_f64 > $OUTPUT/ui64_to_f64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag ui64_to_f64 > $OUTPUT/ui64_to_f64_rnm.tv
echo "Creating ui64_to_f128 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even ui64_to_f128 > $OUTPUT/ui64_to_f128_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag ui64_to_f128 > $OUTPUT/ui64_to_f128_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax ui64_to_f128 > $OUTPUT/ui64_to_f128_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin ui64_to_f128 > $OUTPUT/ui64_to_f128_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag ui64_to_f128 > $OUTPUT/ui64_to_f128_rnm.tv
echo "Creating i32_to_f16 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even i32_to_f16 > $OUTPUT/i32_to_f16_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag i32_to_f16 > $OUTPUT/i32_to_f16_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax i32_to_f16 > $OUTPUT/i32_to_f16_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin i32_to_f16 > $OUTPUT/i32_to_f16_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag i32_to_f16 > $OUTPUT/i32_to_f16_rnm.tv
echo "Creating i32_to_f32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even i32_to_f32 > $OUTPUT/i32_to_f32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag i32_to_f32 > $OUTPUT/i32_to_f32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax i32_to_f32 > $OUTPUT/i32_to_f32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin i32_to_f32 > $OUTPUT/i32_to_f32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag i32_to_f32 > $OUTPUT/i32_to_f32_rnm.tv
echo "Creating i32_to_f64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even i32_to_f64 > $OUTPUT/i32_to_f64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag i32_to_f64 > $OUTPUT/i32_to_f64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax i32_to_f64 > $OUTPUT/i32_to_f64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin i32_to_f64 > $OUTPUT/i32_to_f64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag i32_to_f64 > $OUTPUT/i32_to_f64_rnm.tv
echo "Creating i32_to_f128 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even i32_to_f128 > $OUTPUT/i32_to_f128_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag i32_to_f128 > $OUTPUT/i32_to_f128_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax i32_to_f128 > $OUTPUT/i32_to_f128_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin i32_to_f128 > $OUTPUT/i32_to_f128_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag i32_to_f128 > $OUTPUT/i32_to_f128_rnm.tv
echo "Creating i64_to_f16 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even i64_to_f16 > $OUTPUT/i64_to_f16_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag i64_to_f16 > $OUTPUT/i64_to_f16_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax i64_to_f16 > $OUTPUT/i64_to_f16_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin i64_to_f16 > $OUTPUT/i64_to_f16_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag i64_to_f16 > $OUTPUT/i64_to_f16_rnm.tv
echo "Creating i64_to_f32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even i64_to_f32 > $OUTPUT/i64_to_f32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag i64_to_f32 > $OUTPUT/i64_to_f32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax i64_to_f32 > $OUTPUT/i64_to_f32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin i64_to_f32 > $OUTPUT/i64_to_f32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag i64_to_f32 > $OUTPUT/i64_to_f32_rnm.tv
echo "Creating i64_to_f64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even i64_to_f64 > $OUTPUT/i64_to_f64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag i64_to_f64 > $OUTPUT/i64_to_f64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax i64_to_f64 > $OUTPUT/i64_to_f64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin i64_to_f64 > $OUTPUT/i64_to_f64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag i64_to_f64 > $OUTPUT/i64_to_f64_rnm.tv
echo "Creating i64_to_f128 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even i64_to_f128 > $OUTPUT/i64_to_f128_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag i64_to_f128 > $OUTPUT/i64_to_f128_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax i64_to_f128 > $OUTPUT/i64_to_f128_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin i64_to_f128 > $OUTPUT/i64_to_f128_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag i64_to_f128 > $OUTPUT/i64_to_f128_rnm.tv
echo "Creating f16_to_ui32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f16_to_ui32 > $OUTPUT/f16_to_ui32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f16_to_ui32 > $OUTPUT/f16_to_ui32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f16_to_ui32 > $OUTPUT/f16_to_ui32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f16_to_ui32 > $OUTPUT/f16_to_ui32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f16_to_ui32 > $OUTPUT/f16_to_ui32_rnm.tv
echo "Creating f32_to_ui32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f32_to_ui32 > $OUTPUT/f32_to_ui32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f32_to_ui32 > $OUTPUT/f32_to_ui32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f32_to_ui32 > $OUTPUT/f32_to_ui32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f32_to_ui32 > $OUTPUT/f32_to_ui32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f32_to_ui32 > $OUTPUT/f32_to_ui32_rnm.tv
echo "Creating f64_to_ui32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f64_to_ui32 > $OUTPUT/f64_to_ui32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f64_to_ui32 > $OUTPUT/f64_to_ui32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f64_to_ui32 > $OUTPUT/f64_to_ui32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f64_to_ui32 > $OUTPUT/f64_to_ui32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f64_to_ui32 > $OUTPUT/f64_to_ui32_rnm.tv
echo "Creating f128_to_ui32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f128_to_ui32 > $OUTPUT/f128_to_ui32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f128_to_ui32 > $OUTPUT/f128_to_ui32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f128_to_ui32 > $OUTPUT/f128_to_ui32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f128_to_ui32 > $OUTPUT/f128_to_ui32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f128_to_ui32 > $OUTPUT/f128_to_ui32_rnm.tv
echo "Creating f16_to_ui64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f16_to_ui64 > $OUTPUT/f16_to_ui64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f16_to_ui64 > $OUTPUT/f16_to_ui64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f16_to_ui64 > $OUTPUT/f16_to_ui64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f16_to_ui64 > $OUTPUT/f16_to_ui64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f16_to_ui64 > $OUTPUT/f16_to_ui64_rnm.tv
echo "Creating f32_to_ui64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f32_to_ui64 > $OUTPUT/f32_to_ui64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f32_to_ui64 > $OUTPUT/f32_to_ui64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f32_to_ui64 > $OUTPUT/f32_to_ui64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f32_to_ui64 > $OUTPUT/f32_to_ui64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f32_to_ui64 > $OUTPUT/f32_to_ui64_rnm.tv
echo "Creating f64_to_ui64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f64_to_ui64 > $OUTPUT/f64_to_ui64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f64_to_ui64 > $OUTPUT/f64_to_ui64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f64_to_ui64 > $OUTPUT/f64_to_ui64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f64_to_ui64 > $OUTPUT/f64_to_ui64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f64_to_ui64 > $OUTPUT/f64_to_ui64_rnm.tv
echo "Creating f128_to_ui64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f128_to_ui64 > $OUTPUT/f128_to_ui64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f128_to_ui64 > $OUTPUT/f128_to_ui64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f128_to_ui64 > $OUTPUT/f128_to_ui64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f128_to_ui64 > $OUTPUT/f128_to_ui64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f128_to_ui64 > $OUTPUT/f128_to_ui64_rnm.tv
echo "Creating f16_to_i32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f16_to_i32 > $OUTPUT/f16_to_i32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f16_to_i32 > $OUTPUT/f16_to_i32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f16_to_i32 > $OUTPUT/f16_to_i32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f16_to_i32 > $OUTPUT/f16_to_i32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f16_to_i32 > $OUTPUT/f16_to_i32_rnm.tv
echo "Creating f32_to_i32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f32_to_i32 > $OUTPUT/f32_to_i32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f32_to_i32 > $OUTPUT/f32_to_i32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f32_to_i32 > $OUTPUT/f32_to_i32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f32_to_i32 > $OUTPUT/f32_to_i32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f32_to_i32 > $OUTPUT/f32_to_i32_rnm.tv
echo "Creating f64_to_i32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f64_to_i32 > $OUTPUT/f64_to_i32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f64_to_i32 > $OUTPUT/f64_to_i32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f64_to_i32 > $OUTPUT/f64_to_i32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f64_to_i32 > $OUTPUT/f64_to_i32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f64_to_i32 > $OUTPUT/f64_to_i32_rnm.tv
echo "Creating f128_to_i32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f128_to_i32 > $OUTPUT/f128_to_i32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f128_to_i32 > $OUTPUT/f128_to_i32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f128_to_i32 > $OUTPUT/f128_to_i32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f128_to_i32 > $OUTPUT/f128_to_i32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f128_to_i32 > $OUTPUT/f128_to_i32_rnm.tv
echo "Creating f16_to_i64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f16_to_i64 > $OUTPUT/f16_to_i64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f16_to_i64 > $OUTPUT/f16_to_i64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f16_to_i64 > $OUTPUT/f16_to_i64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f16_to_i64 > $OUTPUT/f16_to_i64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f16_to_i64 > $OUTPUT/f16_to_i64_rnm.tv
echo "Creating f32_to_i64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f32_to_i64 > $OUTPUT/f32_to_i64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f32_to_i64 > $OUTPUT/f32_to_i64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f32_to_i64 > $OUTPUT/f32_to_i64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f32_to_i64 > $OUTPUT/f32_to_i64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f32_to_i64 > $OUTPUT/f32_to_i64_rnm.tv
echo "Creating f64_to_i64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f64_to_i64 > $OUTPUT/f64_to_i64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f64_to_i64 > $OUTPUT/f64_to_i64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f64_to_i64 > $OUTPUT/f64_to_i64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f64_to_i64 > $OUTPUT/f64_to_i64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f64_to_i64 > $OUTPUT/f64_to_i64_rnm.tv
echo "Creating f128_to_i64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_even f128_to_i64 > $OUTPUT/f128_to_i64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rminMag f128_to_i64 > $OUTPUT/f128_to_i64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmax f128_to_i64 > $OUTPUT/f128_to_i64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rmin f128_to_i64 > $OUTPUT/f128_to_i64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -exact -rnear_maxMag f128_to_i64 > $OUTPUT/f128_to_i64_rnm.tv
echo "Creating f16_to_f32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f16_to_f32 > $OUTPUT/f16_to_f32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f16_to_f32 > $OUTPUT/f16_to_f32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f16_to_f32 > $OUTPUT/f16_to_f32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f16_to_f32 > $OUTPUT/f16_to_f32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f16_to_f32 > $OUTPUT/f16_to_f32_rnm.tv
echo "Creating f16_to_f64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f16_to_f64 > $OUTPUT/f16_to_f64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f16_to_f64 > $OUTPUT/f16_to_f64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f16_to_f64 > $OUTPUT/f16_to_f64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f16_to_f64 > $OUTPUT/f16_to_f64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f16_to_f64 > $OUTPUT/f16_to_f64_rnm.tv
echo "Creating f16_to_f128 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f16_to_f128 > $OUTPUT/f16_to_f128_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f16_to_f128 > $OUTPUT/f16_to_f128_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f16_to_f128 > $OUTPUT/f16_to_f128_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f16_to_f128 > $OUTPUT/f16_to_f128_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f16_to_f128 > $OUTPUT/f16_to_f128_rnm.tv
echo "Creating f32_to_f16 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f32_to_f16 > $OUTPUT/f32_to_f16_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f32_to_f16 > $OUTPUT/f32_to_f16_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f32_to_f16 > $OUTPUT/f32_to_f16_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f32_to_f16 > $OUTPUT/f32_to_f16_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f32_to_f16 > $OUTPUT/f32_to_f16_rnm.tv
echo "Creating f32_to_f64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f32_to_f64 > $OUTPUT/f32_to_f64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f32_to_f64 > $OUTPUT/f32_to_f64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f32_to_f64 > $OUTPUT/f32_to_f64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f32_to_f64 > $OUTPUT/f32_to_f64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f32_to_f64 > $OUTPUT/f32_to_f64_rnm.tv
echo "Creating f32_to_f128 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f32_to_f128 > $OUTPUT/f32_to_f128_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f32_to_f128 > $OUTPUT/f32_to_f128_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f32_to_f128 > $OUTPUT/f32_to_f128_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f32_to_f128 > $OUTPUT/f32_to_f128_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f32_to_f128 > $OUTPUT/f32_to_f128_rnm.tv
echo "Creating f64_to_f16 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f64_to_f16 > $OUTPUT/f64_to_f16_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f64_to_f16 > $OUTPUT/f64_to_f16_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f64_to_f16 > $OUTPUT/f64_to_f16_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f64_to_f16 > $OUTPUT/f64_to_f16_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f64_to_f16 > $OUTPUT/f64_to_f16_rnm.tv
echo "Creating f64_to_f32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f64_to_f32 > $OUTPUT/f64_to_f32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f64_to_f32 > $OUTPUT/f64_to_f32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f64_to_f32 > $OUTPUT/f64_to_f32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f64_to_f32 > $OUTPUT/f64_to_f32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f64_to_f32 > $OUTPUT/f64_to_f32_rnm.tv
echo "Creating f64_to_f128 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f64_to_f128 > $OUTPUT/f64_to_f128_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f64_to_f128 > $OUTPUT/f64_to_f128_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f64_to_f128 > $OUTPUT/f64_to_f128_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f64_to_f128 > $OUTPUT/f64_to_f128_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f64_to_f128 > $OUTPUT/f64_to_f128_rnm.tv
echo "Creating f128_to_f16 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f128_to_f16 > $OUTPUT/f128_to_f16_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f128_to_f16 > $OUTPUT/f128_to_f16_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f128_to_f16 > $OUTPUT/f128_to_f16_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f128_to_f16 > $OUTPUT/f128_to_f16_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f128_to_f16 > $OUTPUT/f128_to_f16_rnm.tv
echo "Creating f128_to_f32 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f128_to_f32 > $OUTPUT/f128_to_f32_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f128_to_f32 > $OUTPUT/f128_to_f32_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f128_to_f32 > $OUTPUT/f128_to_f32_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f128_to_f32 > $OUTPUT/f128_to_f32_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f128_to_f32 > $OUTPUT/f128_to_f32_rnm.tv
echo "Creating f128_to_f64 convert vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f128_to_f64 > $OUTPUT/f128_to_f64_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f128_to_f64 > $OUTPUT/f128_to_f64_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f128_to_f64 > $OUTPUT/f128_to_f64_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f128_to_f64 > $OUTPUT/f128_to_f64_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f128_to_f64 > $OUTPUT/f128_to_f64_rnm.tv
echo "Creating f16_add vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f16_add > $OUTPUT/f16_add_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f16_add > $OUTPUT/f16_add_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f16_add > $OUTPUT/f16_add_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f16_add > $OUTPUT/f16_add_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f16_add > $OUTPUT/f16_add_rnm.tv
echo "Creating f32_add vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f32_add > $OUTPUT/f32_add_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f32_add > $OUTPUT/f32_add_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f32_add > $OUTPUT/f32_add_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f32_add > $OUTPUT/f32_add_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f32_add > $OUTPUT/f32_add_rnm.tv
echo "Creating f64_add vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f64_add > $OUTPUT/f64_add_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f64_add > $OUTPUT/f64_add_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f64_add > $OUTPUT/f64_add_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f64_add > $OUTPUT/f64_add_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f64_add > $OUTPUT/f64_add_rnm.tv
echo "Creating f128_add vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f128_add > $OUTPUT/f128_add_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f128_add > $OUTPUT/f128_add_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f128_add > $OUTPUT/f128_add_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f128_add > $OUTPUT/f128_add_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f128_add > $OUTPUT/f128_add_rnm.tv
echo "Creating f16_sub vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f16_sub > $OUTPUT/f16_sub_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f16_sub > $OUTPUT/f16_sub_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f16_sub > $OUTPUT/f16_sub_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f16_sub > $OUTPUT/f16_sub_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f16_sub > $OUTPUT/f16_sub_rnm.tv
echo "Creating f32_sub vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f32_sub > $OUTPUT/f32_sub_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f32_sub > $OUTPUT/f32_sub_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f32_sub > $OUTPUT/f32_sub_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f32_sub > $OUTPUT/f32_sub_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f32_sub > $OUTPUT/f32_sub_rnm.tv
echo "Creating f64_sub vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f64_sub > $OUTPUT/f64_sub_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f64_sub > $OUTPUT/f64_sub_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f64_sub > $OUTPUT/f64_sub_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f64_sub > $OUTPUT/f64_sub_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f64_sub > $OUTPUT/f64_sub_rnm.tv
echo "Creating f128_sub vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f128_sub > $OUTPUT/f128_sub_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f128_sub > $OUTPUT/f128_sub_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f128_sub > $OUTPUT/f128_sub_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f128_sub > $OUTPUT/f128_sub_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f128_sub > $OUTPUT/f128_sub_rnm.tv
echo "Creating f16_mul vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f16_mul > $OUTPUT/f16_mul_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f16_mul > $OUTPUT/f16_mul_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f16_mul > $OUTPUT/f16_mul_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f16_mul > $OUTPUT/f16_mul_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f16_mul > $OUTPUT/f16_mul_rnm.tv
echo "Creating f32_mul vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f32_mul > $OUTPUT/f32_mul_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f32_mul > $OUTPUT/f32_mul_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f32_mul > $OUTPUT/f32_mul_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f32_mul > $OUTPUT/f32_mul_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f32_mul > $OUTPUT/f32_mul_rnm.tv
echo "Creating f64_mul vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f64_mul > $OUTPUT/f64_mul_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f64_mul > $OUTPUT/f64_mul_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f64_mul > $OUTPUT/f64_mul_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f64_mul > $OUTPUT/f64_mul_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f64_mul > $OUTPUT/f64_mul_rnm.tv
echo "Creating f128_mul vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f128_mul > $OUTPUT/f128_mul_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f128_mul > $OUTPUT/f128_mul_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f128_mul > $OUTPUT/f128_mul_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f128_mul > $OUTPUT/f128_mul_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f128_mul > $OUTPUT/f128_mul_rnm.tv
echo "Creating f16_div vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f16_div > $OUTPUT/f16_div_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f16_div > $OUTPUT/f16_div_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f16_div > $OUTPUT/f16_div_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f16_div > $OUTPUT/f16_div_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f16_div > $OUTPUT/f16_div_rnm.tv
echo "Creating f32_div vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f32_div > $OUTPUT/f32_div_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f32_div > $OUTPUT/f32_div_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f32_div > $OUTPUT/f32_div_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f32_div > $OUTPUT/f32_div_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f32_div > $OUTPUT/f32_div_rnm.tv
echo "Creating f64_div vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f64_div > $OUTPUT/f64_div_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f64_div > $OUTPUT/f64_div_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f64_div > $OUTPUT/f64_div_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f64_div > $OUTPUT/f64_div_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f64_div > $OUTPUT/f64_div_rnm.tv
echo "Creating f128_div vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f128_div > $OUTPUT/f128_div_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f128_div > $OUTPUT/f128_div_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f128_div > $OUTPUT/f128_div_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f128_div > $OUTPUT/f128_div_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f128_div > $OUTPUT/f128_div_rnm.tv
echo "Creating f16_sqrt vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f16_sqrt > $OUTPUT/f16_sqrt_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f16_sqrt > $OUTPUT/f16_sqrt_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f16_sqrt > $OUTPUT/f16_sqrt_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f16_sqrt > $OUTPUT/f16_sqrt_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f16_sqrt > $OUTPUT/f16_sqrt_rnm.tv
echo "Creating f32_sqrt vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f32_sqrt > $OUTPUT/f32_sqrt_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f32_sqrt > $OUTPUT/f32_sqrt_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f32_sqrt > $OUTPUT/f32_sqrt_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f32_sqrt > $OUTPUT/f32_sqrt_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f32_sqrt > $OUTPUT/f32_sqrt_rnm.tv
echo "Creating f64_sqrt vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f64_sqrt > $OUTPUT/f64_sqrt_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f64_sqrt > $OUTPUT/f64_sqrt_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f64_sqrt > $OUTPUT/f64_sqrt_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f64_sqrt > $OUTPUT/f64_sqrt_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f64_sqrt > $OUTPUT/f64_sqrt_rnm.tv
echo "Creating f128_sqrt vectors"
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_even f128_sqrt > $OUTPUT/f128_sqrt_rne.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rminMag f128_sqrt > $OUTPUT/f128_sqrt_rz.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmax f128_sqrt > $OUTPUT/f128_sqrt_ru.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rmin f128_sqrt > $OUTPUT/f128_sqrt_rd.tv
$BUILD/testfloat_gen -tininessafter -level 2 -rnear_maxMag f128_sqrt > $OUTPUT/f128_sqrt_rnm.tv
echo "Creating f16_eq vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f16_eq > $OUTPUT/f16_eq_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f16_eq > $OUTPUT/f16_eq_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f16_eq > $OUTPUT/f16_eq_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f16_eq > $OUTPUT/f16_eq_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f16_eq > $OUTPUT/f16_eq_rnm.tv
echo "Creating f32_eq vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f32_eq > $OUTPUT/f32_eq_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f32_eq > $OUTPUT/f32_eq_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f32_eq > $OUTPUT/f32_eq_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f32_eq > $OUTPUT/f32_eq_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f32_eq > $OUTPUT/f32_eq_rnm.tv
echo "Creating f64_eq vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f64_eq > $OUTPUT/f64_eq_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f64_eq > $OUTPUT/f64_eq_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f64_eq > $OUTPUT/f64_eq_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f64_eq > $OUTPUT/f64_eq_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f64_eq > $OUTPUT/f64_eq_rnm.tv
echo "Creating f128_eq vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f128_eq > $OUTPUT/f128_eq_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f128_eq > $OUTPUT/f128_eq_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f128_eq > $OUTPUT/f128_eq_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f128_eq > $OUTPUT/f128_eq_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f128_eq > $OUTPUT/f128_eq_rnm.tv
echo "Creating f16_le vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f16_le > $OUTPUT/f16_le_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f16_le > $OUTPUT/f16_le_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f16_le > $OUTPUT/f16_le_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f16_le > $OUTPUT/f16_le_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f16_le > $OUTPUT/f16_le_rnm.tv
echo "Creating f32_le vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f32_le > $OUTPUT/f32_le_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f32_le > $OUTPUT/f32_le_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f32_le > $OUTPUT/f32_le_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f32_le > $OUTPUT/f32_le_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f32_le > $OUTPUT/f32_le_rnm.tv
echo "Creating f64_le vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f64_le > $OUTPUT/f64_le_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f64_le > $OUTPUT/f64_le_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f64_le > $OUTPUT/f64_le_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f64_le > $OUTPUT/f64_le_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f64_le > $OUTPUT/f64_le_rnm.tv
echo "Creating f128_le vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f128_le > $OUTPUT/f128_le_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f128_le > $OUTPUT/f128_le_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f128_le > $OUTPUT/f128_le_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f128_le > $OUTPUT/f128_le_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f128_le > $OUTPUT/f128_le_rnm.tv
echo "Creating f16_lt vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f16_lt > $OUTPUT/f16_lt_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f16_lt > $OUTPUT/f16_lt_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f16_lt > $OUTPUT/f16_lt_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f16_lt > $OUTPUT/f16_lt_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f16_lt > $OUTPUT/f16_lt_rnm.tv
echo "Creating f32_lt vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f32_lt > $OUTPUT/f32_lt_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f32_lt > $OUTPUT/f32_lt_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f32_lt > $OUTPUT/f32_lt_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f32_lt > $OUTPUT/f32_lt_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f32_lt > $OUTPUT/f32_lt_rnm.tv
echo "Creating f64_lt vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f64_lt > $OUTPUT/f64_lt_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f64_lt > $OUTPUT/f64_lt_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f64_lt > $OUTPUT/f64_lt_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f64_lt > $OUTPUT/f64_lt_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f64_lt > $OUTPUT/f64_lt_rnm.tv
echo "Creating f128_lt vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f128_lt > $OUTPUT/f128_lt_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f128_lt > $OUTPUT/f128_lt_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f128_lt > $OUTPUT/f128_lt_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f128_lt > $OUTPUT/f128_lt_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f128_lt > $OUTPUT/f128_lt_rnm.tv
echo "Creating f16_mulAdd vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f16_mulAdd > $OUTPUT/f16_mulAdd_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f16_mulAdd > $OUTPUT/f16_mulAdd_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f16_mulAdd > $OUTPUT/f16_mulAdd_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f16_mulAdd > $OUTPUT/f16_mulAdd_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f16_mulAdd > $OUTPUT/f16_mulAdd_rnm.tv
echo "Creating f32_mulAdd vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f32_mulAdd > $OUTPUT/f32_mulAdd_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f32_mulAdd > $OUTPUT/f32_mulAdd_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f32_mulAdd > $OUTPUT/f32_mulAdd_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f32_mulAdd > $OUTPUT/f32_mulAdd_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f32_mulAdd > $OUTPUT/f32_mulAdd_rnm.tv
echo "Creating f64_mulAdd vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f64_mulAdd > $OUTPUT/f64_mulAdd_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f64_mulAdd > $OUTPUT/f64_mulAdd_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f64_mulAdd > $OUTPUT/f64_mulAdd_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f64_mulAdd > $OUTPUT/f64_mulAdd_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f64_mulAdd > $OUTPUT/f64_mulAdd_rnm.tv
echo "Creating f128_mulAdd vectors"
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_even f128_mulAdd > $OUTPUT/f128_mulAdd_rne.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rminMag f128_mulAdd > $OUTPUT/f128_mulAdd_rz.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmax f128_mulAdd > $OUTPUT/f128_mulAdd_ru.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rmin f128_mulAdd > $OUTPUT/f128_mulAdd_rd.tv
$BUILD/testfloat_gen -tininessafter -level 1 -rnear_maxMag f128_mulAdd > $OUTPUT/f128_mulAdd_rnm.tv

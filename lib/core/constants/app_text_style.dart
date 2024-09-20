part of 'constants.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle clashDisplay = const TextStyle(
    fontFamily: 'Clash Display',
  );
}

extension TextStyleExtension on TextStyle {
  TextStyle setOpacity(double opacity) {
    if (color == null) {
      return this;
    }
    return copyWith(
      color: color!.withOpacity(opacity),
    );
  }

  TextStyle get w1 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w2 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w3 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w4 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w5 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w6 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w7 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w8 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w9 => copyWith(fontWeight: FontWeight.w900);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  TextStyle get s6 => copyWith(fontSize: 6.sp);
  TextStyle get s8 => copyWith(fontSize: 8.sp);
  TextStyle get s10 => copyWith(fontSize: 10.sp);
  TextStyle get s12 => copyWith(fontSize: 12.sp);
  TextStyle get s14 => copyWith(fontSize: 14.sp);
  TextStyle get s16 => copyWith(fontSize: 16.sp);
  TextStyle get s18 => copyWith(fontSize: 18.sp);
  TextStyle get s20 => copyWith(fontSize: 20.sp);
  TextStyle get s22 => copyWith(fontSize: 22.sp);
  TextStyle get s24 => copyWith(fontSize: 24.sp);
  TextStyle get s26 => copyWith(fontSize: 26.sp);
  TextStyle get s28 => copyWith(fontSize: 28.sp);
  TextStyle get s30 => copyWith(fontSize: 30.sp);
  TextStyle get s32 => copyWith(fontSize: 32.sp);
  TextStyle get s34 => copyWith(fontSize: 34.sp);
  TextStyle get s36 => copyWith(fontSize: 36.sp);
  TextStyle get s38 => copyWith(fontSize: 38.sp);
  TextStyle get s40 => copyWith(fontSize: 40.sp);
  TextStyle get s42 => copyWith(fontSize: 42.sp);
  TextStyle get s44 => copyWith(fontSize: 44.sp);
  TextStyle get s46 => copyWith(fontSize: 46.sp);
  TextStyle get s48 => copyWith(fontSize: 48.sp);
  TextStyle get s50 => copyWith(fontSize: 50.sp);
  TextStyle get s52 => copyWith(fontSize: 52.sp);
  TextStyle get s54 => copyWith(fontSize: 54.sp);
  TextStyle get s56 => copyWith(fontSize: 56.sp);
  TextStyle get s58 => copyWith(fontSize: 58.sp);
  TextStyle get s60 => copyWith(fontSize: 60.sp);
  TextStyle get s62 => copyWith(fontSize: 62.sp);
  TextStyle get s64 => copyWith(fontSize: 64.sp);
  TextStyle get s66 => copyWith(fontSize: 66.sp);
  TextStyle get s68 => copyWith(fontSize: 68.sp);
  TextStyle get s70 => copyWith(fontSize: 70.sp);
  TextStyle get s72 => copyWith(fontSize: 72.sp);
  TextStyle get s74 => copyWith(fontSize: 74.sp);
  TextStyle get s76 => copyWith(fontSize: 76.sp);
  TextStyle get s78 => copyWith(fontSize: 78.sp);
  TextStyle get s80 => copyWith(fontSize: 80.sp);
  TextStyle get s82 => copyWith(fontSize: 82.sp);
  TextStyle get s84 => copyWith(fontSize: 84.sp);
  TextStyle get s86 => copyWith(fontSize: 86.sp);
  TextStyle get s88 => copyWith(fontSize: 88.sp);
  TextStyle get s90 => copyWith(fontSize: 90.sp);
  TextStyle get s96 => copyWith(fontSize: 96.sp);

  TextStyle get pureWhite => copyWith(color: AppColors.pureWhite);
  TextStyle get pureBlack => copyWith(color: AppColors.pureBlack);

  TextStyle get eerieBlack => copyWith(color: AppColors.eerieBlack);

  TextStyle get philippineGray => copyWith(color: AppColors.philippineGray);

  TextStyle get letterSpacing1 => copyWith(letterSpacing: 1.0);
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AppColors.dart';

class AppTextStyles {
  static const TextStyle enterPageHeadline = TextStyle(
    fontFamily: 'Brandon',
    fontSize: 64,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryColorText,
  );

  static const TextStyle enterPageDescription = TextStyle(
    fontFamily: 'Brandon',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColorText,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: 'Brandon',
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryColorText,
  );

  static const TextStyle sidePanelText = TextStyle(
    fontFamily: 'Brandon',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColorSidePanelText,
  );

  static const TextStyle sidePanelTextHighlighted = TextStyle(
    fontFamily: 'Brandon',
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryColorSidePanelText,
  );

  static TextStyle homePageDescriptionText = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColorText,
  );

  static TextStyle additionalTextPureWhite = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.pureWhite,
  );

  static const TextStyle additionalTextHeadingStyle = TextStyle(
    fontFamily: 'Code',
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryColorText,
  );

  static const TextStyle logoTextStyle = TextStyle(
    fontFamily: 'Code',
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryColorText,
    letterSpacing: -1.5,
  );

  static TextStyle homePageMainText = GoogleFonts.inter(
    fontSize: 80,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle contactPageMessage = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.secondaryTextColorContactMessage,
  );

  static TextStyle aboutPageMainText = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(130, 130, 130, 1),
  );

  static const TextStyle aboutPageContainer = TextStyle(
    fontFamily: 'Brandon',
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColorText,
  );
  static const TextStyle openDialogHeading = TextStyle(
    fontFamily: 'Brandon',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.pureWhite,
  );
  static const TextStyle openDialogDescription = TextStyle(
    fontFamily: 'Code',
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryColorText,
  );
}

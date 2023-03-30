import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';
import '../../../../utils/app_buttons.dart';

part 'components/quiz_details_page_appbar_widget.dart';
part 'components/quiz_details_page_leaderboard_widget.dart';
part 'components/quiz_details_page_quiz_info_widget.dart';

class QuizDetailsPageWidget extends StatelessWidget {
  const QuizDetailsPageWidget({
    Key? key,
    required String quizId,
  })  : _quizId = quizId,
        super(key: key);

  final String _quizId;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const _QuizDetailsPageAppbarWidget(),
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 60.h,
          child: AppButtons.fillBorderedButton(
            fillColor: AppColors.mainPurple,
            borderColor: AppColors.mainPurpleDark,
            child: Text(
              'Start',
              style: AppTextStyles.bold(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
            width: double.infinity,
            sizeRatio: Size(3, 2),
            onTap: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 100.h,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/quiz_img.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25.w),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Re-Train your Brain AOT',
                style: AppTextStyles.bold(
                  fontSize: 24.sp,
                  color: AppColors.mainBlack,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(
                color: AppColors.mainDisableLight.withOpacity(0.3),
                height: 20.h,
                thickness: 1,
              ),
              const _QuizDetailsPageQuizInfoWidget(
                questionsQuantity: '10',
                completedQuantity: '1.2K',
                difficult: 'Hard',
                playedQuantity: '2.6K',
              ),
              Divider(
                color: AppColors.mainDisableLight.withOpacity(0.3),
                height: 20.h,
                thickness: 1,
              ),
              SizedBox(height: 10.h),
              Text(
                'Leaders',
                style: AppTextStyles.bold(
                  fontSize: 18.sp,
                  color: AppColors.mainBlack,
                ),
              ),
              SizedBox(height: 10.h),
              const _QuizDetailsPageLeaderboardWidget(),
              SizedBox(height: 20.h),
              Text(
                'Description',
                style: AppTextStyles.bold(
                  fontSize: 18.sp,
                  color: AppColors.mainBlack,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Removed is bed are pulled however colonel or law shyness unpacked minutes arose bed turned uncommonly state. Thirty father again placing domestic genius unwilling vexed west gentleman. Immediate abode twenty. Determine perceived entered furniture have collecting. Unaffected dissuade few again.',
                style: AppTextStyles.semiBold(
                  fontSize: 16.sp,
                  color: AppColors.mainSecondaryLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

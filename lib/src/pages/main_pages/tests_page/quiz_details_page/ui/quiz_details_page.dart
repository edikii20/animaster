import 'package:aniquiz/src/app/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../config/styles.dart';
import '../../../../../utils/widgets/common/app_buttons.dart';

part 'components/quiz_details_page_appbar_widget.dart';
part 'components/quiz_details_page_leaderboard_widget.dart';
part 'components/quiz_details_page_quiz_info_widget.dart';
part 'components/quiz_details_page_leaderboard_element_widget.dart';
part 'components/quiz_details_page_quiz_info_element_widget.dart';

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
        AppNavigation.pop(context: context);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const _QuizDetailsPageAppbarWidget(),
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          height: 60.sp,
          child: AppButtons.fillBorderedButton(
            fillColor: AppColors.mainPurple,
            borderColor: AppColors.mainPurpleDark,
            child: Text(
              'Start',
              style: AppTextStyles.bold(
                fontSize: 16.sp,
                color: AppColors.white,
              ),
            ),
            width: double.infinity,
            onTap: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20.sp,
            right: 20.sp,
            bottom: 100.sp,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280.sp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/quiz_img.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              20.verticalSpace,
              Text(
                'Re-Train your Brain AOT',
                style: AppTextStyles.bold(
                  fontSize: 24.sp,
                  color: AppColors.mainBlack,
                ),
              ),
              10.verticalSpace,
              Divider(
                color: AppColors.mainDisableLight.withOpacity(0.3),
                height: 20.sp,
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
                height: 20.sp,
                thickness: 1,
              ),
              10.verticalSpace,
              Text(
                'Leaders',
                style: AppTextStyles.bold(
                  fontSize: 18.sp,
                  color: AppColors.mainBlack,
                ),
              ),
              10.verticalSpace,
              const _QuizDetailsPageLeaderboardWidget(),
              20.verticalSpace,
              Text(
                'Description',
                style: AppTextStyles.bold(
                  fontSize: 18.sp,
                  color: AppColors.mainBlack,
                ),
              ),
              10.verticalSpace,
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

import 'package:aniquiz/src/config/styles.dart';
import 'package:aniquiz/src/pages/start_pages/boarding_page/cubit/boarding_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../app/app_navigation.dart';
import '../../../../utils/widgets/common/app_buttons.dart';
import '../../../../utils/widgets/common/app_text_widget.dart';

part 'components/boarding_page_tips_indicator_widget.dart';
part 'components/boarding_page_tips_widget.dart';
part 'components/boarding_page_tips_indicator_item_widget.dart';
part 'components/boarding_page_tip_widget.dart';

class BoardingPageWidget extends StatelessWidget {
  const BoardingPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _BoardingPageTipsWidget(),
              25.verticalSpace,
              BlocBuilder<BoardingPageCubit, BoardingPageState>(
                buildWhen: (previous, current) =>
                    previous.selectedIndex != current.selectedIndex,
                builder: (context, state) {
                  return _BoardingPageTipsIndicatorWidget(
                    selectedIndex: state.selectedIndex,
                  );
                },
              ),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: AppButtons.fillBorderedButton(
                  fillColor: AppColors.mainPurple,
                  borderColor: AppColors.mainPurpleDark,
                  child: AppTextWidget(
                    text: 'GET STARTED',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                  width: double.infinity,
                  onTap: () => AppNavigation.goToSignup(context: context),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: AppButtons.fillBorderedButton(
                  fillColor: AppColors.mainButtonWhiteLight,
                  borderColor: AppColors.mainDisableDark,
                  child: AppTextWidget(
                    text: 'I ALREADY HAVE AN ACCOUNT',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainPurple,
                  ),
                  width: double.infinity,
                  onTap: () => AppNavigation.goToLogin(context: context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

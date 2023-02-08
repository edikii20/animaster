import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/pages/start_pages/boarding_page/cubit/boarding_page_cubit.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

part 'components/boarding_page_tips_indicator_widget.dart';
part 'components/boarding_page_tips_widget.dart';

class BoardingPageWidget extends StatelessWidget {
  const BoardingPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _BoardingPageTipsWidget(sizeRatio: sizeRatio),
                SizedBox(height: 30 * sizeRatio.height),
                BlocBuilder<BoardingPageCubit, BoardingPageState>(
                  buildWhen: (previous, current) =>
                      previous.selectedIndex != current.selectedIndex,
                  builder: (context, state) {
                    return _BoardingPageTipsIndicatorWidget(
                      sizeRatio: sizeRatio,
                      selectedIndex: state.selectedIndex,
                    );
                  },
                ),
                SizedBox(height: 60 * sizeRatio.height),
                AppButtons.fillBorderedButton(
                  fillColor: AppColors.mainPurple,
                  borderColor: AppColors.mainPurpleDark,
                  child: Text(
                    'GET STARTED',
                    style: AppTextStyles.bold(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  sizeRatio: sizeRatio,
                  width: double.infinity,
                  onTap: () => context.goNamed('signup'),
                ),
                SizedBox(height: 30 * sizeRatio.height),
                AppButtons.fillBorderedButton(
                  fillColor: AppColors.mainButtonWhiteLight,
                  borderColor: AppColors.mainDisableDark,
                  child: Text(
                    'I ALREADY HAVE AN ACCOUNT',
                    style: AppTextStyles.bold(
                      fontSize: 16,
                      color: AppColors.mainPurple,
                    ),
                  ),
                  sizeRatio: sizeRatio,
                  width: double.infinity,
                  onTap: () => context.goNamed('login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

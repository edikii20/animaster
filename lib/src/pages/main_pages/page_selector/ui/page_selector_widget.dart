import 'package:aniquiz/src/app/app_navigation.dart';
import 'package:aniquiz/src/pages/main_pages/page_selector/cubit/page_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/styles.dart';
import '../../../../utils/widgets/common/app_buttons.dart';

part 'components/page_selector_bottom_nav_bar_widget.dart';
part 'components/page_selector_app_bar_widget.dart';

class PageSelectorWidget extends StatelessWidget {
  const PageSelectorWidget({
    Key? key,
    required Widget child,
  })  : _child = child,
        super(key: key);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PageSelectorCubit, PageSelectorState>(
      listenWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      listener: (context, state) {
        switch (state.selectedIndex) {
          case 0:
            AppNavigation.goToHome(context: context);
            break;
          case 1:
            AppNavigation.goToLibrary(context: context);
            break;
          case 2:
            AppNavigation.goToTests(context: context);
            break;
          case 3:
            AppNavigation.goToRating(context: context);
            break;
          case 4:
            AppNavigation.goToProfile(context: context);
            break;
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: const _PageSelectorAppBarWidget(),
          bottomNavigationBar: const _PageSelectorBottomNavBarWidget(),
          body: _child,
        ),
      ),
    );
  }
}

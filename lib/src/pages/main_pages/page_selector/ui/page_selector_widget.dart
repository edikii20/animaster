import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/pages/main_pages/page_selector/cubit/page_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/colors.dart';
import '../../../../config/sizes.dart';

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
    final sizeRatio = AppSizes.getSizeRatio(context);
    return BlocListener<PageSelectorCubit, PageSelectorState>(
      listenWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      listener: (context, state) {
        switch (state.selectedIndex) {
          case 0:
            context.goNamed('home');
            break;
          case 1:
            context.goNamed('library');
            break;
          case 2:
            context.goNamed('tests');
            break;
          case 3:
            context.goNamed('rating');
            break;
          case 4:
            context.goNamed('profile');
            break;
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _PageSelectorAppBarWidget(sizeRatio: sizeRatio),
          bottomNavigationBar:
              _PageSelectorBottomNavBarWidget(sizeRatio: sizeRatio),
          body: _child,
        ),
      ),
    );
  }
}

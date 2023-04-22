import 'package:aniquiz/src/app/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/styles.dart';
import '../../../../../utils/widgets/common/app_buttons.dart';

part 'components/tests_collection_details_page_appbar_widget.dart';
part 'components/tests_collection_details_page_header_widget.dart';
part 'components/tests_collection_details_page_list_quizzes_widget.dart';
part 'components/tests_collection_details_page_quiz_widget.dart';
part 'components/tests_collection_details_page_quiz_left_section_widget.dart';
part 'components/tests_collection_details_page_quiz_right_section_widget.dart';

class TestsCollectionDetailsPageWidget extends StatelessWidget {
  const TestsCollectionDetailsPageWidget({
    Key? key,
    required String collectionId,
  })  : _collectionId = collectionId,
        super(key: key);

  final String _collectionId;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppNavigation.pop(context: context);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const _TestsCollectionDetailsPageAppbarWidget(),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const _TestsCollectionDetailsPageHeaderWidget(),
            _TestsCollectionDetailsPageListQuizzesWidget(
              collectionId: _collectionId,
            ),
          ],
        ),
      ),
    );
  }
}

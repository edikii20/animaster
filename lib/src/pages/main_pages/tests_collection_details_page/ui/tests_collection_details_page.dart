import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';

part 'components/tests_collection_details_page_appbar_widget.dart';
part 'components/tests_collection_details_page_header_widget.dart';
part 'components/tests_collection_details_page_list_quizzes_widget.dart';
part 'components/tests_collection_details_page_quiz_widget.dart';

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
        context.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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

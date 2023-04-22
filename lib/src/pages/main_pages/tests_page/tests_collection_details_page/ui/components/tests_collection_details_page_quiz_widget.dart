part of '../tests_collection_details_page.dart';

class _TestsCollectionDetailsPageQuizWidget extends StatelessWidget {
  const _TestsCollectionDetailsPageQuizWidget({
    Key? key,
    required int index,
    required String collectionId,
  })  : _index = index,
        _collectionId = collectionId,
        super(key: key);

  final int _index;
  final String _collectionId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.sp),
      child: Stack(
        children: [
          Row(
            children: const [
              _TestsCollectionDetailsPageQuizLeftSectionWidget(),
              _TestsCollectionDetailsPageQuizRightSectionWidget(),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => AppNavigation.goToQuizDetails(
                  context: context,
                  quizId: '$_index',
                  collectionId: _collectionId,
                ),
                splashFactory: NoSplash.splashFactory,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

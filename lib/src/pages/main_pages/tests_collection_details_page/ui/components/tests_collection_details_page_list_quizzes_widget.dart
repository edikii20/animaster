part of '../tests_collection_details_page.dart';

class _TestsCollectionDetailsPageListQuizzesWidget extends StatelessWidget {
  const _TestsCollectionDetailsPageListQuizzesWidget({
    Key? key,
    required String collectionId,
  })  : _collectionId = collectionId,
        super(key: key);

  final String _collectionId;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _TestsCollectionDetailsPageQuizWidget(
            index: index,
            collectionId: _collectionId,
          ),
          childCount: 10,
        ),
      ),
    );
  }
}

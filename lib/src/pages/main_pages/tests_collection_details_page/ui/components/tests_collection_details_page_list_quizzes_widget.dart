part of '../tests_collection_details_page.dart';

class _TestsCollectionDetailsPageListQuizzesWidget extends StatelessWidget {
  const _TestsCollectionDetailsPageListQuizzesWidget({
    Key? key,
    required Size sizeRatio,
    required String collectionId,
  })  : _sizeRatio = sizeRatio,
        _collectionId = collectionId,
        super(key: key);

  final Size _sizeRatio;
  final String _collectionId;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20 * _sizeRatio.width),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _TestsCollectionDetailsPageQuizWidget(
            sizeRatio: _sizeRatio,
            index: index,
            collectionId: _collectionId,
          ),
          childCount: 10,
        ),
      ),
    );
  }
}

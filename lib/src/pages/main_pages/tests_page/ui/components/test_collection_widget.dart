part of '../tests_page.dart';

class _TestCollectionWidget extends StatelessWidget {
  const _TestCollectionWidget({
    Key? key,
    required Size sizeRatio,
    required int index,
  })  : _sizeRatio = sizeRatio,
        _index = index,
        super(key: key);

  final Size _sizeRatio;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/attack_on_titan.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.05),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 15 * _sizeRatio.height,
          left: 10 * _sizeRatio.width,
          right: 5 * _sizeRatio.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  'Attack on Titan Shingeki no Kyojin 4',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bold(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.goNamed(
                'collection_details',
                params: {
                  'collectionId': '1234',
                },
              ),
              splashFactory: NoSplash.splashFactory,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

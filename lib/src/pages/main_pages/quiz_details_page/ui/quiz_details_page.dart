import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/colors.dart';
import '../../../../config/sizes.dart';
import '../../../../config/text_styles.dart';
import '../../../../utils/app_buttons.dart';

part 'components/quiz_details_page_appbar_widget.dart';

class QuizDetailsPageWidget extends StatelessWidget {
  const QuizDetailsPageWidget({
    Key? key,
    required String quizId,
  })  : _quizId = quizId,
        super(key: key);

  final String _quizId;

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);
    return WillPopScope(
      onWillPop: () async {
        context.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _QuizDetailsPageAppbarWidget(sizeRatio: sizeRatio),
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
          height: 60 * sizeRatio.height,
          child: AppButtons.fillBorderedButton(
            fillColor: AppColors.mainPurple,
            borderColor: AppColors.mainPurpleDark,
            child: Text(
              'Start',
              style: AppTextStyles.bold(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            width: double.infinity,
            sizeRatio: sizeRatio,
            onTap: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280 * sizeRatio.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/quiz_img.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              SizedBox(height: 20 * sizeRatio.height),
              Text(
                'Re-Train your Brain AOT',
                style: AppTextStyles.bold(
                  fontSize: 24,
                  color: AppColors.mainBlack,
                ),
              ),
              SizedBox(height: 10 * sizeRatio.height),
              Divider(
                color: AppColors.mainDisableLight.withOpacity(0.3),
                height: 20,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '10\n',
                          style: AppTextStyles.bold(
                            fontSize: 18,
                            color: AppColors.mainBlack,
                          ),
                        ),
                        TextSpan(
                          text: 'Questions',
                          style: AppTextStyles.semiBold(
                            fontSize: 16,
                            color: AppColors.mainSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.mainDisableLight.withOpacity(0.3),
                    width: 1,
                    height: 70 * sizeRatio.height,
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '2.6K\n',
                          style: AppTextStyles.bold(
                            fontSize: 18,
                            color: AppColors.mainBlack,
                          ),
                        ),
                        TextSpan(
                          text: 'Played',
                          style: AppTextStyles.semiBold(
                            fontSize: 16,
                            color: AppColors.mainSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.mainDisableLight.withOpacity(0.3),
                    width: 1,
                    height: 70 * sizeRatio.height,
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '1.2K\n',
                          style: AppTextStyles.bold(
                            fontSize: 18,
                            color: AppColors.mainBlack,
                          ),
                        ),
                        TextSpan(
                          text: 'Completed',
                          style: AppTextStyles.semiBold(
                            fontSize: 16,
                            color: AppColors.mainSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.mainDisableLight.withOpacity(0.3),
                    width: 1,
                    height: 70 * sizeRatio.height,
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hard\n',
                          style: AppTextStyles.bold(
                            fontSize: 18,
                            color: AppColors.mainBlack,
                          ),
                        ),
                        TextSpan(
                          text: 'Difficult',
                          style: AppTextStyles.semiBold(
                            fontSize: 16,
                            color: AppColors.mainSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.mainDisableLight.withOpacity(0.3),
                height: 20,
                thickness: 1,
              ),
              SizedBox(height: 10 * sizeRatio.height),
              Text(
                'Leaders',
                style: AppTextStyles.bold(
                  fontSize: 18,
                  color: AppColors.mainBlack,
                ),
              ),
              SizedBox(height: 10 * sizeRatio.height),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 38,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/images/avatar_img.jpg'),
                              ),
                            ),
                            SizedBox(height: 5 * sizeRatio.height),
                            Text(
                              'Pepranarolan',
                              style: AppTextStyles.bold(
                                fontSize: 15,
                                color: AppColors.mainBlack,
                              ),
                            ),
                            Text(
                              '13m 50s',
                              style: AppTextStyles.bold(
                                fontSize: 15,
                                color: AppColors.mainSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 78 * sizeRatio.height,
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 10,
                            child: Text(
                              '1',
                              style: AppTextStyles.bold(
                                fontSize: 14,
                                color: AppColors.mainBlack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 38,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/images/avatar_img.jpg'),
                              ),
                            ),
                            SizedBox(height: 5 * sizeRatio.height),
                            Text(
                              'Herinanwauch',
                              style: AppTextStyles.bold(
                                fontSize: 15,
                                color: AppColors.mainBlack,
                              ),
                            ),
                            Text(
                              '13m 50s',
                              style: AppTextStyles.bold(
                                fontSize: 15,
                                color: AppColors.mainSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 78 * sizeRatio.height,
                          child: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 10,
                            child: Text(
                              '2',
                              style: AppTextStyles.bold(
                                fontSize: 14,
                                color: AppColors.mainBlack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown,
                              radius: 38,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/images/avatar_img.jpg'),
                              ),
                            ),
                            SizedBox(height: 5 * sizeRatio.height),
                            Text(
                              'Antonio24123',
                              style: AppTextStyles.bold(
                                fontSize: 15,
                                color: AppColors.mainBlack,
                              ),
                            ),
                            Text(
                              '13m 50s',
                              style: AppTextStyles.bold(
                                fontSize: 15,
                                color: AppColors.mainSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 78 * sizeRatio.height,
                          child: CircleAvatar(
                            backgroundColor: Colors.brown,
                            radius: 10,
                            child: Text(
                              '3',
                              style: AppTextStyles.bold(
                                fontSize: 14,
                                color: AppColors.mainBlack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

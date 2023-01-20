part of '../signup_page.dart';

class _SignUpPageRememberMeWidgest extends StatelessWidget {
  const _SignUpPageRememberMeWidgest({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<SignUpPageCubit, SignUpPageState>(
          buildWhen: (previous, current) =>
              previous.rememberMe != current.rememberMe,
          builder: (context, state) {
            return SizedBox(
              width: 24 * _sizeRatio.width,
              height: 24 * _sizeRatio.width,
              child: Checkbox(
                value: state.rememberMe,
                onChanged: (_) =>
                    context.read<SignUpPageCubit>().onTapRememberme(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                fillColor:
                    MaterialStateProperty.all<Color>(AppColors.mainPurple),
              ),
            );
          },
        ),
        SizedBox(width: 10 * _sizeRatio.width),
        Text(
          'Remember me',
          style: AppTextStyles.medium(
            fontSize: 15,
            color: AppColors.mainBlack,
          ),
        ),
      ],
    );
  }
}

part of '../signup_page.dart';

class _SignUpPageRegistrationFormWidget extends StatelessWidget {
  const _SignUpPageRegistrationFormWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 120 * _sizeRatio.height),
        children: [
          Text(
            'Username',
            style: AppTextStyles.semiBold(
              fontSize: 15,
              color: AppColors.mainBlack,
            ),
          ),
          _SignUpPageUsernameInputWidgest(),
          SizedBox(height: 25 * _sizeRatio.height),
          Text(
            'Email',
            style: AppTextStyles.semiBold(
              fontSize: 15,
              color: AppColors.mainBlack,
            ),
          ),
          _SignUpPageEmailInputWidgest(),
          SizedBox(height: 25 * _sizeRatio.height),
          Text(
            'Password',
            style: AppTextStyles.semiBold(
              fontSize: 15,
              color: AppColors.mainBlack,
            ),
          ),
          _SignUpPagePasswordInputWidgest(),
          SizedBox(height: 25 * _sizeRatio.height),
          _SignUpPageRememberMeWidgest(sizeRatio: _sizeRatio),
          SizedBox(height: 40 * _sizeRatio.height),
          _SignUpPageDividerWidgest(sizeRatio: _sizeRatio),
          SizedBox(height: 25 * _sizeRatio.height),
          AppButtons.fillBorderedButton(
            fillColor: AppColors.mainButtonWhiteLight,
            borderColor: AppColors.mainDisableDark,
            text: Text(
              'Continue with Google',
              style: AppTextStyles.semiBold(
                fontSize: 15,
                color: AppColors.mainBlack,
              ),
            ),
            width: double.infinity,
            sizeRatio: _sizeRatio,
            onTap: () {},
          ),
          SizedBox(height: 25 * _sizeRatio.height),
          AppButtons.fillBorderedButton(
            fillColor: AppColors.mainButtonWhiteLight,
            borderColor: AppColors.mainDisableDark,
            text: Text(
              'Continue with Apple',
              style: AppTextStyles.semiBold(
                fontSize: 15,
                color: AppColors.mainBlack,
              ),
            ),
            width: double.infinity,
            sizeRatio: _sizeRatio,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SignUpPageDividerWidgest extends StatelessWidget {
  const _SignUpPageDividerWidgest({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(right: 10 * _sizeRatio.width),
            color: AppColors.mainDisableLight.withOpacity(0.3),
          ),
        ),
        Text(
          'or',
          style: AppTextStyles.medium(
            fontSize: 15,
            color: AppColors.mainSecondaryLight,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(left: 10 * _sizeRatio.width),
            color: AppColors.mainDisableLight.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}

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
        SizedBox(
          width: 24 * _sizeRatio.width,
          height: 24 * _sizeRatio.width,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            fillColor: MaterialStateProperty.all<Color>(AppColors.mainPurple),
          ),
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

class _SignUpPageUsernameInputWidgest extends StatelessWidget {
  const _SignUpPageUsernameInputWidgest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.bold(
        fontSize: 18,
        color: AppColors.mainBlack,
      ),
      cursorColor: AppColors.mainBlack,
      cursorRadius: const Radius.circular(100),
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainBlack,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainPurple,
          ),
        ),
      ),
    );
  }
}

class _SignUpPageEmailInputWidgest extends StatelessWidget {
  const _SignUpPageEmailInputWidgest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.bold(
        fontSize: 18,
        color: AppColors.mainBlack,
      ),
      cursorColor: AppColors.mainBlack,
      cursorRadius: const Radius.circular(100),
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainBlack,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainPurple,
          ),
        ),
      ),
    );
  }
}

class _SignUpPagePasswordInputWidgest extends StatelessWidget {
  const _SignUpPagePasswordInputWidgest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.bold(
        fontSize: 18,
        color: AppColors.mainBlack,
      ),
      cursorColor: AppColors.mainBlack,
      cursorRadius: const Radius.circular(100),
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainBlack,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainPurple,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.visibility_outlined,
            color: AppColors.mainPurple,
          ),
        ),
      ),
    );
  }
}

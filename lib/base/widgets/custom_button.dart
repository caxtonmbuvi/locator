
import '../../exports.dart';


class CustomButton extends StatelessWidget {
  final double? height1 ;
  final double? width1 ;
  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  CustomButton({Key? key, required this.text, this.onTap, this.color, this.textColor, this.height1, this.width1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height1??60.h,
      width: width1??ScreenUtil().screenWidth,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color ?? ColorName.primaryColor),
          elevation: MaterialStateProperty.all(0.0),

          // minimumSize: MaterialStateProperty.all(const Size(200, 50)),
        ),
        child: AppText.medium(text, color: textColor,),
      ),
    );
  }
}

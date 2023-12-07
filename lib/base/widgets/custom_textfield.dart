
import '../../exports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final VoidCallback? onTap;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? color;
  final double borderRadius;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.onTap,
      this.color,
      this.suffix, this.borderRadius = 20, this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: AppText.small(
            label,
            color: ColorName.darkGrey,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            // borderSide: BorderSide.none
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            // borderSide: BorderSide.none
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          suffix: suffix,
          suffixIcon: suffixIcon,
          // GestureDetector(
          //   onTap: onTap,
          //   child: Container(
          //       padding: EdgeInsets.only(right: 10),
          //       child: AppText.large(
          //         "Apply",
          //         color: ColorName.darkGrey,
          //       )),
          // )
          ),
      style: TextStyle(fontWeight: FontWeight.bold, color: color),
    );
  }
}

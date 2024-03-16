import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/colors.dart';

class CreateGradientButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  final double width;
  final bool isRounded;

  const CreateGradientButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.width,
      this.isRounded = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.blueGrey],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(isRounded ? 25 : 10),
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: width, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CreateMaterialButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  final double? width;
  final Widget? child;

  const CreateMaterialButton({
    super.key,
    this.text = '',
    required this.onTap,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppColors.primaryColor, width: 2)),
      minWidth: width,
      //height: getHeight(context) * .05,
      child: child ??
          Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          ),
    );
  }
}

class CreateCustomButton extends StatelessWidget {
  final String text;
  final Color textColor, buttonColor;
  final GestureTapCallback onTap;
  final double? width, height;
  final bool round;
  final Widget? child;

  const CreateCustomButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.buttonColor = const Color(0xffFFB100),
    required this.onTap,
    this.round = true,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(round ? 40 : 10),
      ),
      minWidth: width,
      height: height,
      color: buttonColor,
      textColor: textColor,
      elevation: 0,
      child: child ?? Text(text, textAlign: TextAlign.center),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String image;
  final GestureTapCallback onTap;

  const RoundButton({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 77.sp,
        width: 77.sp,
        decoration: const ShapeDecoration(
          shape: CircleBorder(
              side: BorderSide(color: Color(0xffD5DEE7), width: 2)),
        ),
        child: Center(
            child: Image.asset(
          'assets/images/$image.png',
          height: 36.sp,
          width: 36.sp,
        )),
      ),
    );
  }
}

/*class CreateSearchButton extends StatelessWidget {
  const CreateSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: getWidth(context) * .05,
              right: getWidth(context) * .01
          ),
          height: getHeight(context) * .068,
          width: getWidth(context) * .72,
          child: Card(
            child: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const SearchPage()));
                },
                child:  Row(
                  children: const [
                    Icon(Icons.search, color: grey),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Type here for search..',
                        style: TextStyle(fontWeight: FontWeight.w500, color: grey),
                      ),
                    )
                  ],
                )),
          ),
        ),
        SizedBox(
          height: getHeight(context) * .068,
          width: getWidth(context) * .15,
          child: Card(
            child: TextButton(
                onPressed: () {
                  //bottomSheetFilter(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const SearchPage()));
                },
                child: SvgPicture.asset(
                    'assets/home/filter.svg')),
          ),
        )
      ],
    );
  }
}*/

class CustomButton extends StatelessWidget {
  final String? text;
  final Color textColor, buttonColor;
  final GestureTapCallback onTap;
  final double? width, height;
  final double? round;
  final Widget? child;

  const CustomButton({
    super.key,
    this.text,
    this.textColor = Colors.white,
    this.buttonColor = const Color(0xffFFB100),
    required this.onTap,
    this.round,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(round!),
      ),
      minWidth: width,
      height: height,
      color: buttonColor,
      textColor: textColor,
      elevation: 0,
      child: child ?? Text(text!, textAlign: TextAlign.center),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/widgets/custom_text.dart';

class CheckBoxTitle extends StatefulWidget {
  final String title;
  final Widget? icon;
  final TextStyle? textStyle;
  final bool isSelected;
  final bool isShownOnly;
  final bool setState;
  final void Function()? onTap;

  const CheckBoxTitle(
      {super.key,
      this.setState = true,
      this.isShownOnly = false,
      this.textStyle,
      this.onTap,
      this.isSelected = false,
      required this.title,
      this.icon});

  @override
  State<CheckBoxTitle> createState() => _CheckBoxTitleState();
}

class _CheckBoxTitleState extends State<CheckBoxTitle> {
  bool isSelected = false;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      onTap: () {
        if (!widget.isShownOnly) {
          if (widget.setState) {
            setState(() {
              isSelected = !isSelected;
            });
            widget.onTap?.call();
          } else {
            widget.onTap?.call();
          }
          widget.onTap;
        } else {
          widget.onTap;
        }
      },
      child: SizedBox(
        height: 40.h,
        child: Row(
          children: [
            AnimatedCheckbox(
                value: isSelected,
                onChanged: (va) {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  widget.onTap?.call();
                }),
            SizedBox(
              width: 5.w,
            ),
            DisplayText(
              textContent: widget.title,
              textStyle: widget.textStyle ?? AppTextStyle().montserratFont,
            )
          ],
        ),
      ),
    );
  }
}

class AnimatedCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const AnimatedCheckbox({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  AnimatedCheckboxState createState() => AnimatedCheckboxState();
}

class AnimatedCheckboxState extends State<AnimatedCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    if (widget.value) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return InkWell(
          onTap: () {
            widget.onChanged?.call(!widget.value);
          },
          child: Container(
            width: 17.w,
            height: 17.w,
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      widget.value ? Colors.transparent : AppColors.bgGrey_300),
              borderRadius: BorderRadius.circular(2.0),
              color: AppColors.primaryColor.withOpacity(_animation.value),
            ),
            child: widget.value
                ? Icon(
                    Icons.check,
                    size: 14.sp,
                    weight: 22,
                    color: AppColors.bgGrey_900,
                  )
                : null,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

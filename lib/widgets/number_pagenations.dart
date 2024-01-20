library number_pagination;

import 'package:flutter/material.dart';
import 'package:test_app/core/constant.dart';

class NumberPagination extends StatefulWidget {
  /// Creates a NumberPagination widget.
  const NumberPagination({
    super.key,
    required this.onPageChanged,
    required this.pageTotal,
    this.threshold = 10,
    this.pageInit = 1,
    this.colorPrimary = Colors.black,
    this.colorSub = Colors.white,
    this.controlButton,
    this.iconToFirst,
    this.iconPrevious,
    this.borderColor,
    this.iconNext,
    this.iconToLast,
    this.fontSize = 15,
    this.fontFamily,
  });

  ///Trigger when page changed
  final Function(int) onPageChanged;

  ///End of numbers.
  final int pageTotal;

  ///Page number to be displayed first
  final int pageInit;

  ///Numbers to show at once.
  final int threshold;

  ///Color of numbers.
  final Color colorPrimary;

  ///Color of background.
  final Color colorSub;

  ///to First, to Previous, to next, to Last Button UI.
  final Widget? controlButton;
  final Color? borderColor;

  ///The icon of button to first.
  final Widget? iconToFirst;

  ///The icon of button to previous.
  final Widget? iconPrevious;

  ///The icon of button to next.
  final Widget? iconNext;

  ///The icon of button to last.
  final Widget? iconToLast;

  ///The size of numbers.
  final double fontSize;

  ///The fontFamily of numbers.
  final String? fontFamily;

  @override
  NumberPaginationState createState() => NumberPaginationState();
}

class NumberPaginationState extends State<NumberPagination> {
  late int rangeStart;
  late int rangeEnd;
  late int currentPage;
  late final Widget iconToFirst;
  late final Widget iconPrevious;
  late final Widget iconNext;
  late final Widget iconToLast;

  @override
  void initState() {
    currentPage = widget.pageInit;
    iconToFirst = widget.iconToFirst ?? const Icon(Icons.first_page);
    iconPrevious = widget.iconPrevious ?? const Icon(Icons.keyboard_arrow_left);
    iconNext = widget.iconNext ?? const Icon(Icons.keyboard_arrow_right);
    iconToLast = widget.iconToLast ?? const Icon(Icons.last_page);

    _rangeSet();

    super.initState();
  }

  Widget _defaultControlButton(Widget icon) {
    return AbsorbPointer(
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Adjust the radius as needed
              side: BorderSide(
                  color: widget.borderColor ??
                      Colors.transparent), // Adjust the color as needed
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(const Size(32, 32)),
          foregroundColor: MaterialStateProperty.all(widget.colorPrimary),
          backgroundColor: MaterialStateProperty.all(AppColors.bgGrey_900),
        ),
        onPressed: () {},
        child: icon,
      ),
    );
  }

  void _changePage(int page) {
    if (page <= 0) page = 1;

    if (page > widget.pageTotal) page = widget.pageTotal;

    setState(() {
      currentPage = page;
      _rangeSet();
      widget.onPageChanged(currentPage);
    });
  }

  void _rangeSet() {
    rangeStart = currentPage % widget.threshold == 0
        ? currentPage - widget.threshold
        : (currentPage ~/ widget.threshold) * widget.threshold;

    rangeEnd = rangeStart + widget.threshold;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => _changePage(0),
          child: Stack(
            children: [
              if (widget.controlButton != null) ...[
                widget.controlButton!,
                iconToFirst
              ] else
                _defaultControlButton(iconToFirst),
            ],
          ),
        ),
        InkWell(
          onTap: () => _changePage(--currentPage),
          child: Stack(
            children: [
              if (widget.controlButton != null) ...[
                widget.controlButton!,
                iconPrevious
              ] else
                _defaultControlButton(iconPrevious),
            ],
          ),
        ),
        ...List.generate(
          rangeEnd <= widget.pageTotal
              ? widget.threshold
              : widget.pageTotal % widget.threshold,
          (index) => Flexible(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _changePage(index + 1 + rangeStart),
              child: Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: (currentPage - 1) % widget.threshold == index
                      ? AppColors.primaryColor
                      : AppColors.bgGrey_900,
                  border: Border.all(
                      width: 2,
                      color: (currentPage - 1) % widget.threshold == index
                          ? AppColors.primaryColor
                          : widget.borderColor ?? Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    '${index + 1 + rangeStart}',
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w500,
                      fontFamily: widget.fontFamily,
                      color: (currentPage - 1) % widget.threshold == index
                          ? AppColors.bgGrey_900
                          : widget.colorPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => _changePage(++currentPage),
          child: Stack(
            children: [
              if (widget.controlButton != null) ...[
                widget.controlButton!,
                iconNext
              ] else
                _defaultControlButton(iconNext),
            ],
          ),
        ),
        InkWell(
          onTap: () => _changePage(widget.pageTotal),
          child: Stack(
            children: [
              if (widget.controlButton != null) ...[
                widget.controlButton!,
                iconToLast
              ] else
                _defaultControlButton(iconToLast),
            ],
          ),
        ),
      ],
    );
  }
}

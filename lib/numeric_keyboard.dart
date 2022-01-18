import 'package:flutter/material.dart';

import 'bouncing_button.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatelessWidget {
  const NumericKeyboard(
      {Key? key,
        required this.onKeyboardTap,
        this.onLeftActionKeyPressed,
        this.onRightActionKeyPressed,
        this.leftActionKeyChild,
        this.rightActionKeyChild})
      : assert((leftActionKeyChild != null && onLeftActionKeyPressed != null) ||
      (rightActionKeyChild != null && onRightActionKeyPressed != null)),
        super(key: key);
  final KeyboardTapCallback onKeyboardTap;
  final Function? onLeftActionKeyPressed;
  final Function? onRightActionKeyPressed;
  final Widget? leftActionKeyChild;
  final Widget? rightActionKeyChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _numKey("1"),
              _numKey("2"),
              _numKey("3"),
            ],
          ),
          Row(
            children: [
              _numKey("4"),
              _numKey("5"),
              _numKey("6"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _numKey("7"),
              _numKey("8"),
              _numKey("9"),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: leftActionKeyChild != null
                    ? BouncingButton(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 20.0),
                      child: Center(child: leftActionKeyChild!),
                    ),
                  ),
                  onTap: ()=>onLeftActionKeyPressed!(),
                )
                    : const SizedBox.shrink(),
              ),
              _numKey("0"),
              Expanded(
                child: rightActionKeyChild != null
                    ? BouncingButton(
                  child: rightActionKeyChild!,
                  onTap: () => onRightActionKeyPressed!(),
                )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numKey(String value) {
    return Expanded(
        child: BouncingButton(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 20.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                ),
              ),
            ),
          ),
          onTap: () => onKeyboardTap(value),
        ));
  }
}

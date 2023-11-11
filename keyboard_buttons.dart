import 'constants.dart';
import 'package:flutter/material.dart';

typedef void CallbackButtonTap({String buttonText});

class KeyboardButtons extends StatelessWidget {
  KeyboardButtons({required this.buttons, required this.onTap});

  final String buttons;
  final CallbackButtonTap onTap;

  bool get _isSpecialButton {
    return [
      DEL_SIGN, DECIMAL_POINT_SIGN, CLEAR_ALL_SIGN, MODULAR_SIGN, PLUS_SIGN,
      MINUS_SIGN, MULTIPLICATION_SIGN, DIVISION_SIGN, EXCHANGE_CALCULATOR,
      PI, SQUARE_ROOT_SIGN, POWER_SIGN, LN_SIGN, LG_SIGN, SIN_SIGN, COS_SIGN,
      TAN_SIGN, RAD_SIGN, DEG_SIGN, EQUAL_SIGN, ARCSIN_SIGN, ARCCOS_SIGN,
      ARCTAN_SIGN, LN2_SIGN, E_NUM, LEFT_QUOTE_SIGN, RIGHT_QUOTE_SIGN
    ].contains(buttons);
  }

  bool get _isFontSizeIncreased {
    return [
      LN_SIGN, LG_SIGN, SIN_SIGN, COS_SIGN, TAN_SIGN, RAD_SIGN, DEG_SIGN,
      ARCSIN_SIGN, ARCCOS_SIGN, ARCTAN_SIGN, LN2_SIGN, LEFT_QUOTE_SIGN,
      RIGHT_QUOTE_SIGN
    ].contains(buttons);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).primaryColor;
                }
                return Color(0xFFFFFFFF);
              },
            ),
          ),
          onPressed: () => onTap(buttonText: buttons),
          child: Text(
            buttons,
            style: TextStyle(
              color: _isSpecialButton
                  ? Color(0xFF000000)
                  : (buttons == EQUAL_SIGN)
                  ? Theme.of(context).textTheme.button?.color
                  : Color(0xFF000000),
              fontSize: _isFontSizeIncreased ? 18 : 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

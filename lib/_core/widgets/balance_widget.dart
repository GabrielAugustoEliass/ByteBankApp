// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bytebank/_core/constants/bytebank_colors.dart';

class BalanceWidget extends StatefulWidget {
  final Color color;
  const BalanceWidget({super.key, required this.color});

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  bool isVisible = false;

  void validarIsVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Saldo",
              style: TextStyle(
                fontSize: 19,
                color: widget.color,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {
                _showPinCodeDialog(context);
                setState(() {
                  validarIsVisible();
                });
              },
              icon: isVisible
                  ? Icon(
                      Icons.visibility,
                      color: widget.color,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: widget.color,
                    ),
            ),
          ],
        ),
        Divider(color: widget.color, thickness: 2),
        SizedBox(height: 10),
        Text(
          "Conta Corrente",
          style: TextStyle(
            color: widget.color,
            fontSize: 16,
          ),
        ),
        Row(
          children: [
            Text(
              'R\$',
              style: TextStyle(
                fontSize: 20,
                color: widget.color,
              ),
            ),
            SizedBox(width: 10),
            Text(
              isVisible ? "2.500,00" : '****',
              style: TextStyle(
                fontSize: 20,
                color: widget.color,
              ),
            ),
          ],
        )
      ],
    );
  }

  void _showPinCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Digite o PIN de 4 digitos no seu aplicativo',
            style: TextStyle(fontSize: 20),
          ),
          content: TextFormField(
            maxLength: 4,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: BytebankColors.green),
                onPressed: () {},
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

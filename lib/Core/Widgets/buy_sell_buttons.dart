import 'package:flutter/material.dart';
import 'package:fonify/Core/Theme/app_color.dart';

class BuySellButtons extends StatelessWidget {
  const BuySellButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        // Independent Buy Button
        IndependentButton(
          label: "Buy Now",
          normalColor: Color.fromARGB(255, 134, 32, 32),
          hoverColor: AppColors.buyHover,
          selectedColor: Color.fromARGB(255, 0, 143, 48),
          textColor: AppColors.textAccent,
        ),
        SizedBox(width: 20),
        // Independent Sell Button
        IndependentButton(
          label: "Sell",
          normalColor: Color.fromARGB(255, 175, 19, 110),
          hoverColor: AppColors.sellHover,
          selectedColor: Color.fromARGB(255, 156, 115, 2),
          textColor: AppColors.textAccent,
        ),
      ],
    );
  }
}

class IndependentButton extends StatefulWidget {
  final String label;
  final Color normalColor;
  final Color hoverColor;
  final Color selectedColor;
  final Color textColor;

  const IndependentButton({
    super.key,
    required this.label,
    required this.normalColor,
    required this.hoverColor,
    required this.selectedColor,
    required this.textColor,
  });

  @override
  State<IndependentButton> createState() => _IndependentButtonState();
}

class _IndependentButtonState extends State<IndependentButton> {
  bool isSelected = false;
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    Color currentColor = isSelected
        ? widget.selectedColor
        : (isHovering ? widget.hoverColor : widget.normalColor);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: () => setState(() => isSelected = !isSelected),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, ),
          decoration: BoxDecoration(
            color: currentColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

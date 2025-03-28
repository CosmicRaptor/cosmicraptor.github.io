import 'package:flutter/material.dart';
import 'package:website/misc/get_route.dart';
import 'package:website/misc/open_url.dart';

class SocialsButtons extends StatefulWidget {
  final String buttonText;
  const SocialsButtons({super.key, required this.buttonText});

  @override
  State<SocialsButtons> createState() => _SocialsButtonsState();
}

class _SocialsButtonsState extends State<SocialsButtons> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenwidth = constraints.maxWidth;
        // final double screenheight = constraints.maxHeight;
        bool isMobile = screenwidth < 600;

        return SizedBox(
          width: isMobile ? screenwidth * 0.8 : screenwidth * 0.2,
          child: InkWell(
            onTap: () {
              openUrl(widget.buttonText);
            },
            onHover: (hover) {
              setState(() {
                isHovering = hover;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              padding: EdgeInsets.all(isHovering ? 30 : 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isHovering
                      ? const Color.fromRGBO(0, 255, 0, 1.0)
                      : Colors.black,
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  getButton(widget.buttonText),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Jetbrains-Mono',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

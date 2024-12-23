import 'package:era_ai/controller/textediting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/ai.dart';
import '../theme/color.dart';

class TextBoxBottom extends StatefulWidget {
  const TextBoxBottom({
    super.key,
  });

  @override
  State<TextBoxBottom> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBoxBottom> {
  ValueNotifier<bool> focus = ValueNotifier(false);
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(
      () {
        focus.value = focusNode.hasFocus;
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              style: GoogleFonts.dmSans(
                color: textColor,
                fontSize: 13,
              ),
              cursorColor: defaultColor,
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Bir mesaj yazın...",
                hintStyle: GoogleFonts.dmSans(
                  color: textColor.withOpacity(0.5),
                  fontSize: 13,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1020),
                    borderSide: BorderSide(
                      color: textColor,
                      width: 2,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1020),
                    borderSide: BorderSide(
                      color: defaultColor.withOpacity(0.4),
                      width: 2,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1020),
                    borderSide: BorderSide(
                      color: defaultColor,
                      width: 2,
                    )),
              ),
              onSubmitted: (a) async {
                await Ai.sendMessage();
              },
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () async {
              await Ai.sendMessage();
            },
            child: ValueListenableBuilder(
              valueListenable: focus,
              builder: (
                BuildContext context,
                dynamic value,
                Widget? child,
              ) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: value == false
                            ? defaultColor.withOpacity(0.4)
                            : defaultColor,
                      ),
                      shape: BoxShape.circle),
                  width: 51,
                  height: 51,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Icon(
                      Icons.send_rounded,
                      color: value == false
                          ? defaultColor.withOpacity(0.4)
                          : defaultColor,
                      size: 22,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

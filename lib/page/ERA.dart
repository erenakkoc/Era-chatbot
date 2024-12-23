import 'package:cosmos/cosmos.dart';
import 'package:era_ai/controller/value.dart';
import 'package:era_ai/theme/color.dart';
import 'package:era_ai/widget/textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/scrollcontroller.dart';
import '../widget/messagebox.dart';

class ERA extends StatelessWidget {
  const ERA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 36,
                ),
                ValueListenableBuilder(
                  valueListenable: messageList,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        //physics: const BouncingScrollPhysics()
                        child: Column(
                          children: value,
                        ),
                      ),
                    );
                  },
                ),
                const TextBoxBottom(),
                Text(
                  "Era, hata yapabilir",
                  style: GoogleFonts.dmSans(
                    color: textColor.withOpacity(0.5),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
            const SizedBox(height: 2),
            Container(
              width: width(context),
              decoration: BoxDecoration(
                color: navColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: bg,
                    blurRadius: 20,
                    offset: Offset(5, 5),
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Era",
                    style: GoogleFonts.dmSans(
                      color: defaultColor.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

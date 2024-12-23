import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color.dart';

class MessageBox extends StatelessWidget {
  final bool isera;
  final String message;
  final String timestamp;

  const MessageBox({
    super.key,
    required this.isera, required this.message, required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return isera ? era(context) : ben(context);
  }

  Row era(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(8),
          width: width(context) * 0.6,
          decoration: BoxDecoration(
            color: navColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Era",
                style: GoogleFonts.dmSans(
                  color: defaultColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                message,
                style: GoogleFonts.dmSans(
                  color: textColor,
                  fontSize: 13,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    timestamp,
                    style: GoogleFonts.dmSans(
                      color: textColor.withOpacity(0.6),
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Row ben(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(8),
          width: width(context) * 0.6,
          decoration: BoxDecoration(
            color: navColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Siz",
                style: GoogleFonts.dmSans(
                  color: defaultColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                message,
                style: GoogleFonts.dmSans(
                  color: textColor,
                  fontSize: 13,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "10.00",
                    style: GoogleFonts.dmSans(
                      color: textColor.withOpacity(0.6),
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}

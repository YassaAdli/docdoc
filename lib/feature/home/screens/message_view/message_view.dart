import 'package:Docdoc/feature/home/screens/message_view/widget/message_view_body.dart';
import 'package:flutter/material.dart';
class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: MessageViewBody(),
        ),
      ),
    );
  }
}

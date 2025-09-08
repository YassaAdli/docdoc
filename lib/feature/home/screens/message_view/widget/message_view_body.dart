import 'package:Docdoc/feature/home/screens/message_view/widget/custom_message_app_bar.dart';
import 'package:Docdoc/feature/home/screens/message_view/widget/custom_message_card.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/custom_recommend_search.dart';
import 'package:flutter/material.dart';
class MessageViewBody extends StatelessWidget {
  const MessageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomMessageAppBar(),
        const SizedBox(height: 12),
        const CustomRecommendSearch(),
        const SizedBox(height: 16),
        Expanded(child: ListView.builder(itemCount: 5,  itemBuilder: (BuildContext context, int index) {  return const CustomMessageCard();},)),


      ],
    );
  }
}

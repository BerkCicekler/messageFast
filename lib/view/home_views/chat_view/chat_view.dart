import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messagefast/view/home_views/chat_view/chat_view_operation.dart';
import 'package:messagefast/widgets/text_field/text_field.dart';

@RoutePage()
class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.id });
  final String? id;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> with ChatViewOperation {




  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }



  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: const Column(children: [
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),_MessageItem(),_MessageItem(),_MessageItem(),_MessageItem(),_MessageItem(),_MessageItem(),
          
              ]),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: MyTextField(),
          )
        ],
      ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  const _MessageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: const Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ChatBubble(message: "mesaj mesaj"),
          ],
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String message;
  const _ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Text(message, style: const TextStyle(fontSize: 16),),
    );
  }
}

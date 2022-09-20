import 'package:chat_app_ui/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/chat_model.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late String text;
  late User user;
  late Chat chat;
  @override
  void initState() {
    user = Get.arguments[0];
    chat = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary
      ], begin: Alignment.topLeft, end: Alignment.topRight)),
      child: Scaffold(
        appBar: _CustomAppBar(user: user),
        body: CustomContainer(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                _ChatMessages(chat: chat,scrollController: scrollController),
                TextFormField(
                  controller: textEditingController,
                  onChanged: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.secondary.withAlpha(150),
                    hintText: 'Type here...',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Message message = Message(
                            senderId: '1',
                            recipientId: user.id,
                            text: text,
                            createdAt: DateTime.now());

                            List<Message> messages = List.from(chat.messages!)..add(message);
                            messages.sort((a,b) => b.createdAt.compareTo(a.createdAt));
                            setState(() {
                              chat = chat.copyWith(messages: messages);
                            });
                            scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                            textEditingController.clear();
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _ChatMessages extends StatelessWidget {
  const _ChatMessages({
    Key? key,
    required this.chat,
    required this.scrollController,
  }) : super(key: key);

  final Chat chat;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        controller: scrollController,
        shrinkWrap: true,
        itemCount: chat.messages!.length,
        itemBuilder: (context, index) {
          Message message = chat.messages![index];
          return Align(
            alignment: (message.senderId == '1')
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .66,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (message.senderId == '1')
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary),
              child: Text(message.text),
            ),
          );
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
            ))
      ],
      title: Column(
        children: [
          Text(
            '${user.name} ${user.surname}',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Online",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

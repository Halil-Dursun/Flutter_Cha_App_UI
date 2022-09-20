import 'package:chat_app_ui/models/chat_model.dart';
import 'package:chat_app_ui/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../widgets/custom_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<User> users = User.users;
    List<Chat> chats = Chat.chats;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
      ], begin: Alignment.topLeft, end: Alignment.topRight)),
      child: Scaffold(
        appBar: const _CustomAppBar(),
        body: Column(
          children: [
            _ChatContacts(height: height, users: users),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _ChatMessages(height: height, chats: chats),
                  _CustomBottomNavBar(width: width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        width: width * 0.5,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withAlpha(150),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message_rounded),
              ),
            ),
            const SizedBox(width: 20,),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_add_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessages extends StatelessWidget {
  const _ChatMessages({
    Key? key,
    required this.height,
    required this.chats,
  }) : super(key: key);

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: height,
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            //Get the other user profile
            User user =
                chats[index].users!.where((user) => user.id != '1').first;

            //sort the messages based on the creation time
            chats[index]
                .messages!
                .sort((a, b) => b.createdAt.compareTo(a.createdAt));

            //Get the last message for the chat prewiew
            Message lastMessage = chats[index].messages!.first;
            return ListTile(
              onTap: () {
                Get.toNamed('/chat', arguments: [
                  user,
                  chats[index],
                ]);
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.imageUrl),
              ),
              title: Text(
                '${user.name} + ${user.surname}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                lastMessage.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: Text(
                  '${lastMessage.createdAt.hour}:${lastMessage.createdAt.minute}'),
            );
          },
        ));
  }
}

class _ChatContacts extends StatelessWidget {
  const _ChatContacts({
    Key? key,
    required this.height,
    required this.users,
  }) : super(key: key);

  final double height;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      height: height * 0.150,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];
          return Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    user.imageUrl,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  user.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            print(Get.isDarkMode);
          },
          icon: Icon(
            Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
          ),
        ),
      ],
      title: Text(
        "Chats",
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

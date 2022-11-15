import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclone/common/widgets/loader.dart';
import 'package:whatsappclone/features/auth/controller/auth_controller.dart';
import 'package:whatsappclone/features/chats/widgets/bottom_chat_field.dart';
import 'package:whatsappclone/models/user_model.dart';

import '../../../colors.dart';
import '../../../info.dart';
import '../widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  final String name;
  final String uid;
  static const routeName = '/mobile-chat-screen';
  const MobileChatScreen({Key? key, required this.name, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loader();
              }

              return Column(
                children: [
                  Text(name),
                  Text('online'),
                  // Text(snapshot.data!.isOnline ? 'online' : 'offline',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 13,
                  //     ))
                ],
              );
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(
              recieverUserId: uid,
            ),
          ),
          BottomChatScreen(
            uid,
          ),
        ],
      ),
    );
  }
}

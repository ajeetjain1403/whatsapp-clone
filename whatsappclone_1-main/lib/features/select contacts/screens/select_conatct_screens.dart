import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclone/common/error.dart';
import 'package:whatsappclone/common/widgets/loader.dart';
import 'package:whatsappclone/features/select%20contacts/controller/select_conatct_contoller.dart';

class SelectContactScreen extends ConsumerWidget {
  static const String routeName = '/select-conatct';
  const SelectContactScreen({Key? key}) : super(key: key);
  void selectContact(
      WidgetRef ref, Contact selectContact, BuildContext context) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select conatcts'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: ref.watch(getContactsProvider).when(
            data: (contactList) => ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  final contact = contactList[index];
                  return InkWell(
                    onTap: () => selectContact(ref, contact, context),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(
                          contact.displayName,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        leading: contact.photo == null
                            ? null
                            : CircleAvatar(
                                backgroundImage: MemoryImage(contact.photo!),
                                radius: 30,
                              ),
                      ),
                    ),
                  );
                }),
            error: (err, trace) => ErorrScreen(error: err.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}

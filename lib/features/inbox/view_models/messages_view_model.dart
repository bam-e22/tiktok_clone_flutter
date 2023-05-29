import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/inbox/models/message_model.dart';
import 'package:tiktok_clone/features/inbox/repos/messages_repo.dart';

class MessagesViewModel extends AsyncNotifier<void> {
  // .family
  late final MessagesRepo _messagesRepo;

  @override
  FutureOr<void> build() {
    _messagesRepo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final message = MessageModel(
            text: text,
            userId: user!.uid,
            createdAt: DateTime.now().millisecondsSinceEpoch);
        _messagesRepo.sendMessage(message);
      },
    );
  }
}

final messagesProvider = AsyncNotifierProvider<MessagesViewModel, void>(
  () => MessagesViewModel(),
);

final chatProvider = StreamProvider.autoDispose<List<MessageModel>>((ref) {
  final db = FirebaseFirestore.instance;
  return db
      .collection("chat_rooms")
      .doc("SAXS5XcKUvVKCHHfyAGC")
      .collection("text")
      .orderBy("createdAt")
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (doc) => MessageModel.fromJson(
                doc.data(),
              ),
            )
            .toList()
            .reversed
            .toList(),
      );
});

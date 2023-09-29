import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messagefast/core/models/providers/user/user_provider.dart';
import 'package:messagefast/core/models/user_model.dart';
import 'package:messagefast/core/services/firebase/firebase_storage_service.dart';
import 'package:messagefast/core/utils/image_picker.dart';
import 'package:messagefast/view/home_views/settings_view/settings_view_operation.dart';

class ProfileHolder extends ConsumerWidget {
  const ProfileHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel user = ref.watch(userProvider);
    return Column(
      children: [
        _ProfilePictureHolder(user: user),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(user.name, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
        ),
        Text(user.userName)
      ],
    );
  }
}

class _ProfilePictureHolder extends ConsumerWidget with SettingsViewOperation {
  final UserModel user;
  const _ProfilePictureHolder({required this.user});

  void _showActionSheet(BuildContext context, WidgetRef ref) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('New Profile Picture'),
        message: const Text(
            'Select the type of how you want to add your profile picture'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
                changeProfilePicture(source: ImageSource.camera, name: user.uId, ref: ref);
                Navigator.pop(context);
            },
            child: Text('Camera',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              changeProfilePicture(source: ImageSource.gallery, name: user.uId, ref: ref);
              Navigator.pop(context);
            },
            child: Text(
              'Galery',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Stack(children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(user.profilePictureURL == ""
              ? "https://firebasestorage.googleapis.com/v0/b/messagefast-d9c7c.appspot.com/o/default_profile_picture.jpg?alt=media&token=8b6bfc09-efd0-4a7a-bb80-3265c76e5395"
              : user.profilePictureURL),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(50)),
                child: const Icon(CupertinoIcons.camera),
              
            ))
      ]),
      onTap: () => _showActionSheet(context, ref),
    );
  }
}

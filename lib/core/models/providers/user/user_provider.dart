import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/models/providers/user/user_notifier.dart';
import 'package:messagefast/core/models/user_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier(UserModel.empty()));
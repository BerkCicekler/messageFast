import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/models/friends_model.dart';
import 'package:messagefast/core/models/providers/friends/friends_notifier.dart';

final friendsProvider = StateNotifierProvider<FriendsNotifier, Friends>((ref) => FriendsNotifier(Friends()));
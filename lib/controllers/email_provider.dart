import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailProvider extends StateNotifier<String> {
  EmailProvider() : super('');

  void add(value) {
    state = value;
  }
}

final emailprovider = StateNotifierProvider<EmailProvider, String>((ref) {
  return EmailProvider();
});

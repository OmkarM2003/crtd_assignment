import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameProvider extends StateNotifier<String> {
  NameProvider() : super('');

  void add(value) {
    state = value;
  }
}

final nameprovider = StateNotifierProvider<NameProvider, String>((ref) {
  return NameProvider();
});



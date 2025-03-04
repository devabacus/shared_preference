
# после обновления пакета
flutter pub cache clean
flutter clean
flutter pub get

flutter pub add http

flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
flutter pub add hooks_riverpod

flutter pub add custom_lint --dev
flutter pub add riverpod_lint --dev


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

dart run build_runner build
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs

# Для добавления зависимостей в основной проект
flutter pub add freezed_annotation
flutter pub add json_annotation

# Для добавления dev-зависимостей
flutter pub add freezed --dev
flutter pub add json_serializable --dev
flutter pub add build_runner --dev
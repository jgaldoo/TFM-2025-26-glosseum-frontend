// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_control_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TextControlNotifier)
final textControlProvider = TextControlNotifierFamily._();

final class TextControlNotifierProvider
    extends $AsyncNotifierProvider<TextControlNotifier, void> {
  TextControlNotifierProvider._({
    required TextControlNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'textControlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$textControlNotifierHash();

  @override
  String toString() {
    return r'textControlProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TextControlNotifier create() => TextControlNotifier();

  @override
  bool operator ==(Object other) {
    return other is TextControlNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$textControlNotifierHash() =>
    r'0716613983d2dbb8f32399e38436c6e6ded10399';

final class TextControlNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TextControlNotifier,
          AsyncValue<void>,
          void,
          FutureOr<void>,
          String
        > {
  TextControlNotifierFamily._()
    : super(
        retry: null,
        name: r'textControlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TextControlNotifierProvider call(String id) =>
      TextControlNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'textControlProvider';
}

abstract class _$TextControlNotifier extends $AsyncNotifier<void> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<void> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

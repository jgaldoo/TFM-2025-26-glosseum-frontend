// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhotoAPI)
final photoAPIProvider = PhotoAPIProvider._();

final class PhotoAPIProvider extends $AsyncNotifierProvider<PhotoAPI, void> {
  PhotoAPIProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoAPIProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoAPIHash();

  @$internal
  @override
  PhotoAPI create() => PhotoAPI();
}

String _$photoAPIHash() => r'6a6d78843d32528d20c789648d080ea7c7e154e6';

abstract class _$PhotoAPI extends $AsyncNotifier<void> {
  FutureOr<void> build();
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
    element.handleCreate(ref, build);
  }
}

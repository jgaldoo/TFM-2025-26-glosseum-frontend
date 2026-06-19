// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_attributes_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhotoAttributesNotifier)
final photoAttributesProvider = PhotoAttributesNotifierProvider._();

final class PhotoAttributesNotifierProvider
    extends $NotifierProvider<PhotoAttributesNotifier, ImageAttributes> {
  PhotoAttributesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoAttributesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoAttributesNotifierHash();

  @$internal
  @override
  PhotoAttributesNotifier create() => PhotoAttributesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageAttributes value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageAttributes>(value),
    );
  }
}

String _$photoAttributesNotifierHash() =>
    r'432678d09505a4af65d1396a0c94577c1c5c1a48';

abstract class _$PhotoAttributesNotifier extends $Notifier<ImageAttributes> {
  ImageAttributes build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ImageAttributes, ImageAttributes>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ImageAttributes, ImageAttributes>,
              ImageAttributes,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

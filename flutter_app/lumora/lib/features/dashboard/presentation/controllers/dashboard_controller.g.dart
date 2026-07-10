// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashboardController)
const dashboardControllerProvider = DashboardControllerProvider._();

final class DashboardControllerProvider
    extends $NotifierProvider<DashboardController, DeviceState> {
  const DashboardControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardControllerHash();

  @$internal
  @override
  DashboardController create() => DashboardController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceState>(value),
    );
  }
}

String _$dashboardControllerHash() =>
    r'20be15930371f9ba634063c4fafa08a699cce3e6';

abstract class _$DashboardController extends $Notifier<DeviceState> {
  DeviceState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DeviceState, DeviceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeviceState, DeviceState>,
              DeviceState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

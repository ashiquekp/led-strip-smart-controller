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
    extends $NotifierProvider<DashboardController, DashboardStatus> {
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
  Override overrideWithValue(DashboardStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardStatus>(value),
    );
  }
}

String _$dashboardControllerHash() =>
    r'aa1eb30996678505f6a543acf784d19002df2312';

abstract class _$DashboardController extends $Notifier<DashboardStatus> {
  DashboardStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DashboardStatus, DashboardStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DashboardStatus, DashboardStatus>,
              DashboardStatus,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final service1 = StateNotifierProvider<Service1, ServiceState1>((ref) {
  return Service1();
});

class ServiceState1 {
  ServiceState1({this.serviceField1});
  final int? serviceField1;
  ServiceState1 copyWith({
    final int? serviceField1,
  }) {
    return ServiceState1(serviceField1: serviceField1 ?? this.serviceField1);
  }
}

class Service1 extends StateNotifier<ServiceState1> {
  Service1() : super(ServiceState1());

  void init(int field, BuildContext context) {
    state = state.copyWith(serviceField1: field);
    context.read(service2.notifier).init(2);
    context.read(service2.notifier).init(6);
  }

  void incrementCounter(BuildContext context) {
    state = state.copyWith(serviceField1: (state.serviceField1 ?? 0) + 1);
    context.read(service2.notifier).incrementCounter();
  }
}

final service2 = StateNotifierProvider<Service2, ServiceState2>((ref) {
  return Service2();
});

class ServiceState2 {
  ServiceState2({this.serviceField1});
  final int? serviceField1;
  ServiceState2 copyWith({
    final int? serviceField1,
  }) {
    return ServiceState2(serviceField1: serviceField1 ?? this.serviceField1);
  }
}

class Service2 extends StateNotifier<ServiceState2> {
  Service2() : super(ServiceState2());

  void init(int field) {
    state = state.copyWith(serviceField1: field);
  }

  void incrementCounter() {
    state = state.copyWith(serviceField1: (state.serviceField1 ?? 0) + 2);
  }
}

final service3 = StateNotifierProvider<Service3, ServiceState3>((ref) {
  return Service3();
});

class ServiceState3 {
  ServiceState3({this.serviceField1});
  final int? serviceField1;
  ServiceState3 copyWith({
    final int? serviceField1,
  }) {
    return ServiceState3(serviceField1: serviceField1 ?? this.serviceField1);
  }
}

class Service3 extends StateNotifier<ServiceState3> {
  Service3() : super(ServiceState3());

  void init(int field) {
    state = state.copyWith(serviceField1: field);
  }

  void incrementCounter() {
    state = state.copyWith(serviceField1: (state.serviceField1 ?? 0) + 3);
  }
}

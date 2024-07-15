// Mocks generated by Mockito 5.4.4 from annotations
// in dating_app/test/widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:dating_app/database/interfaces/converter.dart' as _i6;
import 'package:dating_app/database/models/document.dart' as _i3;
import 'package:dating_app/database/repositories/repository.dart' as _i4;
import 'package:firebase_database/firebase_database.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeStreamSubscription_0<T> extends _i1.SmartFake
    implements _i2.StreamSubscription<T> {
  _FakeStreamSubscription_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Repository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepository<TModel extends _i3.Document> extends _i1.Mock
    implements _i4.Repository<TModel> {
  MockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.StreamSubscription<_i5.DatabaseEvent> listen(
          dynamic Function(Map<dynamic, dynamic>)? onEvent) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [onEvent],
        ),
        returnValue: _FakeStreamSubscription_0<_i5.DatabaseEvent>(
          this,
          Invocation.method(
            #listen,
            [onEvent],
          ),
        ),
      ) as _i2.StreamSubscription<_i5.DatabaseEvent>);

  @override
  _i2.Future<void> set(
    TModel? model,
    _i6.Converter<TModel>? converter,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #set,
          [
            model,
            converter,
          ],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<List<TModel>> getAll(_i6.Converter<TModel>? converter) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [converter],
        ),
        returnValue: _i2.Future<List<TModel>>.value(<TModel>[]),
      ) as _i2.Future<List<TModel>>);

  @override
  _i2.Future<void> remove(String? userId) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [userId],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<void> removeAll() => (super.noSuchMethod(
        Invocation.method(
          #removeAll,
          [],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);
}

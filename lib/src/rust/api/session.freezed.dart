// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Input {

 String get name;
/// Create a copy of Input
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputCopyWith<Input> get copyWith => _$InputCopyWithImpl<Input>(this as Input, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Input&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Input(name: $name)';
}


}

/// @nodoc
abstract mixin class $InputCopyWith<$Res>  {
  factory $InputCopyWith(Input value, $Res Function(Input) _then) = _$InputCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$InputCopyWithImpl<$Res>
    implements $InputCopyWith<$Res> {
  _$InputCopyWithImpl(this._self, this._then);

  final Input _self;
  final $Res Function(Input) _then;

/// Create a copy of Input
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Input].
extension InputPatterns on Input {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Input value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Input() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Input value)  $default,){
final _that = this;
switch (_that) {
case _Input():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Input value)?  $default,){
final _that = this;
switch (_that) {
case _Input() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Input() when $default != null:
return $default(_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _Input():
return $default(_that.name);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _Input() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Input implements Input {
  const _Input({required this.name});
  

@override final  String name;

/// Create a copy of Input
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InputCopyWith<_Input> get copyWith => __$InputCopyWithImpl<_Input>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Input&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Input(name: $name)';
}


}

/// @nodoc
abstract mixin class _$InputCopyWith<$Res> implements $InputCopyWith<$Res> {
  factory _$InputCopyWith(_Input value, $Res Function(_Input) _then) = __$InputCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$InputCopyWithImpl<$Res>
    implements _$InputCopyWith<$Res> {
  __$InputCopyWithImpl(this._self, this._then);

  final _Input _self;
  final $Res Function(_Input) _then;

/// Create a copy of Input
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Input(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Output {

 String get name;
/// Create a copy of Output
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputCopyWith<Output> get copyWith => _$OutputCopyWithImpl<Output>(this as Output, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Output&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Output(name: $name)';
}


}

/// @nodoc
abstract mixin class $OutputCopyWith<$Res>  {
  factory $OutputCopyWith(Output value, $Res Function(Output) _then) = _$OutputCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$OutputCopyWithImpl<$Res>
    implements $OutputCopyWith<$Res> {
  _$OutputCopyWithImpl(this._self, this._then);

  final Output _self;
  final $Res Function(Output) _then;

/// Create a copy of Output
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Output].
extension OutputPatterns on Output {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Output value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Output() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Output value)  $default,){
final _that = this;
switch (_that) {
case _Output():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Output value)?  $default,){
final _that = this;
switch (_that) {
case _Output() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Output() when $default != null:
return $default(_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _Output():
return $default(_that.name);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _Output() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Output implements Output {
  const _Output({required this.name});
  

@override final  String name;

/// Create a copy of Output
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutputCopyWith<_Output> get copyWith => __$OutputCopyWithImpl<_Output>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Output&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Output(name: $name)';
}


}

/// @nodoc
abstract mixin class _$OutputCopyWith<$Res> implements $OutputCopyWith<$Res> {
  factory _$OutputCopyWith(_Output value, $Res Function(_Output) _then) = __$OutputCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$OutputCopyWithImpl<$Res>
    implements _$OutputCopyWith<$Res> {
  __$OutputCopyWithImpl(this._self, this._then);

  final _Output _self;
  final $Res Function(_Output) _then;

/// Create a copy of Output
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Output(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SessionBuilderOptions {

 List<ExecutionProvider>? get executionProviders; int? get intraThreads; int? get interThreads; bool? get parallelExecution; GraphOptimizationLevel? get optimizationLevel; bool? get memoryPattern;
/// Create a copy of SessionBuilderOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionBuilderOptionsCopyWith<SessionBuilderOptions> get copyWith => _$SessionBuilderOptionsCopyWithImpl<SessionBuilderOptions>(this as SessionBuilderOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionBuilderOptions&&const DeepCollectionEquality().equals(other.executionProviders, executionProviders)&&(identical(other.intraThreads, intraThreads) || other.intraThreads == intraThreads)&&(identical(other.interThreads, interThreads) || other.interThreads == interThreads)&&(identical(other.parallelExecution, parallelExecution) || other.parallelExecution == parallelExecution)&&(identical(other.optimizationLevel, optimizationLevel) || other.optimizationLevel == optimizationLevel)&&(identical(other.memoryPattern, memoryPattern) || other.memoryPattern == memoryPattern));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(executionProviders),intraThreads,interThreads,parallelExecution,optimizationLevel,memoryPattern);

@override
String toString() {
  return 'SessionBuilderOptions(executionProviders: $executionProviders, intraThreads: $intraThreads, interThreads: $interThreads, parallelExecution: $parallelExecution, optimizationLevel: $optimizationLevel, memoryPattern: $memoryPattern)';
}


}

/// @nodoc
abstract mixin class $SessionBuilderOptionsCopyWith<$Res>  {
  factory $SessionBuilderOptionsCopyWith(SessionBuilderOptions value, $Res Function(SessionBuilderOptions) _then) = _$SessionBuilderOptionsCopyWithImpl;
@useResult
$Res call({
 List<ExecutionProvider>? executionProviders, int? intraThreads, int? interThreads, bool? parallelExecution, GraphOptimizationLevel? optimizationLevel, bool? memoryPattern
});




}
/// @nodoc
class _$SessionBuilderOptionsCopyWithImpl<$Res>
    implements $SessionBuilderOptionsCopyWith<$Res> {
  _$SessionBuilderOptionsCopyWithImpl(this._self, this._then);

  final SessionBuilderOptions _self;
  final $Res Function(SessionBuilderOptions) _then;

/// Create a copy of SessionBuilderOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? executionProviders = freezed,Object? intraThreads = freezed,Object? interThreads = freezed,Object? parallelExecution = freezed,Object? optimizationLevel = freezed,Object? memoryPattern = freezed,}) {
  return _then(_self.copyWith(
executionProviders: freezed == executionProviders ? _self.executionProviders : executionProviders // ignore: cast_nullable_to_non_nullable
as List<ExecutionProvider>?,intraThreads: freezed == intraThreads ? _self.intraThreads : intraThreads // ignore: cast_nullable_to_non_nullable
as int?,interThreads: freezed == interThreads ? _self.interThreads : interThreads // ignore: cast_nullable_to_non_nullable
as int?,parallelExecution: freezed == parallelExecution ? _self.parallelExecution : parallelExecution // ignore: cast_nullable_to_non_nullable
as bool?,optimizationLevel: freezed == optimizationLevel ? _self.optimizationLevel : optimizationLevel // ignore: cast_nullable_to_non_nullable
as GraphOptimizationLevel?,memoryPattern: freezed == memoryPattern ? _self.memoryPattern : memoryPattern // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionBuilderOptions].
extension SessionBuilderOptionsPatterns on SessionBuilderOptions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionBuilderOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionBuilderOptions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionBuilderOptions value)  $default,){
final _that = this;
switch (_that) {
case _SessionBuilderOptions():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionBuilderOptions value)?  $default,){
final _that = this;
switch (_that) {
case _SessionBuilderOptions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ExecutionProvider>? executionProviders,  int? intraThreads,  int? interThreads,  bool? parallelExecution,  GraphOptimizationLevel? optimizationLevel,  bool? memoryPattern)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionBuilderOptions() when $default != null:
return $default(_that.executionProviders,_that.intraThreads,_that.interThreads,_that.parallelExecution,_that.optimizationLevel,_that.memoryPattern);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ExecutionProvider>? executionProviders,  int? intraThreads,  int? interThreads,  bool? parallelExecution,  GraphOptimizationLevel? optimizationLevel,  bool? memoryPattern)  $default,) {final _that = this;
switch (_that) {
case _SessionBuilderOptions():
return $default(_that.executionProviders,_that.intraThreads,_that.interThreads,_that.parallelExecution,_that.optimizationLevel,_that.memoryPattern);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ExecutionProvider>? executionProviders,  int? intraThreads,  int? interThreads,  bool? parallelExecution,  GraphOptimizationLevel? optimizationLevel,  bool? memoryPattern)?  $default,) {final _that = this;
switch (_that) {
case _SessionBuilderOptions() when $default != null:
return $default(_that.executionProviders,_that.intraThreads,_that.interThreads,_that.parallelExecution,_that.optimizationLevel,_that.memoryPattern);case _:
  return null;

}
}

}

/// @nodoc


class _SessionBuilderOptions extends SessionBuilderOptions {
  const _SessionBuilderOptions({final  List<ExecutionProvider>? executionProviders, this.intraThreads, this.interThreads, this.parallelExecution, this.optimizationLevel, this.memoryPattern}): _executionProviders = executionProviders,super._();
  

 final  List<ExecutionProvider>? _executionProviders;
@override List<ExecutionProvider>? get executionProviders {
  final value = _executionProviders;
  if (value == null) return null;
  if (_executionProviders is EqualUnmodifiableListView) return _executionProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? intraThreads;
@override final  int? interThreads;
@override final  bool? parallelExecution;
@override final  GraphOptimizationLevel? optimizationLevel;
@override final  bool? memoryPattern;

/// Create a copy of SessionBuilderOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionBuilderOptionsCopyWith<_SessionBuilderOptions> get copyWith => __$SessionBuilderOptionsCopyWithImpl<_SessionBuilderOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionBuilderOptions&&const DeepCollectionEquality().equals(other._executionProviders, _executionProviders)&&(identical(other.intraThreads, intraThreads) || other.intraThreads == intraThreads)&&(identical(other.interThreads, interThreads) || other.interThreads == interThreads)&&(identical(other.parallelExecution, parallelExecution) || other.parallelExecution == parallelExecution)&&(identical(other.optimizationLevel, optimizationLevel) || other.optimizationLevel == optimizationLevel)&&(identical(other.memoryPattern, memoryPattern) || other.memoryPattern == memoryPattern));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_executionProviders),intraThreads,interThreads,parallelExecution,optimizationLevel,memoryPattern);

@override
String toString() {
  return 'SessionBuilderOptions(executionProviders: $executionProviders, intraThreads: $intraThreads, interThreads: $interThreads, parallelExecution: $parallelExecution, optimizationLevel: $optimizationLevel, memoryPattern: $memoryPattern)';
}


}

/// @nodoc
abstract mixin class _$SessionBuilderOptionsCopyWith<$Res> implements $SessionBuilderOptionsCopyWith<$Res> {
  factory _$SessionBuilderOptionsCopyWith(_SessionBuilderOptions value, $Res Function(_SessionBuilderOptions) _then) = __$SessionBuilderOptionsCopyWithImpl;
@override @useResult
$Res call({
 List<ExecutionProvider>? executionProviders, int? intraThreads, int? interThreads, bool? parallelExecution, GraphOptimizationLevel? optimizationLevel, bool? memoryPattern
});




}
/// @nodoc
class __$SessionBuilderOptionsCopyWithImpl<$Res>
    implements _$SessionBuilderOptionsCopyWith<$Res> {
  __$SessionBuilderOptionsCopyWithImpl(this._self, this._then);

  final _SessionBuilderOptions _self;
  final $Res Function(_SessionBuilderOptions) _then;

/// Create a copy of SessionBuilderOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? executionProviders = freezed,Object? intraThreads = freezed,Object? interThreads = freezed,Object? parallelExecution = freezed,Object? optimizationLevel = freezed,Object? memoryPattern = freezed,}) {
  return _then(_SessionBuilderOptions(
executionProviders: freezed == executionProviders ? _self._executionProviders : executionProviders // ignore: cast_nullable_to_non_nullable
as List<ExecutionProvider>?,intraThreads: freezed == intraThreads ? _self.intraThreads : intraThreads // ignore: cast_nullable_to_non_nullable
as int?,interThreads: freezed == interThreads ? _self.interThreads : interThreads // ignore: cast_nullable_to_non_nullable
as int?,parallelExecution: freezed == parallelExecution ? _self.parallelExecution : parallelExecution // ignore: cast_nullable_to_non_nullable
as bool?,optimizationLevel: freezed == optimizationLevel ? _self.optimizationLevel : optimizationLevel // ignore: cast_nullable_to_non_nullable
as GraphOptimizationLevel?,memoryPattern: freezed == memoryPattern ? _self.memoryPattern : memoryPattern // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaginationMetaDto> _$paginationMetaDtoSerializer =
    _$PaginationMetaDtoSerializer();

class _$PaginationMetaDtoSerializer
    implements StructuredSerializer<PaginationMetaDto> {
  @override
  final Iterable<Type> types = const [PaginationMetaDto, _$PaginationMetaDto];
  @override
  final String wireName = 'PaginationMetaDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    PaginationMetaDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'current_page',
      serializers.serialize(
        object.currentPage,
        specifiedType: const FullType(int),
      ),
      'last_page',
      serializers.serialize(
        object.lastPage,
        specifiedType: const FullType(int),
      ),
      'per_page',
      serializers.serialize(object.perPage, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.from;
    if (value != null) {
      result
        ..add('from')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.unreadedCount;
    if (value != null) {
      result
        ..add('unreaded_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PaginationMetaDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginationMetaDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'current_page':
          result.currentPage =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'last_page':
          result.lastPage =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'per_page':
          result.perPage =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'total':
          result.total =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'from':
          result.from =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'to':
          result.to =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'unreaded_count':
          result.unreadedCount =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$PaginationMetaDto extends PaginationMetaDto {
  @override
  final int currentPage;
  @override
  final int lastPage;
  @override
  final int perPage;
  @override
  final int total;
  @override
  final int? from;
  @override
  final int? to;
  @override
  final int? unreadedCount;

  factory _$PaginationMetaDto([
    void Function(PaginationMetaDtoBuilder)? updates,
  ]) => (PaginationMetaDtoBuilder()..update(updates))._build();

  _$PaginationMetaDto._({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    this.from,
    this.to,
    this.unreadedCount,
  }) : super._();
  @override
  PaginationMetaDto rebuild(void Function(PaginationMetaDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationMetaDtoBuilder toBuilder() =>
      PaginationMetaDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationMetaDto &&
        currentPage == other.currentPage &&
        lastPage == other.lastPage &&
        perPage == other.perPage &&
        total == other.total &&
        from == other.from &&
        to == other.to &&
        unreadedCount == other.unreadedCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentPage.hashCode);
    _$hash = $jc(_$hash, lastPage.hashCode);
    _$hash = $jc(_$hash, perPage.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jc(_$hash, unreadedCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginationMetaDto')
          ..add('currentPage', currentPage)
          ..add('lastPage', lastPage)
          ..add('perPage', perPage)
          ..add('total', total)
          ..add('from', from)
          ..add('to', to)
          ..add('unreadedCount', unreadedCount))
        .toString();
  }
}

class PaginationMetaDtoBuilder
    implements Builder<PaginationMetaDto, PaginationMetaDtoBuilder> {
  _$PaginationMetaDto? _$v;

  int? _currentPage;
  int? get currentPage => _$this._currentPage;
  set currentPage(int? currentPage) => _$this._currentPage = currentPage;

  int? _lastPage;
  int? get lastPage => _$this._lastPage;
  set lastPage(int? lastPage) => _$this._lastPage = lastPage;

  int? _perPage;
  int? get perPage => _$this._perPage;
  set perPage(int? perPage) => _$this._perPage = perPage;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _from;
  int? get from => _$this._from;
  set from(int? from) => _$this._from = from;

  int? _to;
  int? get to => _$this._to;
  set to(int? to) => _$this._to = to;

  int? _unreadedCount;
  int? get unreadedCount => _$this._unreadedCount;
  set unreadedCount(int? unreadedCount) =>
      _$this._unreadedCount = unreadedCount;

  PaginationMetaDtoBuilder();

  PaginationMetaDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentPage = $v.currentPage;
      _lastPage = $v.lastPage;
      _perPage = $v.perPage;
      _total = $v.total;
      _from = $v.from;
      _to = $v.to;
      _unreadedCount = $v.unreadedCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationMetaDto other) {
    _$v = other as _$PaginationMetaDto;
  }

  @override
  void update(void Function(PaginationMetaDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationMetaDto build() => _build();

  _$PaginationMetaDto _build() {
    final _$result =
        _$v ??
        _$PaginationMetaDto._(
          currentPage: BuiltValueNullFieldError.checkNotNull(
            currentPage,
            r'PaginationMetaDto',
            'currentPage',
          ),
          lastPage: BuiltValueNullFieldError.checkNotNull(
            lastPage,
            r'PaginationMetaDto',
            'lastPage',
          ),
          perPage: BuiltValueNullFieldError.checkNotNull(
            perPage,
            r'PaginationMetaDto',
            'perPage',
          ),
          total: BuiltValueNullFieldError.checkNotNull(
            total,
            r'PaginationMetaDto',
            'total',
          ),
          from: from,
          to: to,
          unreadedCount: unreadedCount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

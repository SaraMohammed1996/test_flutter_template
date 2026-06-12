/// Reusable paginated list model for all features
class PaginatedList<T> {
  final List<T> items;
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const PaginatedList({
    required this.items,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  bool get hasMore => currentPage < lastPage;
  bool get isFirstPage => currentPage == 1;
  bool get isEmpty => items.isEmpty;

  PaginatedList<T> copyWith({
    List<T>? items,
    int? currentPage,
    int? lastPage,
    int? perPage,
    int? total,
  }) {
    return PaginatedList<T>(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
    );
  }

  /// Append new page data to existing list
  PaginatedList<T> appendPage(PaginatedList<T> newPage) {
    return PaginatedList<T>(
      items: [...items, ...newPage.items],
      currentPage: newPage.currentPage,
      lastPage: newPage.lastPage,
      perPage: newPage.perPage,
      total: newPage.total,
    );
  }
}

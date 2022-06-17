/// The [PexelsEndpoints] class contains the set of URL that the Pexels API support.
mixin PexelsEndpoints {
  /// Photos Endpoints.
  static const String photoCurated = '/curated';
  static const String photoPopular = '/popular';
  static const String photoSearch = '/search';

  static String photo(int id) => '/photos/$id';
}

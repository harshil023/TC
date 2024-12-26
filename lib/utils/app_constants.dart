class AppConstants {
  //App related
  static const String appName = 'Setup App';
  static const int appVersion = 1;

  //Languages
  static const String languageEnglish = "en";
  static const String languageGerman = "de";

  //API related
  static const String baseApi = 'http://restapi.adequateshop.com/api';
  static const String login = '$baseApi/authaccount/login';
  static const String userList = '$baseApi/users';
  static const String movieDbBaseUrl = 'https://api.themoviedb.org/3';
  static const String movieDbImageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String discoverMoviesUrl =
      '/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc';
  static const String movieDbApiKey = 'a85ce05af29f9b75de6860905c3fde99';
  static const String movieDbBearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhODVjZTA1YWYyOWY5Yjc1ZGU2ODYwOTA1YzNmZGU5OSIsInN1YiI6IjY1MDdlYTIxM2NkMTJjMDEwY2QwZmQxMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.t3NiqjWxCiqbS9JfJRRpzu7jAmHGAV23QrY62iSspW8';

  //API results
  static const String checkInFail = 'Check-In Failed';

  /*
Shared Pref
  */
  static const String apiKey = 'apiKey';

  //Movie
  static const String discoverMoviesTxt = 'Discover Movies';


}

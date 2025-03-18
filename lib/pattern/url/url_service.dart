abstract class EndPointProvider {}

abstract class UrlService {
  String get apiUrl;
  String buildUrl(String endpoint);
  String get loginUrl;
  EndPointProvider get fundEndpoint;
}

class UrlServiceImpl implements UrlService {
  final Config config;
  final StreamerRemoteConfig remoteConfig;

  UrlServiceImpl({required this.config, required this.remoteConfig});

  @override
  String get apiUrl => 'url';

  @override
  String get loginUrl => '$apiUrl/auth/login';

  @override
  EndPointProvider get fundEndpoint => FundEndpoint(urlService: this);

  @override
  String buildUrl(String endpoint) {
    return '$apiUrl/$endpoint';
  }
}

class FundEndpoint implements EndPointProvider {
  final UrlService urlService;

  FundEndpoint({required this.urlService});

  String get buyFund => urlService.buildUrl('/fund-endpoint');
}

class StreamerRemoteConfig {}

class Config {}

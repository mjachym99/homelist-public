const emulatorBaseUrl = '127.0.0.1';

enum EmulatorConfig {
  auth(
    baseUrl: emulatorBaseUrl,
    port: 9099,
  ),
  functions(
    baseUrl: emulatorBaseUrl,
    port: 5001,
  ),
  firestore(
    baseUrl: emulatorBaseUrl,
    port: 8080,
  );

  const EmulatorConfig({
    required this.baseUrl,
    required this.port,
  });

  final String baseUrl;
  final int port;
}

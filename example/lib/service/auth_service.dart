class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._internal();

  // Private constructor
  AuthService._internal();

  // Factory constructor to return the singleton instance
  factory AuthService() {
    return _instance;
  }

  // Simulate an active token
  String? _activeToken;

  // Method to check if the user is authenticated based on the active token
  bool isAuthenticated() {
    // Replace this logic with your actual token validation logic
    return _activeToken != null && _activeToken!.isNotEmpty;
  }

  // Method to set the active token
  void setToken(String token) {
    _activeToken = token;
  }

  // Method to clear the active token (logout)
  void clearToken() {
    _activeToken = null;
  }
}

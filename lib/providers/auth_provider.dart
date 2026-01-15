import 'package:flutter/foundation.dart';
import 'dart:async';

// 1. Define Auth Status
enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
  connectionError,
}

// 2. Define the User Model locally (Mock)
class User {
  final String id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String role;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
  });

  String get fullName => '$firstName $lastName';
}

// 3. The Mock Provider
class AuthProvider with ChangeNotifier {
  String? _token; // Fake token
  String? _refreshToken; // Fake refresh token
  User? _user;
  AuthStatus _status = AuthStatus.initial;
  String? _errorMessage;
  String? _city = "Dhaka"; // Default Demo Location
  double? _latitude = 23.8103;
  double? _longitude = 90.4125;

  // --- FIX: Added the missing token getters here ---
  String? get token => _token;
  String? get refreshToken => _refreshToken;
  
  // Existing Getters
  User? get user => _user;
  AuthStatus get status => _status;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  String? get errorMessage => _errorMessage;
  String? get city => _city;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  String? get userRole => _user?.role;

  // Set user location (Mock)
  void setUserLocation(String? city, double? latitude, double? longitude) {
    _city = city;
    _latitude = latitude;
    _longitude = longitude;
    notifyListeners();
  }

  // --- MOCK LOGIN ---
  Future<bool> login(String username, String password) async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    // Fake network delay for realism
    await Future.delayed(const Duration(seconds: 1));

    try {
      // DEMO LOGIC: Determine role based on username
      String role = 'CITIZEN';
      String uid = 'user_123';
      
      final lowerName = username.toLowerCase();
      if (lowerName.contains('admin')) {
        role = 'ADMIN';
      } else if (lowerName.contains('fire')) {
        role = 'FIRE_STATION';
        uid = 'fire_station_01';
      } else if (lowerName.contains('police')) {
        role = 'POLICE';
        uid = 'police_station_01';
      } else if (lowerName.contains('vol') || lowerName.contains('red')) {
        role = 'RED_CRESCENT';
        uid = 'volunteer_01';
      }

      // Create the fake user
      _user = User(
        id: uid,
        username: username,
        email: '$username@resq.demo',
        firstName: "Demo",
        lastName: role == 'CITIZEN' ? "User" : "Officer",
        phoneNumber: "+8801700000000",
        role: role,
      );

      _token = "fake_demo_token_12345";
      _refreshToken = "fake_demo_refresh_token_123";
      _status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = "Demo Error: ${e.toString()}";
      _status = AuthStatus.error;
      notifyListeners();
      return false;
    }
  }

  // --- MOCK REGISTER ---
  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String role,
    required double latitude,
    required double longitude,
    required String address,
  }) async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    // Allow registration to always succeed
    _user = User(
      id: 'new_user_${DateTime.now().millisecondsSinceEpoch}',
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      role: role,
    );
    
    _token = "fake_demo_token_new";
    _refreshToken = "fake_demo_refresh_token_new";
    _status = AuthStatus.authenticated;
    
    notifyListeners();
    return true;
  }

  // --- MOCK LOGOUT ---
  Future<void> logout() async {
    _token = null;
    _refreshToken = null;
    _user = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  // --- MOCK PROFILE REFRESH ---
  Future<bool> refreshUserProfile() async {
    if (_token == null) return false;
    // Just keep the current user
    return true;
  }

  // --- MOCK CONNECTION RETRY ---
  Future<void> retryConnection() async {
    _status = AuthStatus.loading;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    _status = AuthStatus.authenticated; // Assume connection fixed
    notifyListeners();
  }

  // --- MOCK DASHBOARD DATA ---
  Future<Map<String, dynamic>?> getDashboardData() async {
    await Future.delayed(const Duration(milliseconds: 800));

    // Fake Emergency Reports
    final List<Map<String, dynamic>> dummyReports = [
      {
        'id': 'inc_001',
        'type': 'Fire',
        'description': 'Small fire in kitchen',
        'location': 'Dhanmondi 27',
        'status': 'PENDING',
        'timestamp': DateTime.now().subtract(Duration(minutes: 5)).toString(),
      },
      {
        'id': 'inc_002',
        'type': 'Medical',
        'description': 'Road accident, minor injuries',
        'location': 'Gulshan 1',
        'status': 'RESPONDING',
        'timestamp': DateTime.now().subtract(Duration(minutes: 25)).toString(),
      }
    ];

    return {
      'current_status': {
        'pending': 1,
        'responding': 1,
        'on_scene': 0,
      },
      'pending_emergencies': dummyReports.where((r) => r['status'] == 'PENDING').toList(),
    };
  }

  // --- MOCK STATUS UPDATE ---
  Future<Map<String, dynamic>?> updateEmergencyStatus(
    String emergencyId,
    String status,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return {'status': status, 'success': true};
  }
}
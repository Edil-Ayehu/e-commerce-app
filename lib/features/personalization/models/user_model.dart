
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModel {
  // Keep those valus final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  // Constructor for UserModel
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Helper function to get the full name
  String get fullName => '$firstName $lastName';

  // Helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  // static function to split name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  // static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        '$firstName$lastName'; // Combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // add 'cwt_prefix
    return usernameWithPrefix;
  }

  // Static function to create on empty user model
  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '');

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot
  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  //   if(document.data() != null){
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //        username: data['Username'] ?? '',
  //         email: data['Email'] ?? '',
  //          firstName: data['FirstName'] ?? '',
  //           lastName: data['LastName'] ?? '',
  //            phoneNumber: data['PhoneNumber'] ?? '',
  //             profilePicture: data['ProfilePicture'] ?? '',
  //             );
  //   }
  // }
}

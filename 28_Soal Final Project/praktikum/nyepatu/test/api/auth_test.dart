// ignore_for_file: unused_local_variable

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyepatu/models/user_models.dart';
import 'package:nyepatu/services/auth_services.dart';
import 'package:test/test.dart';
import 'auth_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  final MockAuthService mockauthService = MockAuthService();

  group(
    'Auth API Test',
    () {
      // Register Test
      test(
        'Register',
        () async {
          when(mockauthService.register(
                  'name', 'username', 'email', 'password'))
              .thenAnswer(
            (_) async => UserModel(
              id: 1,
              name: 'name',
              email: 'email@gmail.com',
              username: 'this admin',
              token: '112345678ufdjsbnkvnjk',
              profilePhoto:
                  'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
            ),
          );

          final response = await mockauthService.register(
              'name', 'username', 'email', 'password');

          expect(response.name, 'name');
        },
      );

      // Login Test
      test(
        'Login',
        () async {
          when(mockauthService.login('email', 'password')).thenAnswer(
            (_) async => UserModel(
              email: 'email',
              password: 'password',
            ),
          );
          final response = await mockauthService.login('email', 'password');

          expect(response.email, 'email');
        },
      );

      // Current User Get test
      test(
        'Current User',
        () async {
          when(mockauthService.currentUser('token')).thenAnswer(
            (_) async => UserModel(
              id: 1,
              name: 'name',
              email: 'email@gmail.com',
              username: 'this admin',
              token: 'token',
              profilePhoto:
                  'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
            ),
          );

          var users = await mockauthService.currentUser('token');
          expect(users.token!.isNotEmpty, true);
        },
      );

      test(
        'Update User',
        () async {
          when(mockauthService.updateUser('token', 'name', 'username', 'email'))
              .thenAnswer(
            (_) async => UserModel(
              token: 'token',
              name: 'name',
              username: 'this admin 2',
              email: 'email2@gmail.com',
            ),
          );
          final response = await mockauthService.updateUser(
              'token', 'name', 'username', 'email');

          expect(response.name, 'name');
        },
      );

      // Logout test
      test('Logout', () async {
        bool result;
        when(mockauthService.logout('token')).thenAnswer(
          (_) async => result = true,
        );

        final response = await mockauthService.logout(
            'token');

        expect(response == true, true);
      });
    },
  );
}

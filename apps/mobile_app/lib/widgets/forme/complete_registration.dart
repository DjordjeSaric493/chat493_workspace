import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_auth_idp_flutter/widgets.dart';

/// Widget for completing registration by setting a password.
///
/// Displays a password field for users to set their password during
/// registration.
class BusCompleteRegistrationForm extends StatelessWidget {
  /// The controller that manages authentication state and logic.
  final EmailAuthController controller;

  const BusCompleteRegistrationForm({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SetPasswordForm(
      controller: controller,
      title: 'Postavi lozinku',
      passwordLabelText: 'Lozinka',
      actionButtonLabel: 'Registruj se',
      onActionPressed: controller.finishRegistration,
      bottomText: Center(
        child: HyperlinkTextButton(
          onPressed: () =>
              controller.navigateTo(EmailFlowScreen.startRegistration),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          label: 'Nazad na registraciju',
        ),
      ),
    );
  }
}

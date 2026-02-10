import 'dart:async';

import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_auth_idp_flutter/widgets.dart';

/// Registration form widget for email authentication.
///
/// Displays email field and optional terms checkbox for starting registration.
/// After submission, user will proceed to set password screen.
class StartRegistrationForm extends StatelessWidget {
  /// The controller that manages authentication state and logic.
  final EmailAuthController controller;

  /// Optional callback to call when the terms and conditions button is pressed.
  ///
  /// If not provided, defaults to null.
  final VoidCallback? onTermsAndConditionsPressed;

  /// Optional callback to call when the privacy policy button is pressed.
  ///
  /// If not provided, defaults to null.
  final VoidCallback? onPrivacyPolicyPressed;

  /// Creates a [StartRegistrationForm] widget.
  const StartRegistrationForm({
    required this.controller,
    this.onTermsAndConditionsPressed,
    this.onPrivacyPolicyPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onTermsAndConditionsPressed = this.onTermsAndConditionsPressed;
    final onPrivacyPolicyPressed = this.onPrivacyPolicyPressed;

    final hasTermsAndConditions =
        onTermsAndConditionsPressed != null || onPrivacyPolicyPressed != null;

    return FormStandardLayout(
      title: 'Prijava preko emaila',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailTextField(controller: controller),
          if (hasTermsAndConditions) ...[
            const Expanded(child: SizedBox.shrink()),
            SizedBox(
              height: 40,
              child: TermsAndPrivacyText(
                onTermsAndConditionsPressed: onTermsAndConditionsPressed,
                onPrivacyPolicyPressed: onPrivacyPolicyPressed,
                isChecked: controller.legalNoticeAcceptedNotifier.value,
                onCheckboxChanged: (value) =>
                    controller.legalNoticeAcceptedNotifier.value =
                        value ?? false,
              ),
            ),
            smallGap,
          ],
        ],
      ),
      actionButton: ActionButton(
        onPressed:
            controller.emailController.text.isNotEmpty &&
                controller.state == EmailAuthState.idle &&
                (!hasTermsAndConditions ||
                    controller.legalNoticeAcceptedNotifier.value)
            ? () => unawaited(controller.startRegistration())
            : null,
        label: 'Nastavi',
        isLoading: controller.isLoading,
      ),
      bottomText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Već imate nalog?"),
          HyperlinkTextButton(
            onPressed: () => controller.navigateTo(EmailFlowScreen.login),
            label: 'Prijavite se',
          ),
        ],
      ),
    );
  }
}

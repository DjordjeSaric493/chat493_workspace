import 'package:flutter/material.dart';

/// Represents a single password requirement.
class BusPasswordRequirement {
  /// The text description of the requirement (e.g., "At least 1 uppercase").
  final String description;

  /// Function to check if the password meets this requirement.
  final bool Function(String password) validator;

  /// Creates a [PasswordRequirement].
  const BusPasswordRequirement({
    required this.description,
    required this.validator,
  });

  /// Regular expression for lowercase letters.
  static final lowercaseLetters = RegExp(r'[a-z]');

  /// Regular expression for uppercase letters.
  static final uppercaseLetters = RegExp(r'[A-Z]');

  /// Regular expression for numbers.
  static final numbers = RegExp(r'[0-9]');

  /// Regular expression for special characters.
  static final specialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  /// Regular expression for all allowed characters.
  static final allowedCharacters = RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]');

  /// Creates a [BusPasswordRequirement] for a minimum length.
  factory BusPasswordRequirement.minLength(int length) =>
      BusPasswordRequirement(
        description: 'Bar $length karaktera',
        validator: (password) => password.length >= length,
      );

  /// Creates a [BusPasswordRequirement] for a maximum length.
  factory BusPasswordRequirement.maxLength(int length) =>
      BusPasswordRequirement(
        description: 'Najviše $length characters',
        validator: (password) => password.length <= length,
      );

  /// Creates a [BusPasswordRequirement] for at least one lowercase letter.
  factory BusPasswordRequirement.containsLowercase() => BusPasswordRequirement(
    description: 'Sadrži bar jedno malo slovo',
    validator: (password) => password.contains(lowercaseLetters),
  );

  /// Creates a [BusPasswordRequirement] for at least one uppercase letter.
  factory BusPasswordRequirement.containsUppercase() => BusPasswordRequirement(
    description: 'Sadrži bar jedno veliko slovo',
    validator: (password) => password.contains(uppercaseLetters),
  );

  /// Creates a [BusPasswordRequirement] for at least one number.
  factory BusPasswordRequirement.containsNumber() => BusPasswordRequirement(
    description: 'Sadrži bar jedan broj',
    validator: (password) => password.contains(numbers),
  );

  /// Creates a [BusPasswordRequirement] for at least one special character.
  factory BusPasswordRequirement.containsSpecialCharacter() =>
      BusPasswordRequirement(
        description: 'Sadrži bar jedan specijalan karakter',
        validator: (password) => password.contains(specialCharacters),
      );

  /// Static list of default password requirements.
  static final List<BusPasswordRequirement> defaultRequirements = [
    BusPasswordRequirement.minLength(12),
    BusPasswordRequirement.containsUppercase(),
    BusPasswordRequirement.containsLowercase(),
    BusPasswordRequirement.containsNumber(),
    BusPasswordRequirement.containsSpecialCharacter(),
  ];
}

/// Widget that displays password requirements.
///
/// Shows a list of password requirements with their validation status.
/// Requirements are displayed in gray bodySmall text.
class PasswordRequirements extends StatelessWidget {
  /// The password text to validate against requirements.
  final String password;

  /// The list of password requirements to display.
  final List<BusPasswordRequirement> requirements;

  /// Creates a [PasswordRequirements] widget.
  const PasswordRequirements({
    required this.password,
    required this.requirements,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (requirements.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final textStyle =
        theme.textTheme.bodySmall?.copyWith(color: Colors.grey) ??
        const TextStyle(fontSize: 12, color: Colors.grey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var requirement in requirements)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16),
            child: Row(
              children: [
                Icon(
                  requirement.validator(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: requirement.validator(password)
                      ? Colors.green
                      : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  requirement.description,
                  style: password.isEmpty
                      ? textStyle
                      : requirement.validator(password)
                      ? textStyle.copyWith(color: Colors.green)
                      : textStyle,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Extension on [List<BusPasswordRequirement>] to provide convenience methods.
extension PasswordRequirementsExtension on List<BusPasswordRequirement> {
  /// Returns true if the password is empty or meets all requirements.
  bool isValid(String password) =>
      isEmpty ||
      (isNotEmpty && every((requirement) => requirement.validator(password)));
}

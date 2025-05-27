dynamic validateForm(String value, type) {
  switch (type) {
    case 'Email':
      if (value.isEmpty) {
        return 'Sorry, $type is required';
      } else if (value.length <= 5) {
        return 'Sorry, $type must be greater 5 characters';
      } else if (!RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        // r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
      ).hasMatch(value)) {
        return 'Sorry, $type must be email';
      }
    // break;
    case 'Name':
      if (value.isEmpty) {
        return 'Sorry, $type is required';
      } else if (value.length <= 5) {
        return 'Sorry, $type must be greater 5 characters';
      }
    // abc @ --- . com
    // xyz@yahoo.com
    // xyz.com
    case 'Password':
      if (value.isEmpty) {
        return 'Sorry, $type is required';
      } else if (value.length <= 5) {
        return 'Sorry, $type must be greater 5 characters';
      } else if (!RegExp(
        r'^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$',
      ).hasMatch(value)) {
        return 'Sorry $type must have numbers and characters';
      }
    case 'Confirm Password':
      if (value.isEmpty) {
        return 'Sorry, $type is required';
      } else if (value.length <= 5) {
        return 'Sorry, $type must be greater 5 characters';
      } else if (!RegExp(
        r'^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$',
      ).hasMatch(value)) {
        return 'Sorry $type must have numbers and characters';
      }
    // break;
    default:
      return 'Error';
  }
}

enum Terms { short, medium, long }

extension XTerm on Terms {
  String label() {
    switch (this) {
      case Terms.short:
        return 'short_term';
      case Terms.medium:
        return 'medium_term';
      case Terms.long:
        return 'long_term';
      default:
        return '';
    }
  }
}

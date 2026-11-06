class Currency {
  final String code;
  final String name;
  final String symbol;

  const Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}

// List of common currencies
const List<Currency> availableCurrencies = [
  Currency(code: 'USD', name: 'US Dollar', symbol: '\$'),
  Currency(code: 'EUR', name: 'Euro', symbol: '€'),
  Currency(code: 'GBP', name: 'British Pound', symbol: '£'),
  Currency(code: 'JPY', name: 'Japanese Yen', symbol: '¥'),
  Currency(code: 'AUD', name: 'Australian Dollar', symbol: 'A\$'),
  Currency(code: 'CAD', name: 'Canadian Dollar', symbol: 'C\$'),
  Currency(code: 'CHF', name: 'Swiss Franc', symbol: 'CHF'),
  Currency(code: 'CNY', name: 'Chinese Yuan', symbol: '¥'),
  Currency(code: 'INR', name: 'Indian Rupee', symbol: '₹'),
  Currency(code: 'NZD', name: 'New Zealand Dollar', symbol: 'NZ\$'),
  Currency(code: 'SEK', name: 'Swedish Krona', symbol: 'kr'),
  Currency(code: 'NOK', name: 'Norwegian Krone', symbol: 'kr'),
  Currency(code: 'MXN', name: 'Mexican Peso', symbol: 'Mex\$'),
  Currency(code: 'SGD', name: 'Singapore Dollar', symbol: 'S\$'),
  Currency(code: 'HKD', name: 'Hong Kong Dollar', symbol: 'HK\$'),
  Currency(code: 'KRW', name: 'South Korean Won', symbol: '₩'),
  Currency(code: 'BRL', name: 'Brazilian Real', symbol: 'R\$'),
  Currency(code: 'ZAR', name: 'South African Rand', symbol: 'R'),
  Currency(code: 'RUB', name: 'Russian Ruble', symbol: '₽'),
  Currency(code: 'TRY', name: 'Turkish Lira', symbol: '₺'),
  Currency(code: 'NGN', name: 'Nigerian Naira', symbol: '₦'),
];
class Currency {
  final String code;
  final String name;
  final String symbol;
  final String countryCode;

  const Currency({
    required this.code,
    required this.name,
    required this.symbol,
    required this.countryCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}

const List<Currency> availableCurrencies = [
  Currency(code: 'USD', name: 'US Dollar', symbol: '\$', countryCode: 'US'),
  Currency(code: 'EUR', name: 'Euro', symbol: '€', countryCode: 'EU'),
  Currency(code: 'GBP', name: 'British Pound', symbol: '£', countryCode: 'GB'),
  Currency(code: 'JPY', name: 'Japanese Yen', symbol: '¥', countryCode: 'JP'),
  Currency(code: 'AUD', name: 'Australian Dollar', symbol: 'A\$', countryCode: 'AU'),
  Currency(code: 'CAD', name: 'Canadian Dollar', symbol: 'C\$', countryCode: 'CA'),
  Currency(code: 'CHF', name: 'Swiss Franc', symbol: 'CHF', countryCode: 'CH'),
  Currency(code: 'CNY', name: 'Chinese Yuan', symbol: '¥', countryCode: 'CN'),
  Currency(code: 'INR', name: 'Indian Rupee', symbol: '₹', countryCode: 'IN'),
  Currency(code: 'NGN', name: 'Nigerian Naira', symbol: '₦', countryCode: 'NG'),
  Currency(code: 'NZD', name: 'New Zealand Dollar', symbol: 'NZ\$', countryCode: 'NZ'),
  Currency(code: 'SEK', name: 'Swedish Krona', symbol: 'kr', countryCode: 'SE'),
  Currency(code: 'NOK', name: 'Norwegian Krone', symbol: 'kr', countryCode: 'NO'),
  Currency(code: 'MXN', name: 'Mexican Peso', symbol: 'Mex\$', countryCode: 'MX'),
  Currency(code: 'SGD', name: 'Singapore Dollar', symbol: 'S\$', countryCode: 'SG'),
  Currency(code: 'HKD', name: 'Hong Kong Dollar', symbol: 'HK\$', countryCode: 'HK'),
  Currency(code: 'KRW', name: 'South Korean Won', symbol: '₩', countryCode: 'KR'),
  Currency(code: 'BRL', name: 'Brazilian Real', symbol: 'R\$', countryCode: 'BR'),
  Currency(code: 'ZAR', name: 'South African Rand', symbol: 'R', countryCode: 'ZA'),
  Currency(code: 'RUB', name: 'Russian Ruble', symbol: '₽', countryCode: 'RU'),
  Currency(code: 'TRY', name: 'Turkish Lira', symbol: '₺', countryCode: 'TR'),
  Currency(code: 'KWD', name: 'Kuwaiti Dinar', symbol: 'KD', countryCode: 'KW'),
];
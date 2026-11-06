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
  
  // --- Middle East ---
  Currency(code: 'AED', name: 'UAE Dirham', symbol: 'د.إ', countryCode: 'AE'),
  Currency(code: 'SAR', name: 'Saudi Riyal', symbol: 'ر.س', countryCode: 'SA'),
  Currency(code: 'QAR', name: 'Qatari Riyal', symbol: 'ر.ق', countryCode: 'QA'),
  Currency(code: 'KWD', name: 'Kuwaiti Dinar', symbol: 'د.ك', countryCode: 'KW'),
  Currency(code: 'BHD', name: 'Bahraini Dinar', symbol: '.د.ب', countryCode: 'BH'),
  Currency(code: 'OMR', name: 'Omani Rial', symbol: 'ر.ع.', countryCode: 'OM'),
  Currency(code: 'JOD', name: 'Jordanian Dinar', symbol: 'د.ا', countryCode: 'JO'),
  Currency(code: 'ILS', name: 'Israeli Shekel', symbol: '₪', countryCode: 'IL'),
  Currency(code: 'LBP', name: 'Lebanese Pound', symbol: 'ل.ل', countryCode: 'LB'),
  
  // --- Asia ---
  Currency(code: 'IDR', name: 'Indonesian Rupiah', symbol: 'Rp', countryCode: 'ID'),
  Currency(code: 'MYR', name: 'Malaysian Ringgit', symbol: 'RM', countryCode: 'MY'),
  Currency(code: 'PHP', name: 'Philippine Peso', symbol: '₱', countryCode: 'PH'),
  Currency(code: 'THB', name: 'Thai Baht', symbol: '฿', countryCode: 'TH'),
  Currency(code: 'VND', name: 'Vietnamese Dong', symbol: '₫', countryCode: 'VN'),
  Currency(code: 'PKR', name: 'Pakistani Rupee', symbol: '₨', countryCode: 'PK'),
  Currency(code: 'BDT', name: 'Bangladeshi Taka', symbol: '৳', countryCode: 'BD'),
  Currency(code: 'LKR', name: 'Sri Lankan Rupee', symbol: 'රු', countryCode: 'LK'),
  Currency(code: 'NPR', name: 'Nepalese Rupee', symbol: 'रू', countryCode: 'NP'),
  Currency(code: 'TWD', name: 'Taiwan Dollar', symbol: 'NT\$', countryCode: 'TW'),
  Currency(code: 'MOP', name: 'Macanese Pataca', symbol: 'MOP\$', countryCode: 'MO'),
  Currency(code: 'KHR', name: 'Cambodian Riel', symbol: '៛', countryCode: 'KH'),
  Currency(code: 'MMK', name: 'Myanmar Kyat', symbol: 'K', countryCode: 'MM'),
  Currency(code: 'LAK', name: 'Lao Kip', symbol: '₭', countryCode: 'LA'),
  Currency(code: 'MNT', name: 'Mongolian Tugrik', symbol: '₮', countryCode: 'MN'),
  Currency(code: 'KZT', name: 'Kazakhstani Tenge', symbol: '₸', countryCode: 'KZ'),
  Currency(code: 'UZS', name: 'Uzbekistani Som', symbol: 'so\'m', countryCode: 'UZ'),

  // --- Africa ---
  Currency(code: 'EGP', name: 'Egyptian Pound', symbol: 'E£', countryCode: 'EG'),
  Currency(code: 'KES', name: 'Kenyan Shilling', symbol: 'KSh', countryCode: 'KE'),
  Currency(code: 'GHS', name: 'Ghanaian Cedi', symbol: '₵', countryCode: 'GH'),
  Currency(code: 'MAD', name: 'Moroccan Dirham', symbol: 'د.م.', countryCode: 'MA'),
  Currency(code: 'DZD', name: 'Algerian Dinar', symbol: 'د.ج', countryCode: 'DZ'),
  Currency(code: 'TND', name: 'Tunisian Dinar', symbol: 'د.ت', countryCode: 'TN'),
  Currency(code: 'XOF', name: 'West African CFA Franc', symbol: 'CFA', countryCode: 'UN'),
  Currency(code: 'XAF', name: 'Central African CFA Franc', symbol: 'FCFA', countryCode: 'UN'),
  Currency(code: 'ETB', name: 'Ethiopian Birr', symbol: 'Br', countryCode: 'ET'),
  Currency(code: 'UGX', name: 'Ugandan Shilling', symbol: 'USh', countryCode: 'UG'),
  Currency(code: 'TZS', name: 'Tanzanian Shilling', symbol: 'TSh', countryCode: 'TZ'),
  Currency(code: 'RWF', name: 'Rwandan Franc', symbol: 'FRw', countryCode: 'RW'),
  Currency(code: 'ZMW', name: 'Zambian Kwacha', symbol: 'ZK', countryCode: 'ZM'),
  Currency(code: 'AOA', name: 'Angolan Kwanza', symbol: 'Kz', countryCode: 'AO'),
  Currency(code: 'MZN', name: 'Mozambican Metical', symbol: 'MT', countryCode: 'MZ'),

  // --- Europe ---
  Currency(code: 'PLN', name: 'Polish Zloty', symbol: 'zł', countryCode: 'PL'),
  Currency(code: 'CZK', name: 'Czech Koruna', symbol: 'Kč', countryCode: 'CZ'),
  Currency(code: 'HUF', name: 'Hungarian Forint', symbol: 'Ft', countryCode: 'HU'),
  Currency(code: 'RON', name: 'Romanian Leu', symbol: 'lei', countryCode: 'RO'),
  Currency(code: 'BGN', name: 'Bulgarian Lev', symbol: 'лв', countryCode: 'BG'),
  Currency(code: 'HRK', name: 'Croatian Kuna', symbol: 'kn', countryCode: 'HR'),
  Currency(code: 'ISK', name: 'Icelandic Krona', symbol: 'kr', countryCode: 'IS'),
  Currency(code: 'DKK', name: 'Danish Krone', symbol: 'kr', countryCode: 'DK'),
  Currency(code: 'UAH', name: 'Ukrainian Hryvnia', symbol: '₴', countryCode: 'UA'),
  Currency(code: 'RSD', name: 'Serbian Dinar', symbol: 'дин', countryCode: 'RS'),
  Currency(code: 'ALL', name: 'Albanian Lek', symbol: 'L', countryCode: 'AL'),
  Currency(code: 'MKD', name: 'Macedonian Denar', symbol: 'ден', countryCode: 'MK'),
  Currency(code: 'BAM', name: 'Bosnian Mark', symbol: 'KM', countryCode: 'BA'),

  // --- Americas ---
  Currency(code: 'ARS', name: 'Argentine Peso', symbol: '\$', countryCode: 'AR'),
  Currency(code: 'CLP', name: 'Chilean Peso', symbol: '\$', countryCode: 'CL'),
  Currency(code: 'COP', name: 'Colombian Peso', symbol: '\$', countryCode: 'CO'),
  Currency(code: 'PEN', name: 'Peruvian Sol', symbol: 'S/', countryCode: 'PE'),
  Currency(code: 'UYU', name: 'Uruguayan Peso', symbol: '\$U', countryCode: 'UY'),
  Currency(code: 'BOB', name: 'Bolivian Boliviano', symbol: 'Bs.', countryCode: 'BO'),
  Currency(code: 'PYG', name: 'Paraguayan Guarani', symbol: '₲', countryCode: 'PY'),
  Currency(code: 'VES', name: 'Venezuelan Bolívar', symbol: 'Bs.S', countryCode: 'VE'),
  Currency(code: 'CRC', name: 'Costa Rican Colon', symbol: '₡', countryCode: 'CR'),
  Currency(code: 'GTQ', name: 'Guatemalan Quetzal', symbol: 'Q', countryCode: 'GT'),
  Currency(code: 'DOP', name: 'Dominican Peso', symbol: 'RD\$', countryCode: 'DO'),
  Currency(code: 'JMD', name: 'Jamaican Dollar', symbol: 'J\$', countryCode: 'JM'),
  Currency(code: 'TTD', name: 'Trinidad Dollar', symbol: 'TT\$', countryCode: 'TT'),
  Currency(code: 'BBD', name: 'Barbadian Dollar', symbol: 'Bds\$', countryCode: 'BB'),
  
  // --- Oceania ---
  Currency(code: 'FJD', name: 'Fijian Dollar', symbol: 'FJ\$', countryCode: 'FJ'),
  Currency(code: 'PGK', name: 'Papua New Guinean Kina', symbol: 'K', countryCode: 'PG'),
];
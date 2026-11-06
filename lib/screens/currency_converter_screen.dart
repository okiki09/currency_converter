import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/currency.dart';
import '../services/currency_service.dart';
import '../theme/app_theme.dart';
import '../widgets/currency_picker_sheet.dart';
import '../widgets/currency_tile.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen>
    with SingleTickerProviderStateMixin {
  final CurrencyService _service = CurrencyService();
  final TextEditingController _amountController = TextEditingController();

  Currency _fromCurrency = availableCurrencies[0]; // USD
  Currency _toCurrency = availableCurrencies[1];   // EUR

  Map<String, dynamic>? _rates;
  bool _isLoading = false;
  String? _errorMessage;
  double? _convertedAmount;
  DateTime? _lastUpdated;

  late AnimationController _swapAnimController;

  @override
  void initState() {
    super.initState();
    _swapAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fetchRates();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _swapAnimController.dispose();
    super.dispose();
  }

  Future<void> _fetchRates() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    final rates = await _service.getExchangeRates(_fromCurrency.code);
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      if (rates != null) {
        _rates = rates;
        _lastUpdated = DateTime.now();
        _calculateConversion();
      } else {
        _errorMessage = 'Could not fetch rates. Check your connection.';
      }
    });
  }

  void _calculateConversion() {
    if (_rates == null) return;
    final rate = _rates![_toCurrency.code];
    if (rate == null) {
      setState(() => _convertedAmount = null);
      return;
    }
    
    final text = _amountController.text.trim();
    if (text.isEmpty) {
      setState(() => _convertedAmount = null);
      return;
    }

    final amount = double.tryParse(text) ?? 0;
    setState(() {
      _convertedAmount = amount * (rate as num).toDouble();
    });
  }

  void _swapCurrencies() {
    _swapAnimController.forward(from: 0);
    setState(() {
      final temp = _fromCurrency;
      _fromCurrency = _toCurrency;
      _toCurrency = temp;
    });
    _fetchRates();
  }

  Future<void> _pickCurrency({required bool isFrom}) async {
    final picked = await showModalBottomSheet<Currency>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CurrencyPickerSheet(
        title: isFrom ? 'From Currency' : 'To Currency',
        selected: isFrom ? _fromCurrency : _toCurrency,
      ),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromCurrency = picked;
        } else {
          _toCurrency = picked;
        }
      });
      isFrom ? _fetchRates() : _calculateConversion();
    }
  }

  String _formatAmount(double amount) {
    final str = amount.toStringAsFixed(2);
    final parts = str.split('.');
    final intPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '$intPart.${parts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _fetchRates,
          color: AppColors.primary,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                _buildHeader(),
                const SizedBox(height: 24),
                _buildConvertCard(),
                const SizedBox(height: 16),
                if (_lastUpdated != null) _buildLastUpdated(),
                const SizedBox(height: 24),
                _buildRateInfo(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Currency',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                height: 1.1,
              ),
            ),
            Text(
              'Converter',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                foreground: Paint()
                  ..shader = AppColors.primaryGradient
                      .createShader(const Rect.fromLTWH(0, 0, 200, 40)),
                height: 1.1,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: _isLoading ? null : _fetchRates,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.cardBg,
            foregroundColor: AppColors.primary,
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          icon: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.refresh_rounded),
        ),
      ],
    );
  }

  Widget _buildConvertCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Amount',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                _fromCurrency.symbol,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '0.00',
                    hintStyle: TextStyle(color: Colors.white54),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d{0,4}'),
                    ),
                  ],
                  onChanged: (_) => _calculateConversion(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  child: Text(
                    _fromCurrency.symbol,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _fromCurrency.code,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        _fromCurrency.name,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => _pickCurrency(isFrom: true),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Change'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastUpdated() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.access_time, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Text(
          'Updated ${_timeAgo(_lastUpdated!)}',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  String _timeAgo(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  Widget _buildRateInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Convert to',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          CurrencyTile(
            label: 'To',
            currency: _toCurrency,
            onTap: () => _pickCurrency(isFrom: false),
          ),
          const SizedBox(height: 16),
          Center(
            child: AnimatedBuilder(
              animation: _swapAnimController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _swapAnimController.value * 3.14159,
                  child: child,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.35),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: _swapCurrencies,
                  icon: const Icon(Icons.swap_vert_rounded),
                  color: Colors.white,
                  iconSize: 26,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildResultArea(),
        ],
      ),
    );
  }

  Widget _buildResultArea() {
    if (_isLoading && _convertedAmount == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (_errorMessage != null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.error_outline,
                    color: AppColors.error, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: AppColors.error,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _fetchRates,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }
    if (_convertedAmount == null) {
      return const SizedBox.shrink();
    }
    
    // 👇 THIS IS THE FIXED RESULT BOX 👇
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardBg, // Dark background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)), // Teal border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_amountController.text.isEmpty ? "0" : _amountController.text} ${_fromCurrency.code} equals',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
            child: Text(
              '${_toCurrency.symbol}${_formatAmount(_convertedAmount!)}',
              key: ValueKey(_convertedAmount),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary, // White text on dark background
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '1 ${_fromCurrency.code} = ${_rates != null && _rates![_toCurrency.code] != null ? (_rates![_toCurrency.code] as num).toStringAsFixed(4) : "—"} ${_toCurrency.code}',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
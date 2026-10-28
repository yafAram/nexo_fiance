
import 'package:flutter/material.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({
    super.key,
    required this.balance,
    required this.currency,
    this.initiallyVisible = false,
  });

  final double balance;
  final String currency;
  final bool initiallyVisible;

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  late bool _isBalanceVisible;

  static const Color _primaryColor = Color(0xFF176B4D);
  static const Color _secondaryColor = Color(0xFFDCEFE4);

  @override
  void initState() {
    super.initState();
    _isBalanceVisible = widget.initiallyVisible;
  }

  String _formatBalance(double amount) {
    final parts = amount.abs().toStringAsFixed(2).split('.');
    final wholePart = parts[0];

    final formattedWhole = wholePart.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );

    final sign = amount < 0 ? '-' : '';

    return '$sign$formattedWhole.${parts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _primaryColor.withOpacity(0.16),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Balance disponible',
                  style: TextStyle(
                    color: _secondaryColor,
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                tooltip: _isBalanceVisible
                    ? 'Ocultar balance'
                    : 'Mostrar balance',
                onPressed: () {
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
                icon: Icon(
                  _isBalanceVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Text(
              _isBalanceVisible
                  ? '\$${_formatBalance(widget.balance)}'
                  : '••••••••',
              key: ValueKey(_isBalanceVisible),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$currencyLabel · Datos simulados',
            style: const TextStyle(
              color: _secondaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String get currencyLabel => widget.currency;
}

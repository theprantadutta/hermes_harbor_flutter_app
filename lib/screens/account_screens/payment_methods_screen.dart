import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/accounts/account_screens_app_bar.dart';
import '../../components/layouts/main_layout.dart';

class PaymentMethodsScreen extends StatefulWidget {
  static const kRouteName = '/payment-methods';
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  PaymentMethod? _selectedMethod;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _cardNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: CustomScrollView(
        slivers: [
          AccountScreensAppBar(title: 'Payment Methods'),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSavedMethodsSection(context),
                const SizedBox(height: 24),
                _buildAddNewMethodSection(context),
                const SizedBox(height: 24),
                if (_selectedMethod == PaymentMethod.creditCard)
                  _buildCreditCardForm(context),
                const SizedBox(height: 40),
                _buildSaveButton(context),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedMethodsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SAVED METHODS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).hintColor,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.blue),
                title: const Text('•••• •••• •••• 4242'),
                subtitle: const Text('Visa - Expires 04/25'),
                trailing: Radio<PaymentMethod>(
                  value: PaymentMethod.creditCard,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _selectedMethod = PaymentMethod.creditCard;
                  });
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.paypal, color: Colors.blue),
                title: const Text('user@example.com'),
                subtitle: const Text('PayPal'),
                trailing: Radio<PaymentMethod>(
                  value: PaymentMethod.paypal,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _selectedMethod = PaymentMethod.paypal;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddNewMethodSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ADD NEW METHOD',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).hintColor,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading:
                    const Icon(Icons.add_circle_outline, color: Colors.green),
                title: const Text('Add Credit Card'),
                trailing: Radio<PaymentMethod>(
                  value: PaymentMethod.newCreditCard,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _selectedMethod = PaymentMethod.newCreditCard;
                  });
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.apple, color: Colors.black),
                title: const Text('Apple Pay'),
                trailing: Radio<PaymentMethod>(
                  value: PaymentMethod.applePay,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _selectedMethod = PaymentMethod.applePay;
                  });
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet,
                    color: Colors.purple),
                title: const Text('Google Pay'),
                trailing: Radio<PaymentMethod>(
                  value: PaymentMethod.googlePay,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _selectedMethod = PaymentMethod.googlePay;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCreditCardForm(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card Number',
                prefixIcon: const Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter(),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _expiryController,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: 'MM/YY',
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      CardExpiryInputFormatter(),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _cvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _cardNameController,
              decoration: InputDecoration(
                labelText: 'Cardholder Name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Save payment method logic
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'SAVE PAYMENT METHOD',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

enum PaymentMethod {
  creditCard,
  paypal,
  newCreditCard,
  applePay,
  googlePay,
}

// Custom input formatters
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Add a space after every 4 characters
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/'); // Add a slash after MM
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

//
// @author: Giovanni Gomez Restrepo //
// @github: giovagr20

import 'package:flutter/material.dart';
import 'package:currency_formatter/currency_formatter.dart';

void main() {
  runApp(const MoneyCurrency());
}

class MoneyCurrency extends StatelessWidget {
  const MoneyCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Currency money',
        theme: ThemeData.dark(),
        home: const CurrencyPage(title: 'Currency money'));
  }
}

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key, required this.title});

  final String title;

  @override
  State createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final _value = TextEditingController();
  Currency? _currency = Currency.USD;
  String _result = '';
  String _amount = '';

  void _calculateCurrencyExchange() {
    setState(() {
      switch (_currency) {
        case Currency.USD:
          {
            CurrencyFormat usdSettings = const CurrencyFormat(
              symbol: 'USD',
              symbolSide: SymbolSide.left,
              thousandSeparator: '.',
              decimalSeparator: ',',
              symbolSeparator: ' ',
            );
            _amount = CurrencyFormatter.format(
                double.parse(_value.text) * 4000, usdSettings);
            _result = 'You current currency is $_currency '
                'and the amount is $_amount';
            break;
          }
        case Currency.GBP:
          {
            CurrencyFormat gbpSettings = const CurrencyFormat(
              symbol: '£',
              symbolSide: SymbolSide.left,
              thousandSeparator: '.',
              decimalSeparator: ',',
              symbolSeparator: ' ',
            );
            _amount = CurrencyFormatter.format(
                double.parse(_value.text) * 5100, gbpSettings);
            _result = 'You current currency is $_currency '
                'and the amount is $_amount';
            break;
          }
        case Currency.EUR:
          {
            CurrencyFormat euroSettings = const CurrencyFormat(
              symbol: '€',
              symbolSide: SymbolSide.left,
              thousandSeparator: '.',
              decimalSeparator: ',',
              symbolSeparator: ' ',
            );
            _amount = CurrencyFormatter.format(
                double.parse(_value.text) * 4500, euroSettings);
            _result = 'You current currency is $_currency '
                'and the amount is $_amount';
            break;
          }
        default:
          {
            _amount = '0';
            _result = "You must select one currency exchange";
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Center(
            child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _value,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Value in COP',
                    hoverColor: Colors.amber),
              ),
              const SizedBox(
                height: 10.0,
              ),
              RadioListTile<Currency>(
                  title: const Text('USD'),
                  value: Currency.USD,
                  groupValue: _currency,
                  onChanged: (Currency? actualCurrency) {
                    setState(() {
                      _currency = actualCurrency;
                    });
                  }),
              RadioListTile<Currency>(
                  title: const Text('EUR'),
                  value: Currency.EUR,
                  groupValue: _currency,
                  onChanged: (Currency? actualCurrency) {
                    setState(() {
                      _currency = actualCurrency;
                    });
                  }),
              RadioListTile<Currency>(
                  title: const Text('GBP'),
                  value: Currency.GBP,
                  groupValue: _currency,
                  onChanged: (Currency? actualCurrency) {
                    setState(() {
                      _currency = actualCurrency;
                    });
                  }),
              const SizedBox(height: 30.0),
              OutlinedButton.icon(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.amber,
                ),
                icon: const Icon(Icons.currency_exchange,
                    size: 30, color: Colors.black),
                label: const Text("Converse",
                    style: TextStyle(color: Colors.black)),
                onPressed: () {
                  _calculateCurrencyExchange();
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

enum Currency { USD, EUR, GBP }

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  bool isLightTheme = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;

  // nút thanh toán
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //chỉ hiển thị dialog nếu biểu mẫu hợp lệ
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Xác nhận thanh toán"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Số thẻ: $cardNumber"),
                Text("Ngày hết hạn: $expiryDate"),
                Text("Tên chủ thẻ: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            //nút hủy
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Hủy"),
            ),

            //nút đồng ý
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  ),
                );
              },
              child: const Text("Đồng ý"),
            )
          ],
        ),
      );
    }
  }

  Glassmorphism? _getGlassmorphismConfig() {
  if (!useGlassMorphism) {
    return null;
  }

  return Glassmorphism(
    blurX: 0.0, // Không làm mờ
    blurY: 0.0, // Không làm mờ
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[const Color.fromARGB(255, 24, 19, 165)],
      stops: const <double>[0], 
    ),
  );
}


  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
      userTappedPay();
    } else {
      print('invalid!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Thanh toán"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () => setState(() {
                      isLightTheme = !isLightTheme;
                    }),
                    icon: Icon(
                      isLightTheme ? Icons.light_mode : Icons.dark_mode,
                    ),
                  ),
                  CreditCardWidget(
                    enableFloatingCard: useFloatingAnimation,
                    glassmorphismConfig: _getGlassmorphismConfig(),
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'HC Bank',
                    frontCardBorder: useGlassMorphism
                        ? null
                        : Border.all(color: Colors.grey),
                    backCardBorder: useGlassMorphism
                        ? null
                        : Border.all(color: Colors.grey),
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: useGlassMorphism
                        ? Colors.blue
                        : isLightTheme
                            ? Colors.white
                            : Colors.black,
                    backgroundImage: useBackgroundImage ? null : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: cardNumber,
                            cvvCode: cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            cardHolderName: cardHolderName,
                            expiryDate: expiryDate,
                            inputConfiguration: const InputConfiguration(
                              cardNumberDecoration: InputDecoration(
                                labelText: 'Số thẻ',
                                hintText: 'XXXX XXXX XXXX XXXX',
                              ),
                              expiryDateDecoration: InputDecoration(
                                labelText: 'Ngày hết hạn',
                                hintText: 'XX/XX',
                              ),
                              cvvCodeDecoration: InputDecoration(
                                labelText: 'CVV',
                                hintText: 'XXX',
                              ),
                              cardHolderDecoration: InputDecoration(
                                labelText: 'Tên chủ thẻ',
                              ),
                            ),
                            onCreditCardModelChange: onCreditCardModelChange,
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(useGlassMorphism ? 'Màu xanh' : 'Màu đen'),
                                const Spacer(),
                                Switch(
                                  value: useGlassMorphism,
                                  inactiveTrackColor: Colors.grey,
                                  activeColor: Colors.white,
                                  activeTrackColor:
                                      const Color.fromARGB(255, 50, 69, 139),
                                  onChanged: (bool value) => setState(() {
                                    useGlassMorphism = value;
                                  }),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: _onValidate,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFFB58D67),
                                    Color(0xFFE5D1B2),
                                    Color(0xFFF9EED2),
                                    Color(0xFFEFEFED),
                                    Color(0xFFF9EED2),
                                    Color(0xFFB58D67),
                                  ],
                                  begin: Alignment(-1, -4),
                                  end: Alignment(1, 4),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              child: const Text(
                                'Thanh toán',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'halter',
                                  fontSize: 14,
                                  package: 'flutter_credit_card',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

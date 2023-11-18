import 'package:wallet_p2p/utils/extensions/type_extensions.dart';

class CryptoModel extends DefaultModel<CryptoModel> {
  CryptoModel({
    this.icon,
    required this.coin,
    required this.name,
    required this.amount,
  });

  final String? icon;
  final String coin;
  final String name;
  final double amount;

  @override
  Iterable get values => toJson().values;

  @override
  CryptoModel copyWith({
    String? icon,
    String? coin,
    String? name,
    double? amount,
  }) =>
      CryptoModel(
        icon: icon ?? this.icon,
        coin: coin ?? this.coin,
        name: name ?? this.name,
        amount: amount ?? this.amount,
      );

  @override
  Map<String, dynamic> toJson() => {
        "icon": icon,
        "coin": coin,
        "name": name,
        "amount": amount,
      };
}

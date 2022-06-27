import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/order/models/order_empty_notify_model.dart';

class OrderEmptyView extends StatefulWidget {

  const OrderEmptyView({Key? key, this.item}) : super(key: key);
  final OrderEmptyNotifyModel? item;

  @override
  State<OrderEmptyView> createState() => _OrderEmptyViewState();
}

class _OrderEmptyViewState extends State<OrderEmptyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildView(widget.item!.urlImage!, widget.item!.title!, widget.item!.subtitle!),
    );
  }

  Widget _buildView(String urlImage, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    urlImage,
                  ),
                  fit: BoxFit.fill
              )
          ),
        ),
        // SizedBox(height: 10),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

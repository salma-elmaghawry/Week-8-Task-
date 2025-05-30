import 'package:flutter/material.dart';
import 'package:week8/core/app_colors.dart';

class MeasurementWidget extends StatefulWidget {
  final String title;
  final String unit;
  final int initialValue;

  const MeasurementWidget({
    required this.title,
    required this.unit,
    required this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  _MeasurementWidgetState createState() => _MeasurementWidgetState();
}

class _MeasurementWidgetState extends State<MeasurementWidget> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _increment() {
    setState(() {
      _value++;
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 0) _value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary.withOpacity(0.2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: _decrement,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primary.withOpacity(0.3),
                ),
              ),
              SizedBox(width: 12),
              Text(
                _value.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 12),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _increment,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primary.withOpacity(0.3),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            widget.unit,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

import 'search_text_form_field.dart';
import 'package:flutter/material.dart';

import '../const/data.dart';

class SendTextItem extends StatelessWidget {
  final Function(String message) onSubmitted;
  const SendTextItem({
    super.key,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {

    final focusNode = FocusNode();
    final textEditingController = TextEditingController();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: DEFAULT_WIDGET_PADDING, vertical: 8.0),
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: SearchTextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              hintText: '메시지를 입력하세요',
              onSubmitted: (message) {
                _sendMessage(textEditingController);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              _sendMessage(textEditingController);
              focusNode.unfocus();
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage(TextEditingController controller) async{
    onSubmitted(controller.text);
    controller.text = '';
  }
}

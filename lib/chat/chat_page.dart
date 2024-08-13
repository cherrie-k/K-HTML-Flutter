import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:k_html_flutter/global/widgets/custom_appbar.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  void _sendMessage(String message) async {
    String time = formatCurrentTime();
    setState(() {
      _messages.add({
        'sender': 'user',
        'message': message,
        'time': time,
      });
      _isLoading = true;
    });
    _controller.clear();

    // Add loading indicator message
    setState(() {
      _messages.add({
        'sender': 'bot',
        'message': 'loading',
        'time': time,
      });
    });

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/generate-text'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'prompt': message}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          _messages.removeLast(); // Remove the loading indicator message
          _messages.add({
            'sender': 'bot',
            'message': responseData['response'],
            'time': formatCurrentTime(),
          });
          _isLoading = false;
        });
      } else {
        setState(() {
          _messages.removeLast(); // Remove the loading indicator message
          _messages.add({
            'sender': 'bot',
            'message': 'Failed to get response from server.',
            'time': formatCurrentTime(),
          });
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _messages.removeLast(); // Remove the loading indicator message
        _messages.add({
          'sender': 'bot',
          'message': 'An error occurred: $error',
          'time': formatCurrentTime(),
        });
        _isLoading = false;
      });
    }
  }

  // void _sendDummyMessage(String message) async {
  //   String time = _formatCurrentTime();
  //   setState(() {
  //     _messages.add({'sender': 'user', 'message': message, 'time': time});
  //     _isLoading = true;
  //   });
  //   _controller.clear();

  //   // Add a temporary placeholder for the loading indicator
  //   setState(() {
  //     _messages.add({'sender': 'bot', 'message': 'loading', 'time': time});
  //   });

  //   // Simulate a delay for the dummy function
  //   await Future.delayed(Duration(seconds: 2));
  //   String response = _dummyServerResponse(message);

  //   setState(() {
  //     _messages.removeLast(); // Remove the loading indicator
  //     _messages.add(
  //         {'sender': 'bot', 'message': response, 'time': _formatCurrentTime()});
  //     _isLoading = false;
  //   });
  // }

  // String _dummyServerResponse(String prompt) {
  //   return 'This is a dummy response to "$prompt".';
  // }

  String formatCurrentTime() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  Widget _buildMessage(Map<String, String> message) {
    bool isUserMessage = message['sender'] == 'user';
    bool isLoadingMessage = message['message'] == 'loading';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUserMessage) ...[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          SizedBox(width: 12),
        ],
        isUserMessage ? SizedBox(width: 52) : SizedBox.shrink(),
        Expanded(
          child: Column(
            crossAxisAlignment: isUserMessage
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: isUserMessage ? Color(0xFF6FC295) : Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(!isUserMessage ? 0 : 14),
                    topRight: Radius.circular(14),
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(isUserMessage ? 0 : 14),
                  ),
                ),
                child: isLoadingMessage
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF6FC295),
                        ),
                        // child: Image.asset(
                        //   'assets/icons/loading.gif',
                        //   height: 90,
                        // ),
                      )
                    : Text(
                        message['message']!,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: isUserMessage ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
              ),
              Row(
                mainAxisAlignment: isUserMessage
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  !isUserMessage ? SizedBox(width: 10) : SizedBox.shrink(),
                  Text(
                    message['time']!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  isUserMessage ? SizedBox(width: 6) : SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
        !isUserMessage ? SizedBox(width: 52) : SizedBox.shrink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context: context,
        title: '소각이',
        showAction: true,
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // _dateBlock(),
                const SizedBox(height: 2),
                Expanded(
                  child: ListView.builder(
                    itemCount: _messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _dateBlock();
                      }
                      return _buildMessage(_messages[index - 1]);
                    },
                  ),
                ),
                const SizedBox(height: 82),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border(
                  top: BorderSide(
                    color: Color(0XFFF2F2F2),
                    width: 1.5,
                  ),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 16, 14, 38),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFF6F6F6),
                        filled: true,
                        hintText: ' 궁금한 사항을 입력해 주세요',
                        hintStyle: TextStyle(color: Color(0xFF9F9F9F)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(99),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      cursorColor: Color(0xFF959595),
                      style: TextStyle(
                        color: Color(
                          0xFF000000,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (_controller.text.isNotEmpty) {
                        _sendMessage(_controller.text);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 10, 4, 10),
                      child: Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _dateBlock() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 52,
          vertical: 8,
        ),
        margin: EdgeInsets.only(top: 22, bottom: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text('2024. 8. 14 (수)'),
      ),
    );
  }
}

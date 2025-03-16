import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [];
  final TextEditingController _controller = TextEditingController();
  bool isButtonEnabled = false;
  String pfp_path = 'assets/images/pfp.png';
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear();
        isButtonEnabled = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      setState(() {
        isButtonEnabled = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tom Hanks",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Active",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                  ),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Text(
                  "This conversation is private",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    // height: double.infinity,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt,
                          color: Colors.blue,
                        ),
                        Text(
                          "Add bots",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    // radius: 20,
                    foregroundImage: AssetImage(pfp_path),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // margin: EdgeInsets.symmetric(vertical: 5),
                      // decoration: BoxDecoration(
                      //   // color: Colors.grey[200],
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      child: Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            child: CircleAvatar(
                              // radius: 20,
                              foregroundImage: AssetImage(pfp_path),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tom Hanks"),
                              Text(messages[index]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.image_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_to_drive),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.videocam_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today_rounded),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: isButtonEnabled ? Colors.blue : Colors.grey,
                  ),
                  onPressed: isButtonEnabled ? _sendMessage : null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

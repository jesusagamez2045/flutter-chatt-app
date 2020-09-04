import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatt_app/widgets/chatt_message.dart';


class ChattPage extends StatefulWidget {

  @override
  _ChattPageState createState() => _ChattPageState();
}

class _ChattPageState extends State<ChattPage> with TickerProviderStateMixin{

  final TextEditingController _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChattMessage> _messages = [];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox(height: 3,),
            Text(
              'Jesus agamez', 
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1,),
            Container(
              color: Colors.white,
              child: _inputChatt(),
            )
          ],          
        ),
      ),
    );
  }

  Widget _inputChatt(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSumbit,
                onChanged: (String text){
                  setState(() {
                    if(text.trim().length > 0){
                      _estaEscribiendo = true;
                    }else{
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
              ? CupertinoButton(
                child: Text('Enviar'),
                onPressed: _estaEscribiendo 
                ? () => _handleSumbit(_textController.text.trim()) 
                : null,
              )
              : Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.blue[400]
                  ),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.send),
                    onPressed: _estaEscribiendo 
                    ? () => _handleSumbit(_textController.text.trim()) 
                    : null,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _handleSumbit(String texto){

    if(texto.length == 0) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChattMessage(
      uid: '123', 
      texto: texto,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200)
      ),
    );

    newMessage.animationController.forward();

    _messages.insert(0, newMessage);

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() { 
    for(ChattMessage message in _messages){
      message.animationController.dispose();
    }
    super.dispose();
  }
}
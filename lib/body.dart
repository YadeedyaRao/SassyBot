import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'http_service.dart';
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  TextEditingController nameController = TextEditingController();
  final ScrollController _controller = ScrollController();
  List <Widget> a = [];
  void _ourEnd(){
    setState((){
      a.add(
        Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left:50.0),
                decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0))
                ),
                child: Padding(
                  padding:  const EdgeInsets.all(10.0),
                  child:  Text(nameController.text.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<String> _apiCall(){
    HttpService httpService = HttpService(nameController.text.toString());
    return httpService.getChatBotReply();
  }

  void _botEnd(){
    setState((){
      a.add(
        FutureBuilder(
            future: _apiCall(),
            builder: (BuildContext context , AsyncSnapshot<String> snapshot){
              if(snapshot.hasData){
                String? bot = snapshot.data;
                return Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right:50.0),
                        decoration:const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0))
                        ),
                        child: Padding(
                          padding:  const EdgeInsets.all(10.0),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Sassy Bot',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueAccent,
                              ),
                              ),
                              Text(bot!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                );
              }

              return Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right:50.0),
                      decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0))
                      ),
                      child: SizedBox(
                        width: 80.0,
                        height: 50.0,
                        child: Center(
                          child: LoadingAnimationWidget.waveDots(
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              );
            }
        )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex:8,
            child:ListView.builder(
              controller: _controller,
                itemCount: a.length,
                itemBuilder: (context, index) {
                  return a[index];
                }),
        ),
        Expanded(
          flex:1,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex:5,
                  child: TextField(
                            controller: nameController,
                            onTap:() {
                            final FocusScopeNode currentScope = FocusScope.of(context);
                            if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                            FocusManager.instance.primaryFocus?.unfocus();
                              }
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.all(Radius.elliptical(50, 50))
                              ),
                              hintText: 'Message',
                            ),
                      ),
                ),
                Expanded(
                  flex:1,
                  child: SizedBox(
                    height: 60.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.green,
                        onSurface: Colors.white,
                      ),
                      onPressed: (){
                        if(nameController.text != ''){
                          _ourEnd();
                          _botEnd();
                          nameController.text='';
                        }
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          _controller.animateTo(
                            _controller.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        });
                      },
                      child: const Icon(
                        Icons.send,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
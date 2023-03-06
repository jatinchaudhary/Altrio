import 'package:altrio/repository.dart';
import 'package:altrio/request_model.dart';
import 'package:altrio/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  TextEditingController textEditingController = TextEditingController();

  List<String> data = [];

  bool showLoading = false;


  Future<void> makeApiCall() async {

    ApiClient apiClient =  ApiClient(Dio());

    setState(() {
      showLoading == true;

      showDialog(context: context, builder:(ctx){
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(

           
          color: Colors.transparent,



          child: Lottie.asset('assets/animation/loading_animation.json'),),
        );

      },
      barrierDismissible: false);

    });


    try{
     ResponseModel value =  await apiClient.postCompleted('Bearer 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',
        RequestModel(
            "text-davinci-003",
            textEditingController.text ,
            0,
            1000)).then((ResponseModel value){

              showLoading = false;

              Navigator.of(context).pop();

              data.add(textEditingController.text);
              data.add(value.choices[0].text);

              textEditingController.clear();
              setState(() {

              });
              return value;
     }
     );}catch(_){
      showLoading = false;

      Navigator.of(context).pop();

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Align(
          alignment: Alignment.centerLeft,
            child: Text('  Altrio.ai',)),
        titleTextStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
        ),
        backgroundColor: Colors.black,
        elevation: 20,
        shadowColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.8)
            ]
          )
        ),
        child: Stack(
          children: [

            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: ListView.separated(
                  itemBuilder: (ctx,index){
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        Icon(

                          index%2==1? Icons.arrow_forward_rounded:Icons.data_object ,

                          color: Colors.white,
                        ),
                        SizedBox(width: 5,),
                        Flexible(
                          child: Container(
                            
                            padding : EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index%2==0?  Colors.black.withOpacity(0.5) : Colors.green.withOpacity(0.9),
                            ),

                            child:SelectableText(
                              index%2==0? data[index] :
                              data[index].substring(2),
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context,i){return SizedBox(height: 30,);},
                  itemCount: data.length),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
              // height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.withOpacity(0.2),
                border: Border.all(color: Colors.green)
              ),
              child: Row(
                children:  [
                  SizedBox(width: 10,),
                  Icon(Icons.screen_search_desktop_rounded,color: Colors.white.withOpacity(0.9),),
                  SizedBox(width: 10,),
                  SizedBox(width: 250,
                    child: TextField(
                      controller: textEditingController,
                      cursorColor: Colors.white,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.6)
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ask me out anything . . .',
                        hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.6)
                          ),

                      ),
                    ),
                  ),

                  // Text('    Ask me out anything ... ',
                  // style: TextStyle(
                  //   fontFamily: 'Poppins',
                  //   fontSize: 14,
                  //   color: Colors.white.withOpacity(0.6)
                  // ),),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                      makeApiCall();
                      //textEditingController.clear();
                    },
                      child: Container(child: Icon(Icons.send_rounded,color: Colors.white.withOpacity(0.9), ))),
                SizedBox(width: 10,)],
              ),
          ),
            )],
        )
      ),
    );
  }
}

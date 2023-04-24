import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


Widget buildArticleeItem (article)=>       Scaffold( appBar: AppBar(title: const Text(
  'News App ',),
  actions:  [
    IconButton(onPressed:(){}, icon: const Icon(Icons.search))
  ],),

  body: Row
    (
    children:  [
      Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),fit: BoxFit.cover
            )
        ),
      ),
      const SizedBox(width: 10,),
      Expanded(
        child: Container(height: 120,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [Expanded(
                child: Text('${article['title']}',style: (const TextStyle(fontSize: 10,fontWeight: FontWeight.bold

                  ,  )
                ),maxLines: 3,overflow: TextOverflow.ellipsis,),
              ),

                Text('${article['publishedAt']}',style: (const TextStyle(color: Colors.grey)),)


                ,
              ]  ),
        ),
      )

    ],
  ),
);
void navigateTo(context,Widget){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>Widget));
}
Widget? defaultTextFormField({required TextEditingController controller,required TextInputType type,
 Function? onSubmit,  Function? onChange, Function? onTap,
required Function validate,
required String label,  IconData? prefix, IconData? suffix, Function? suffixPressed,
bool isClickable=true})=>TextFormField(controller: controller,keyboardType: type,enabled: isClickable,onChanged:(s){ onChange!();},onTap: (){onTap!();},
onFieldSubmitted:(s){onSubmit!();}
,validator: (s){validate();},
decoration: InputDecoration(labelText: label,
prefixIcon: Icon(prefix),));
//suffixIcon: Icon(suffix!=null?
   // IconButton(onPressed:(){suffixPressed!();}, icon: Icon(suffix)):null,
//border:OutlineInputBorder())
//)


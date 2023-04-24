import 'dart:js';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_one/servies/cubit/cubit_state.dart';
import 'package:pro_one/servies/cubit/news_cubit.dart';

import '../../controls/componant/news_componant.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
var searchController=TextEditingController();
var List=NewsCubit.get(context).Search;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsState>(listener: (context,state){},builder: (context,state) {
      return Scaffold(appBar: AppBar(

      ),
          body: Column(children: [Padding(padding: EdgeInsets.all(20),
              child:
            defaultTextFormField  (controller: searchController,
                type: TextInputType.text,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'search must not be empty';
                  }
                  return null;
                },
                onChange: (value) {
                NewsCubit.get(context).getSearchMethod(value);
                },
                label: 'search',
              )),
      ConditionalBuilder(condition: List.length>0,
      builder: (context) => ListView.separated(physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleeItem(List[index]),
      separatorBuilder: ( context, int index) =>
      Container( width: double.infinity,height: 1,),
      itemCount: 10,),
      fallback: (context) => const Center(
      child: CircularProgressIndicator()))]));

    });
        }

  }


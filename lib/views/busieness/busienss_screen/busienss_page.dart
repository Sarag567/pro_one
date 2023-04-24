import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_one/controls/componant/news_componant.dart';
import 'package:pro_one/servies/cubit/cubit_state.dart';
import 'package:pro_one/servies/cubit/news_cubit.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext context, state) {}, builder: (context, state) {
          var List =NewsCubit.get(context).business;
      return
        ConditionalBuilder(condition: List.length>0,
            builder: (context) => ListView.separated(physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleeItem(List[index]),
              separatorBuilder: ( context, int index) =>
               Container( width: double.infinity,height: 1,),
              itemCount: 10,),
            fallback: (context) => const Center(
                child: CircularProgressIndicator()));
    });
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controls/componant/news_componant.dart';
import '../../../servies/cubit/cubit_state.dart';
import '../../../servies/cubit/news_cubit.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: ( context, state) {}, builder: (context, state) {
      var List =NewsCubit.get(context).sports;
      return
        ConditionalBuilder(condition: List.length>0,
            builder: (context) => ListView.separated(physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleeItem(List[index]),
              separatorBuilder: ( context, int index) =>
               Container(color: Colors.black87, height: 1,width:double.infinity,),
              itemCount: 10,),
            fallback: (context) => const Center(
                child: CircularProgressIndicator()));
    });
  }
}

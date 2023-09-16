import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/view/home_views/search_view/search_operation.dart';
import 'package:messagefast/view/home_views/search_view/widgets/search_list_tile.dart';
import 'package:messagefast/widgets/search_text_field/search_text_field.dart';


@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}

class SearchViewBody extends ConsumerStatefulWidget {
  SearchViewBody({
    super.key,
  });

  @override
  _SearchViewBodyState createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends ConsumerState<SearchViewBody> with SearchOperation {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customInitelize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    customDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextField(
          controller: searchController,
          onChange: onNickNameChange,
        ),
        SingleChildScrollView(
          child: ValueListenableBuilder<String>(
            valueListenable: currentSearch,
            builder: (context, value, child) {
              return FutureBuilder(
              future: getUserByName(),
              builder:(context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator.adaptive();
                  }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Widget> widgets = [];
                      for (var element in snapshot.data!.keys) {
                        widgets.add(SearchListTile(name: snapshot.data![element]["userName"], imageURL: snapshot.data![element]["profilePictureURL"], ref: ref, uId: element,));
                      }
                      return Column(
                        children: widgets,
                      );
                    }
                }
                return const Text("error");
              },
            );
            },
          ),
        ),
      ],
    );
  }
}

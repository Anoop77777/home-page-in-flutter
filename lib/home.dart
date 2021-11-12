import 'package:backb/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    BlocProvider.of<HomeBloc>(context).add(GetHomeData());
                  }
                  if (state is HomeLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is HomeError) {
                    return Center(child: Text(state.errorMessage));
                  }
                  if (state is HomeLoaded) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.model.data.restaurant.length,
                        itemBuilder: (context, index) {
                          return Container(
                            //width: 160,

                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(0, 0),
                                      blurRadius: 3)
                                ]),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "https://fuddo-development.s3.ap-south-1.amazonaws.com/" +
                                        state.model.data.restaurant[index]
                                            .storeBg,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    height: 130,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 170,
                                            child: Text(
                                                state.model.data
                                                    .restaurant[index].name,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Container(
                                            width: 80,
                                            height: 24,
                                            alignment: Alignment.center,
                                            child: Text(
                                              state.model.data.restaurant[index]
                                                  .cuisine,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Text(
                                              state.model.data.restaurant[index]
                                                  .location.address,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                              overflow: TextOverflow.ellipsis)),
                                      Row(
                                        children: [
                                          Text(
                                              "Rs" +
                                                  state
                                                      .model
                                                      .data
                                                      .restaurant[index]
                                                      .avgPersonAmt
                                                      .toString() +
                                                  " For two",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

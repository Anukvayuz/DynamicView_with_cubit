import 'package:dynamic_ui_cubit/logics/main_screen/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logics/main_screen/post_state.dart';

class MainScreen extends StatefulWidget {
  final String firstInput;
  final String secondInput;
  const MainScreen(
      {super.key, required this.firstInput, required this.secondInput});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _firstInputController = TextEditingController();

  final TextEditingController _secondInputController = TextEditingController();

  bool isSwitched = false;

  @override
  void initState() {
    _firstInputController.text = widget.firstInput;
    _secondInputController.text = widget.secondInput;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 153, 163, 201),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Main Screen",
          style: TextStyle(
              color: Color.fromARGB(255, 5, 59, 103),
              fontSize: 18.9,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _firstInputController,
              decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  labelText: _firstInputController.text,
                  labelStyle: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _secondInputController,
              decoration: InputDecoration(
                  hintText: 'Enter Your Hobby',
                  labelText: _secondInputController.text,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
            Row(
              children: [
                BlocBuilder<PostCubit, PostState>(builder: (context, state) {
                  if (state is PostLoadedState) {
                    return Text(
                      "${state.toggle}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    );
                  } else {
                    return const Text(
                      "error",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    );
                  }
                }),
                const Spacer(),
                BlocBuilder<PostCubit, PostState>(builder: (context, state) {
                  if (state is PostLoadedState) {
                    return Switch(
                        value: state.toggle,
                        onChanged: (value) {
                          context.read<PostCubit>().setToggle();
                        });
                  } else {
                    return Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          context.read<PostCubit>().setToggle();
                        });
                  }
                }),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                BlocBuilder<PostCubit, PostState>(builder: (context, state) {
                  if (state is PostLoadedState) {
                    return Text(
                      "${state.toggle2}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    );
                  } else {
                    return const Text(
                      "error",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    );
                  }
                }),
                const Spacer(),
                BlocBuilder<PostCubit, PostState>(builder: (context, state) {
                  if (state is PostLoadedState) {
                    return Switch(
                        value: state.toggle2,
                        onChanged: (value) {
                          context.read<PostCubit>().setToggle();
                        });
                  } else {
                    return Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          context.read<PostCubit>().setToggle();
                        });
                  }
                }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child:
                  BlocBuilder<PostCubit, PostState>(builder: (context, state) {
                if (state is PostInitialState) {
                  return const Center(
                    child: Text("press button to fetch data"),
                  );
                }

                if (state is PostLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is PostLoadedState) {
                  return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: ListTile(
                            // leading: CircleAvatar(backgroundColor: Colors.amber,
                            // Text() ),
                            title: Text(state.posts[index].title.toString()),
                            subtitle: Text(state.posts[index].body.toString()),
                          ),
                        );
                      });
                } else if (state is PostErrorState) {
                  return const Text("Error");
                }
                return const Center(
                  child: Text("Error"),
                );
              }),
            ),
            Positioned(
                bottom: 40.0,
                height: 20.0,
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<PostCubit>().fetchPosts();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>  ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 44, 97, 157),
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 5,
                      ),
                      child: const Text("Click here ")),
                )),
          ],
        ),
      ),
    );
  }
}

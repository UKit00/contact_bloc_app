import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:contacts_bloc_app/bloc/contacts.state.dart';
import 'package:contacts_bloc_app/bloc/message/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/message/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/repositories/contact.repo.dart';
import 'package:contacts_bloc_app/repositories/message.repo.dart';
import 'package:contacts_bloc_app/ui/pages/contacts/contact.page.dart';
import 'package:contacts_bloc_app/ui/pages/messages/message.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  GetIt.instance.registerLazySingleton(() => new MessageRepository());
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ContactsBloc(
                  ContactsState(
                    contacts: [],
                    requestState: RequestState.NONE,
                    errorMessage: "",
                  ),
                  GetIt.instance<ContactsRepository>(),
                )),
        BlocProvider(
          create: (context) => MessageBloc(
            MessageState.initialState(),
            GetIt.instance<MessageRepository>(),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          indicatorColor: Colors.white,
        ),
        routes: {
          "/contacts": (context) => ContactsPage(),
          "/messages": (context) => MessagesPage(),
        },
        initialRoute: '/contacts',
      ),
    );
  }
}

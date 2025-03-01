import 'package:finence_tracker/features/graph/graph_bloc.dart';
import 'package:finence_tracker/features/graph/graph_event.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_bloc.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_event.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/add_transaction_form.dart';
import 'package:finence_tracker/widget/add_transaction_navbar.dart';
import 'package:finence_tracker/widget/loading_widget.dart';
import 'package:finence_tracker/widget/scaffold_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddTranscationScreen extends StatelessWidget {
  const AddTranscationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionBloc = context.read<TransactionBloc>();
    final graphBloc = context.read<GraphBloc>();

    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              const ScreenNavBar(title: "Add Transaction"),
              BlocConsumer<TransactionBloc, TransactionState>(
                  listener: (context, state) {
                if (state is AddedTransacation) {
                  scaffoldSnackBar(context, Colors.green, state.message);
                  transactionBloc.add(LoadTransactionEvent());
                  graphBloc.add(LoadDataGraphEvent());
                  context.pop();
                } else if (state is FailedAddedTransaction) {
                  scaffoldSnackBar(context, Colors.green, state.errorMessage);
                }
              }, builder: (context, state) {
                if (state is LoadingTransaction) {
                  return const LoadingWidget(
                    height: 300.0,
                    width: double.infinity,
                  );
                }
                return AddTransactionForm();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

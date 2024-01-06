import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/auth/domain/models/auth_model.dart';
import 'package:shop_ui/features/auth/presentation/login.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/branch/presentation/branch.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({super.key, required this.authModel});
  final AuthModel authModel;

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  final DIContainer diContainer = DIContainer();
  late AuthBloc _authBloc;
  late AuthModel _authModel;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(AutoLoginEvent());
    _authModel = widget.authModel;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _authListener,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _authListener(BuildContext context, AuthState state) {
    if (state.stateStatus == StateStatus.error ||
        state.token == null && state.stateStatus == StateStatus.loaded) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _authBloc,
            child: const LoginPage(),
          ),
        ),
      );
      return;
    }

    if (state.token != null && state.stateStatus == StateStatus.loaded) {
      if (_authModel.restriction.isEmpty) {
        print('EMPTY');
        //TODO: Route to display all branches of a shop, use shopId for query
      } else {
        //TODO: Route to display shopDrop and display restriction in dropdown menu ** state.authModel!.restriction.length**
        print('NOT EMPTY');
        SnackBarUtils.successSnackBar('Login Success', context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (BuildContext context) => diContainer.authBloc,
                ),
                BlocProvider<BranchBloc>(
                  create: (context) => diContainer.branchBloc,
                ),
              ],
              child: const BranchPage(),
            ),
          ),
        );
        return;
      }
    }
  }
}

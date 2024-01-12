import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/auth/presentation/login.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/shop/presentation/shop_admin.dart';
import 'package:shop_ui/features/shop/presentation/shop_new.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final DIContainer diContainer = DIContainer();
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(AutoLoginEvent());
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
        state.authModel == null && state.stateStatus == StateStatus.loaded) {
      print(state.errorMessage);
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

    if (state.authModel != null && state.stateStatus == StateStatus.loaded) {
      if (state.authModel!.restriction == null) {
        print('EMPTY');
        //TODO: Route to display all branches of a shop, use shopId for query
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
              child: const ShopAdminPage(),
            ),
          ),
        );
        return;
      } else {
        //TODO: Route to display shopDrop and display restriction in dropdown menu ** state.authModel!.restriction.length**
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
              child: const ShopPage(),
            ),
          ),
        );
        return;
      }
    }
  }
}

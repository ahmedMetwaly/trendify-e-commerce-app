
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/authentication/aurh_states.dart';
import '../../../../bloc/authentication/auth_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/values_manager.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<AuthenticationBloc,AuthenticationStates>(
          builder: (BuildContext context, state) {
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: SizeManager.sSpace),
              Text(
                state is AuthenticationSuccessState
                    ? state.user.name ?? S.current.userError
                    : S.current.guest,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                        color:
                            Theme.of(context).colorScheme.surface,
                        fontSize: 24),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                state is AuthenticationSuccessState
                    ? state.user.email ?? S.current.emailErrorSignUp
                    : "",
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          );
          },
        ),
      ),
    );
  }
}

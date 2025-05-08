import 'package:compteur/cubit/app/app_cubit.dart';
import 'package:compteur/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../cubit/auth_champ_cubit.dart';
import '../cubit/mdp_view_cubit.dart';

class Connexion extends StatelessWidget {
  const Connexion({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthChampCubit>().state as AuthChampInitial;
    final controllerMdp = context.watch<MdpViewCubit>().state;
    return BlocConsumer<AuthBloc,AuthState>(
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(title: Text("Connexion")),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: AuthChampInitial.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: AuthChampInitial.emailController,
                        validator: (valeur){
                          if(valeur!.isEmpty){
                            return "Email ou nom d'utilisateur vide";
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Email ou nom d'utilisateur"
                        ),
              
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (valeur){
                          if(valeur!.isEmpty){
                            return "mdp vide";
                          }else{
                            return null;
                          }
                        },
                        controller: AuthChampInitial.mdpController,
                        obscureText: controllerMdp,
                        decoration: InputDecoration(
                            hintText: "Mot de passe",
                          suffixIcon: IconButton(
                              onPressed: (){context.read<MdpViewCubit>().changeViewMdo();},
                              icon: Icon(Icons.remove_red_eye_outlined
                          ))
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                              value:controller.checkbox,onChanged: context.read<AuthChampCubit>().changeValeurCheckBox
                          ),
                          Text("Se souvenir de moi"),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: MediaQuery
                            .sizeOf(context)
                            .width,
                        child: ElevatedButton(
                            onPressed:context.watch<AuthBloc>().state is AuthLoading?null:() {
                              context.read<AuthBloc>().add(
                                  ConnexionClient(
                                    AuthChampInitial.emailController.text, AuthChampInitial.mdpController.text,
                                    AuthChampInitial.formKey,controller.checkbox,context.read<AppCubit>()
                                  )
                              );
                            },
                            child: context.watch<AuthBloc>().state is AuthLoading?
                            SizedBox(width:20,height:20,child:CircularProgressIndicator()):Text("Se connecter")
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context,state){
          if(state is AuthEchec){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.erreur)));
          }
          if(state is AuthSucces){
            AuthChampInitial.emailController.clear();
            AuthChampInitial.mdpController.clear();
            context.read<AuthChampCubit>().changeValeurCheckBox(false);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){return MyHomePage();}));
          }
        }
    );
  }
}

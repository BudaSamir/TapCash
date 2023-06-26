import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());

  WalletCubit get(context) => BlocProvider.of(context);


  bool isBlur = false;
  late num totalBalance = 2000;
  var year = DateTime.now().year;


  changeBlurText(){
    isBlur = !isBlur;
    emit(ChangeBlurTextState());
  }
}

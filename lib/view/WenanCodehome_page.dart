import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodeMainPage.dart';
import 'package:wenan/view/WenanCodelogin_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/WenanCodeBaseApiState.dart';
import '../viewmodel/WenanCodeuser_vm_provider.dart';

// var loginStatus = StateNotifierProvider((ref)=>LoginState());

/// Providers are declared globally and specify how to create a state
final loginStatusProvider = StateProvider((ref) => Application.isLogin());
final currentUserChangedProvider = StateProvider((ref) => Application.commonUser);
final userViewModel = Provider.autoDispose((ref) => UserModelProvider());
final commonUserNotify = StateNotifierProvider.autoDispose((ref) => UserNotifier(BaseApiState<CommonUser>()));

class LoginState extends StateNotifier<bool> {
  LoginState() : super(false);
  void refresh() {
    state = Application.isLogin();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future? initFu;
  @override
  void initState() {
    super.initState();
    initFu = Application.init();
    Application.appContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initFu,
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            return const RealHomePage();
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColor.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  backgroundView(),
                  Positioned(
                    top: 120,
                    child: splashLogo()
                  )
                ],
              ),
            );
          }
        });
  }


  Widget splashLogo(){
    return  ImageLoader.loadLocalImage(
      'wYeUneaOnh_trheisg_WsCpilYa2s1h1',
      width: 128,
      height: 142,
      fit: BoxFit.cover,
    );
  }
  Widget backgroundView(){
    return  ImageLoader.loadLocalImage(
      'wheKnsavnR_lrAeLsK_gbggr',
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }

}

class RealHomePage extends ConsumerWidget {
  const RealHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(loginStatusProvider.state).state = Application.isLogin();
    Application.updateInstallRef();
    Application.getFromC();
    final isLogin = ref.watch(loginStatusProvider.state).state;
    AuvChatLog.d("HomePage,isLogin = ${Application.isLogin()},$isLogin ");
    AuvChatLog.d("realsec=${AppConfig.defaultSecretKey},newkey=${Utils.base64Encode('soggy:${AppConfig.defaultSecretKey}')}");
    if (isLogin) {
      // var userNotify = ref.watch(commonUserNotify) as BaseApiState<CommonUserRsp>;
      // CommonUser user = userNotify.data as CommonUser;
      // AuvChatLog.d("HomePage,userId :${user.uid}  userStatus : ${user.status}" );
      var currentUser = ref.watch(currentUserChangedProvider.state).state;
      AuvChatLog.d("HomePage,userId :${currentUser?.uid}  userStatus : ${currentUser?.status}");
      if (currentUser?.status == 0) {
        return const LoginPage();
      }
      return const MainPage();
    } else {
      return const LoginPage();
    }
  }
}

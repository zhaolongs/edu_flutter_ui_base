
import 'package:mdemo1/demo/theme2/them_config.dart';
import 'package:provide/provide.dart';
class ProvideConfig{

  /**
   * Provide也是借助了InheritWidget，将共享状态放到顶层MaterialApp之上。
   * 底层部件通过Provier获取该状态，并通过混合ChangeNotifier通知依赖于该状态的组件刷新
   */
  ///用来初始化 Provider 以及 ThemConfigModel
  static init({child,dispose=false}){

    /**
     * Provider.value 将 ThemConfigModel 包裹成了 _ValueProvider
     * 并在它的内部提供了StreamController从而实现对数据进行流式操作。
     */
    ///初始化 providers
    final providers = Providers()..provide(Provider.value(ThemConfigModel()));

    /**
     * ProviderNode封装了InheritWidget，并且提供了 一个providers容器用于放置状态
     *
     */
    /// [child] 指的是要进行 状态管理的子 Widget
    /// [providers] 状态的管理器
    return ProviderNode(child: child, providers: providers, dispose: dispose);
  }

  // 通过Provide小部件获取状态封装
  static connect<T>({builder, child, scope}) {
    return Provide<T>(builder: builder, child: child, scope: scope);
  }


  // 通过Provide.value<T>(context)获取封装
  static T value<T>(context, {scope}) {
    /**
     * Provide也提供了两种获取State的方法。
     *    这里使用的是 Provide.value<T>(context)
     *    这种方式实际上调用了context.inheritFromWidgetOfExactType找到顶层的_InheritedProviders来获取到顶层providers中的状态
     *
     */
    return Provide.value<T>(context,scope: scope);
  }

}
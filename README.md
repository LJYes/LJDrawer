# LJDrawer
 一句代码，集成抽屉效果<br>
 this is a drawer effect<br>
 // 快速创建抽屉控制器，并设为根控制器<br>
    <b>self.window.rootViewController = [LJDrawerViewController drawerVCWithMainVC:tabBarVC leftMenuVC:leftVC leftWidth:0];</b>
# 
    
# 使用 Usage
## 初始化 init
#### 只需要传入菜单控制器和原先的根控制器即可
    /**
    快速创建抽屉控制器
    @param mainVC 根控制器
    @param leftMenuVC 左边的控制器
    @param leftWidth 左边的菜单控制器显示的最大范围，默认为屏幕宽度的0.7倍
    @return 抽屉控制器
    */
    + (instancetype)drawerVCWithMainVC:(UIViewController *)mainVC leftMenuVC:(UIViewController *)leftMenuVC leftWidth:(CGFloat)leftWidth;`

#### 在AppDelegate里直接调用
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
       self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        // 左边菜单控制器
        LJLeftMenuViewController *leftVC = [[LJLeftMenuViewController alloc] init];
        // 根控制器
        LJTabBarViewController *tabBarVC = [[LJTabBarViewController alloc] init];
        // 快速创建抽屉控制器，并设为根控制器
        self.window.rootViewController = [LJDrawerViewController drawerVCWithMainVC:tabBarVC leftMenuVC:leftVC leftWidth:0];
        [self.window makeKeyAndVisible];
        return YES;
    }

## 打开抽屉菜单 open drawer menu
#### 在需要打开抽屉菜单的方法里直接调用即可
    /**
     打开左边的菜单
    */
    - (void)openLeftMenu;
<br>在需要打开时调用:
    [[LJDrawerViewController getDrawerViewController] openLeftMenu];

## 安装 Installation

## 实现原理 How it Works

## 作者 Author

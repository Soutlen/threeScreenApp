////
////  AppDelegate.swift
////  threeScreenApp
////
////  Created by Soutlen on 20.08.2024.
////
//
//import UIKit
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//       
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//     
//    }
//}
//
//
//



import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    enum Screen: String {
        case main
        case screen1
        case screen2
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Здесь вы можете обработать ситуацию, когда сессия сцены была отвержена (можно оставить пустым).
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)

        // Получаем последний закрытый экран
        let lastScreen = UserDefaults.standard.string(forKey: "lastScreen") ?? Screen.main.rawValue
        
        // Создаем навигационный контроллер
        let navigationController = UINavigationController()
        
        // Определяем корневой контроллер в зависимости от последнего экрана
        switch lastScreen {
        case Screen.screen1.rawValue:
            navigationController.viewControllers = [ViewController1()]
        case Screen.screen2.rawValue:
            navigationController.viewControllers = [ViewController2()]
        default:
            navigationController.viewControllers = [ViewController()]
        }
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

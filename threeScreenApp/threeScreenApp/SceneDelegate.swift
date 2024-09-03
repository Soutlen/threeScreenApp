////
////  SceneDelegate.swift
////  threeScreenApp
////
////  Created by Soutlen on 20.08.2024.
////
//
//import UIKit
//
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        // Use this method to optionally configure and attach the UIWindow window to the provided UIWindowScene scene.
//        // If using a storyboard, the window property will automatically be initialized and attached to the scene.
//        // This delegate does not imply the connecting scene or session are new (see application:configurationForConnectingSceneSession instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
//    }
//
//    func sceneDidDisconnect(_ scene: UIScene) {
//        // Called as the scene is being released by the system.
//        // This occurs shortly after the scene enters the background, or when its session is discarded.
//        // Release any resources associated with this scene that can be re-created the next time the scene connects.
//        // The scene may re-connect later, as its session was not necessarily discarded (see application:didDiscardSceneSessions instead).
//    }
//
//    func sceneDidBecomeActive(_ scene: UIScene) {
//        // Called when the scene has moved from an inactive state to an active state.
//        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
//    }
//
//    func sceneWillResignActive(_ scene: UIScene) {
//        // Called when the scene will move from an active state to an inactive state.
//        // This may occur due to temporary interruptions (ex. an incoming phone call).
//    }
//
//    func sceneWillEnterForeground(_ scene: UIScene) {
//        // Called as the scene transitions from the background to the foreground.
//        // Use this method to undo the changes made on entering the background.
//    }
//
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        // Called as the scene transitions from the foreground to the background.
//        // Use this method to save data, release shared resources, and store enough scene-specific state information
//        // to restore the scene back to its current state.
//    }
//
//
//}
//
//
//
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    enum Screen: String {
        case main
        case screen1
        case screen2
    }

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        // Получаем последний закрытый экран или задаем значение по умолчанию на screen1
        let lastScreen = UserDefaults.standard.string(forKey: "lastScreen") ?? Screen.main.rawValue
        print("Last screen loaded: \(lastScreen)")

        let navigationController = UINavigationController()
        
        // Устанавливаем нужный экран в зависимости от значения lastScreen
      
        
        
        switch lastScreen {
        case Screen.screen1.rawValue:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
            navigationController.viewControllers = [viewController]
        case Screen.screen2.rawValue:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController1 = storyboard.instantiateViewController(withIdentifier: "ViewController")
            navigationController.viewControllers = [viewController1]
        default:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController2 = storyboard.instantiateViewController(withIdentifier: "ViewController2")
            navigationController.viewControllers = [viewController2]
        }
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Сохраняем состояние текущего экрана перед уходом в фон
        if let navigationController = window?.rootViewController as? UINavigationController,
           let currentViewController = navigationController.topViewController {
            let currentScreen = String(describing: type(of: currentViewController)).components(separatedBy: ".").last ?? Screen.main.rawValue
            UserDefaults.standard.setValue(currentScreen, forKey: "lastScreen")
            print("Saving current screen: \(currentScreen)")
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("Application disconnected.")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Здесь вы можете сохранить данные в фоновом режиме, если это требуется
    }
    
    // Другие методы SceneDelegate, если необходимо...
}

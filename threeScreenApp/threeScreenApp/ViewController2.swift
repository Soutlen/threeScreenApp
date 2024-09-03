////
////  ViewController2.swift
////  threeScreenApp
////
////  Created by Soutlen on 24.08.2024.
////
//
//import UIKit
//
//class ViewController2: UIViewController {
//   
//    let gradientLayer = CAGradientLayer()
//    
//    @IBOutlet weak var coinsLabel: UILabel!
//    
//    var num = 0
//
//    @IBAction func TapMe(_ sender: Any) {
//        num += 1
//        coinsLabel.text = "\(num)"
//        // Удаляем сохранение здесь, чтобы не сохранять каждый раз при нажатии
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//      
//       // Загружаем сохраненное значение при открытии приложения
//       num = UserDefaults.standard.integer(forKey: "savedCoins")
//       coinsLabel.text = "\(num)"
//        
//        let color1 = UIColor(hex: "8CC0F1")?.cgColor ?? UIColor.clear.cgColor
//        let color2 = UIColor(hex: "C0DAB7")?.cgColor ?? UIColor.clear.cgColor
//
//        gradientLayer.colors = [color1, color2]
//
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        // Сохраняем текущее значение num в UserDefaults при уходе с экрана
//        UserDefaults.standard.set(num, forKey: "savedCoins")
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        gradientLayer.frame = self.view.bounds
//    
//       
//    }
//    
//}



//import UIKit
//
//class ViewController2: UIViewController {
//    
//    let gradientLayer = CAGradientLayer()
//    
//    @IBOutlet weak var coinsLabel: UILabel!
//    
//    var num = 0
//
//    @IBAction func TapMe(_ sender: Any) {
//        num += 1
//        coinsLabel.text = "\(num)"
//        // Удаляем сохранение здесь, чтобы не сохранять каждый раз при нажатии
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let color1 = UIColor(hex: "8CC0F1")?.cgColor ?? UIColor.clear.cgColor
//        let color2 = UIColor(hex: "C0DAB7")?.cgColor ?? UIColor.clear.cgColor
//
//        gradientLayer.colors = [color1, color2]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        // Загружаем сохраненное значение при входе на экран
//        num = UserDefaults.standard.integer(forKey: "savedCoins")
//        coinsLabel.text = "\(num)"
//
//        // Сохраняем состояние, что пользователь на втором экране
//        UserDefaults.standard.setValue("screen2", forKey: "lastScreen")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        // Сохраняем текущее значение num в UserDefaults при уходе с экрана
//        UserDefaults.standard.set(num, forKey: "savedCoins")
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        gradientLayer.frame = self.view.bounds
//    }
//
//    // Дополнительный метод, чтобы перейти обратно на предыдущий экран
//    @IBAction func goBack(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
//    }
//    
//    
//}


import UIKit

class ViewController2: UIViewController {
    
    enum Screen: String {
        case main
        case screen1
        case screen2
    }
    
    let gradientLayer = CAGradientLayer()
    @IBOutlet weak var coinsLabel: UILabel!
    
    var num = 0

    @IBAction func TapMe(_ sender: Any) {
        num += 1
        coinsLabel.text = "\(num)"
        // Удаляем сохранение здесь, чтобы не сохранять каждый раз при нажатии
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
    }
    
    func configureGradientLayer() {
        let color1 = UIColor(hex: "8CC0F1")?.cgColor ?? UIColor.clear.cgColor
        let color2 = UIColor(hex: "C0DAB7")?.cgColor ?? UIColor.clear.cgColor
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.frame = self.view.bounds // Устанавливаем начальный размер градиентного слоя
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Загружаем сохраненное значение при входе на экран
        num = UserDefaults.standard.integer(forKey: "savedCoins")
        coinsLabel.text = "\(num)"

        // Сохраняем состояние, что пользователь на втором экране
        UserDefaults.standard.setValue(Screen.screen2.rawValue, forKey: "lastScreen")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Сохраняем текущее значение num в UserDefaults при уходе с экрана
        UserDefaults.standard.set(num, forKey: "savedCoins")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = self.view.bounds
    }

    // Дополнительный метод, чтобы перейти обратно на предыдущий экран
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


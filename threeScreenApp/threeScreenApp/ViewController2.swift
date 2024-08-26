//
//  ViewController2.swift
//  threeScreenApp
//
//  Created by Soutlen on 24.08.2024.
//

import UIKit

class ViewController2: UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var coinsLabel: UILabel!
    
    var num = 0

    @IBAction func TapMe(_ sender: Any) {
        num += 1
//        resultCooins.text = "\(num)"
        
        // Сохраняем текущее значение num в UserDefaults
        UserDefaults.standard.set(num, forKey: "savedCoins")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
//        // Загружаем сохраненное значение при открытии приложения
//       num = UserDefaults.standard.integer(forKey: "savedCoins")
//        resultCooins.text = "\(num)"
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = self.view.bounds
    }
}


    

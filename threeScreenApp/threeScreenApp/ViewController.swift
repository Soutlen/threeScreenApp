//
//  ViewController.swift
//  threeScreenApp
//
//  Created by Soutlen on 20.08.2024.
//


import UIKit

class ViewController: UIViewController {

    let gradientLayer = CAGradientLayer() // Переносим создание градиента на уровень класса

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Задаем цвета градиента
        let color1 = UIColor(hex: "8CC0F1")?.cgColor ?? UIColor.clear.cgColor
        let color2 = UIColor(hex: "C0DAB7")?.cgColor ?? UIColor.clear.cgColor

        gradientLayer.colors = [color1, color2] // Два цвета для градиента

        // Задаем направление градиента: сверху вниз
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)

        // Добавляем градиент на view
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    //переход на вторую страницу
    @IBAction func showVC1(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(identifier: "ViewController1")
        
//        self.present(viewController, animated: true, completion: nil)
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Обновляем размер градиента, чтобы он соответствовал размеру view
        gradientLayer.frame = self.view.bounds
    }
}

// Добавление расширения UIColor для поддержки HEX
extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
        
        
        
        
        
    }
}





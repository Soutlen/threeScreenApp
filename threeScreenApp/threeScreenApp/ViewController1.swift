//
//  ViewController1.swift
//  threeScreenApp
//
//  Created by Soutlen on 24.08.2024.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet weak var imageAvatarView: UIImageView!
    
    let gradientLayer = CAGradientLayer() // Переносим создание градиента на уровень класса

    //Создаем смену изображений для аватарки
    @IBAction func changeAvatarImadge(_ sender: Any) {
        
        if imageAvatarView.image == UIImage(named: "firstImage") {
            
                   imageAvatarView.image = UIImage(named: "secondImage")
            
               } else if imageAvatarView.image == UIImage(named: "secondImage") {
                   
                   imageAvatarView.image = UIImage(named: "threeImage")
               } else {
                   
                   imageAvatarView.image = UIImage(named: "firstImage")
               }
           }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка радиуса углов для изображения
        imageAvatarView.layer.cornerRadius = imageAvatarView.bounds.height / 2

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
    
    // Переход назад
    @IBAction func showVC0(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Переход к третьему экрану
    @IBAction func ShowVC2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController2 = storyboard.instantiateViewController(identifier: "ViewController2")
        self.present(viewController2, animated: true, completion: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Обновляем размер градиента, чтобы он соответствовал размеру view
        gradientLayer.frame = self.view.bounds
    }
}





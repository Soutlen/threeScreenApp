////
////  ViewController1.swift
////  threeScreenApp
////
////  Created by Soutlen on 24.08.2024.
////
//
//import UIKit
//
//class ViewController1: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    @IBOutlet weak var imageAvatarView: UIImageView!
//    let gradientLayer = CAGradientLayer()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        imageAvatarView.layer.cornerRadius = imageAvatarView.bounds.height / 2
//        imageAvatarView.clipsToBounds = true // Убедитесь, что изображение не выходит за рамки
//        imageAvatarView.contentMode = .scaleAspectFill // Установите режим отображения
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
//    
//    @IBAction func changeAvatarImage(_ sender: Any) {
//        let alertController = UIAlertController(title: "Выберите изображение", message: nil, preferredStyle: .actionSheet)
//        
//        alertController.addAction(UIAlertAction(title: "Изменить изображение из галереи", style: .default, handler: { _ in
//            self.presentImagePicker()
//        }))
//        
//        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
//        
//        present(alertController, animated: true, completion: nil)
//    }
//    
//    func presentImagePicker() {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
//        imagePickerController.sourceType = .photoLibrary // Можно поменять на .camera для камеры
//        present(imagePickerController, animated: true, completion: nil)
//    }
//    
//    // MARK: - UIImagePickerControllerDelegate
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.originalImage] as? UIImage {
//            imageAvatarView.image = image // Установка выбранного изображения
//        }
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        gradientLayer.frame = self.view.bounds
//    }
//    
//    // Переход к третьему экрану
//    
//    @IBAction func showVC2(_ sender: Any) {
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController2 = storyboard.instantiateViewController(identifier: "ViewController2")
//        
//        setRootViewController(viewController2)
//        
//
//        
//    }
//}


//import UIKit
//
//class ViewController1: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    @IBOutlet weak var imageAvatarView: UIImageView!
//    let gradientLayer = CAGradientLayer()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        imageAvatarView.layer.cornerRadius = imageAvatarView.bounds.height / 2
//        imageAvatarView.clipsToBounds = true // Убедитесь, что изображение не выходит за рамки
//        imageAvatarView.contentMode = .scaleAspectFill // Установите режим отображения
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
//    @IBAction func changeAvatarImage(_ sender: Any) {
//        let alertController = UIAlertController(title: "Выберите изображение", message: nil, preferredStyle: .actionSheet)
//        
//        alertController.addAction(UIAlertAction(title: "Изменить изображение из галереи", style: .default, handler: { _ in
//            self.presentImagePicker()
//        }))
//        
//        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
//        
//        present(alertController, animated: true, completion: nil)
//    }
//    
//    func presentImagePicker() {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
//        imagePickerController.sourceType = .photoLibrary // Можно поменять на .camera для камеры
//        present(imagePickerController, animated: true, completion: nil)
//    }
//    
//    // MARK: - UIImagePickerControllerDelegate
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.originalImage] as? UIImage {
//            imageAvatarView.image = image // Установка выбранного изображения
//        }
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        gradientLayer.frame = self.view.bounds
//    }
//    
//    // Переход ко второму экрану
//    @IBAction func showVC2(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController2 = storyboard.instantiateViewController(identifier: "ViewController2")
//
//        // Сохраняем текущий экран в UserDefaults перед переходом
//        UserDefaults.standard.setValue("screen1", forKey: "lastScreen")
//
//        // Пуш на второй контроллер в навигационном стеке
//        navigationController?.pushViewController(viewController2, animated: true)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        // Сохраняем состояние, чтобы запомнить, что этот экран был открыт
//        UserDefaults.standard.setValue("screen1", forKey: "lastScreen")
//    }
//}



import UIKit

class ViewController1: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    enum Screen: String {
        case main
        case screen1
        case screen2
    }
    
    @IBOutlet weak var imageAvatarView: UIImageView!
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageAvatarView.layer.cornerRadius = imageAvatarView.bounds.height / 2
        imageAvatarView.clipsToBounds = true
        imageAvatarView.contentMode = .scaleAspectFill
        
        configureGradientLayer()
    }
    
    func configureGradientLayer() {
        let color1 = UIColor(hex: "8CC0F1")?.cgColor ?? UIColor.clear.cgColor
        let color2 = UIColor(hex: "C0DAB7")?.cgColor ?? UIColor.clear.cgColor
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.frame = self.view.bounds // Устанавливаем начальный размер градиентиа
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradientLayer.frame = self.view.bounds
    }
    
    @IBAction func changeAvatarImage(_ sender: Any) {
        let alertController = UIAlertController(title: "Выберите изображение", message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Изменить изображение из галереи", style: .default, handler: { _ in
            self.presentImagePicker()
        }))
        
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
   //  Переход ко второму экрану
      @IBAction func showVC2(_ sender: Any) {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let viewController2 = storyboard.instantiateViewController(identifier: "ViewController2")
  
          // Сохраняем текущий экран в UserDefaults перед переходом
          UserDefaults.standard.setValue(Screen.screen1.rawValue, forKey: "lastScreen")
  
          // Пуш на второй контроллер в навигационном стеке
          navigationController?.pushViewController(viewController2, animated: true)
      }
    
    func presentImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageAvatarView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

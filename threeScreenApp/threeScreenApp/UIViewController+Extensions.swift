//
//  UIViewController+Extensions.swift
//  threeScreenApp
//
//  Created by Soutlen on 26.08.2024.
//

import UIKit

extension UIViewController {
    func setRootViewController(_ vc: UIViewController, animation: UIView.AnimationOptions = .transitionCrossDissolve) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromLeft, .curveEaseOut]

        // Animate the transition
        UIView.transition(with: window, duration: 0.25, options: animation, animations: {
            window.rootViewController = nil
            window.rootViewController = vc
        }, completion: { completed in
            // Optional completion handler
        })

    }
}


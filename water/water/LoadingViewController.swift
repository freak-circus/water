//
//  LoadingViewController.swift
//  water
//
//  Created by Кирилл Титов on 11.07.2024.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.removeObject(forKey: "user")
        // Настраиваем таймер для скрытия изображения и настройки UI
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            if UserDefaults.standard.value(forKey: "user") != nil {
                performSegue(withIdentifier: "auth", sender: self)
            } else {
                performSegue(withIdentifier: "loading", sender: self)
            }
        }
    }
}

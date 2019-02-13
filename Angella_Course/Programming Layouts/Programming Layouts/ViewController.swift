//
//  ViewController.swift
//  Programming Layouts
//
//  Created by PavelM on 12/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        
        // Таким образом мы задаем Размер квадрата никогда не будет менятся он всегда будет в центре
        
        // Сохраняем размер объекта
        
//        let square = UIView(frame: CGRect(x: (viewWidth / 2) - 50, y: (viewHeight / 2) - 50, width: 100, height: 100))
        
        // Здесь я делаю так что квадрат будет разтягиватся по осям в зависимости от размера экрана
        // Сохраняем отсупы!
        
        let square = UIView(frame: CGRect(x: 50, y: 100, width: viewWidth - 100, height: viewHeight - 200))
        
        square.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        view.addSubview(square)
        
    }


}


//
//  ViewController.swift
//  RandomFoto
//
//  Created by Алексей Гайдуков on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var buttonNext: UIButton!
    //    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .white
//        return imageView
//    }()
//
//    private let button: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .white
//        button.setTitle("Random Photo", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        return button
//    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemCyan,
        .systemMint,
        .systemYellow,
        .systemPurple,
        .systemOrange
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        getPhoto()
        
        buttonNext.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
        
    }
    
    
    @IBAction func buttonTapped(){
        getPhoto()

        view.backgroundColor = colors.randomElement()
    }
//        @objc func buttonTapped() {
//        getPhoto()
//
//        view.backgroundColor = colors.randomElement()
//    }
    
//    override func viewDidLayoutSubviews() {
//        view.addSubview(buttonNext)
//        buttonNext.frame = CGRect(
//            x: 30,
//            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
//            width: view.frame.width-60,
//            height: 55
//        )
//    }
    
    func getPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        guard let url = URL(string: urlString) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        
        imageView.image = UIImage(data: data)
    }

}


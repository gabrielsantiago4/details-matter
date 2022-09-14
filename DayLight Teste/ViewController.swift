//
//  ViewController.swift
//  DayLight Teste
//
//  Created by Gabriel Santiago on 11/09/22.
//

import UIKit



class ViewController: UIViewController {
    
    var waterDrank: Float = 0 {
        didSet {  //faz algo toda vida que um valor mudar
            
            progressBar.setProgress(waterDrank / 3000, animated: true)
            
        }
    }
    
    lazy var gradientBackground: CAGradientLayer = {
        let gradienteLayer = CAGradientLayer()
        gradienteLayer.frame = view.bounds
        gradienteLayer.colors = [ UIColor.BackgroundColor1.cgColor, UIColor.BackroundColor2.cgColor]
        return gradienteLayer
    }()
    
    lazy var waterCounter: UILabel = {
        let waterCounter = UILabel()
        waterCounter.font = UIFont(name: "Quantico-Bold", size: 30)
        waterCounter.textColor = .CounterColor
        waterCounter.text = "0"
        return waterCounter
    }()
    
    lazy var button250 : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "glass"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(ViewController.addWater250), for: .touchUpInside)
        return button
    }()
    
    lazy var button500: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bottle"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(ViewController.addWater500), for:.touchUpInside)
        return button
    }()
    
    lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.trackTintColor = UIColor.ProgressbarTrack
        progressBar.progressTintColor = UIColor.ProgressbarColor1
        progressBar.layer.cornerRadius = 13
        progressBar.layer.sublayers![1].cornerRadius = 13
        progressBar.subviews[1].clipsToBounds = true
        progressBar.layer.masksToBounds = true
        return progressBar
    }()
    
    lazy var cloudImage: UIImageView = {
        let cloudCounter = UIImageView()
        cloudCounter.image = UIImage(named: "Vector")
        return cloudCounter
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button250)
        view.addSubview(button500)
        view.addSubview(progressBar)
        view.addSubview(cloudImage)
        view.addSubview(waterCounter)
        view.layer.insertSublayer(gradientBackground, at: 0)
        
        waterCounter.translatesAutoresizingMaskIntoConstraints = false
        button250.translatesAutoresizingMaskIntoConstraints = false
        button500.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        cloudImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            waterCounter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            waterCounter.topAnchor.constraint(equalTo: view.topAnchor, constant: 140)
        ])
        
        NSLayoutConstraint.activate([
            button250.widthAnchor.constraint(equalToConstant: 100),
            button250.heightAnchor.constraint(equalToConstant: 130),
            button250.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            button250.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            button500.widthAnchor.constraint(equalToConstant: 100),
            button500.heightAnchor.constraint(equalToConstant: 130),
            button500.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52),
            button500.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            progressBar.widthAnchor.constraint(equalToConstant: 205),
            progressBar.heightAnchor.constraint(equalToConstant: 25),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 230)
        
        ])
        
        NSLayoutConstraint.activate([
            cloudImage.widthAnchor.constraint(equalToConstant: 205),
            cloudImage.heightAnchor.constraint(equalToConstant: 127.35),
            cloudImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cloudImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 90)
        ])
    }

    
    
    @objc func addWater250() {
        self.waterDrank += 250
        self.waterCounter.text = "\(self.waterDrank / 1000) l"
    }
    
    @objc func addWater500() {
        self.waterDrank += 500
        self.waterCounter.text = "\(self.waterDrank / 1000) l"
    }
    
    
}



extension UIColor {
    
    class var BackgroundColor1: UIColor {
        return UIColor(red: 67.0 / 255.0, green: 189.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    class var BackroundColor2: UIColor {
        return UIColor(red: 110.0 / 255.0, green: 217.0 / 255.0, blue: 245.0 / 255.0, alpha: 0.52)
    }
    
    class var ProgressbarColor1: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 120.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0)
    }
    
    class var ProgressbarColor2: UIColor {
        return UIColor(red: 67.0 / 255.0, green: 143.0 / 255.0, blue: 214.0 / 255.0, alpha: 0.75)
    }
    
    class var ProgressbarTrack: UIColor {
        return UIColor(red: 154.0 / 255.0, green: 213.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    class var CounterColor: UIColor {
        return UIColor(red: 13 / 255.0, green: 38 / 255.0, blue: 102 / 255.0, alpha: 1.0)
    }
}

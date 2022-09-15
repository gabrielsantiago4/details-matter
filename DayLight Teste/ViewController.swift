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
        gradienteLayer.colors = [ UIColor.backgroundColor1.cgColor, UIColor.backroundColor2.cgColor]
        gradienteLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradienteLayer.endPoint = CGPoint(x: 0.5, y: 1.1)
        return gradienteLayer
    }()
    
    lazy var waterCounterHeader: UILabel = {
        let waterCounterHeader = UILabel ()
        waterCounterHeader.font = UIFont(name: "Quantico-Regular", size: 15.80)
        waterCounterHeader.textColor = .counterColor
        waterCounterHeader.text = "Você já bebeu"
        return waterCounterHeader
        
    }()
    
    lazy var waterCounter: UILabel = {
        let waterCounter = UILabel()
        waterCounter.font = UIFont(name: "Quantico-Bold", size: 39)
        waterCounter.textColor = .counterColor
        waterCounter.text = "0"
        return waterCounter
    }()
    
    lazy var waterGoal: UILabel = {
        let waterGoal = UILabel()
        waterGoal.font = UIFont(name: "Quantico-Regular", size: 21)
        waterGoal.textColor = .goalColor
        waterGoal.text = "Sua meta: 3l"
        return waterGoal
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
//        let progressBar = UIProgressView(progressViewStyle: .default)
        let progressBar = GradientProgressView(progressViewStyle: .bar)
        progressBar.trackTintColor = UIColor.progressbarTrack
//        progressBar.progressTintColor = UIColor.progressbarColor1
        progressBar.firstColor = .progressbarColor1
        progressBar.secondColor = .progressbarColor2
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
        view.addSubview(waterCounterHeader)
        view.addSubview(waterCounter)
        view.addSubview(waterGoal)
        view.layer.insertSublayer(gradientBackground, at: 0)
        
        configureConstraints()
        
    }
    
    func configureConstraints() {
        
        waterGoal.translatesAutoresizingMaskIntoConstraints = false
        waterCounterHeader.translatesAutoresizingMaskIntoConstraints = false
        waterCounter.translatesAutoresizingMaskIntoConstraints = false
        button250.translatesAutoresizingMaskIntoConstraints = false
        button500.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        cloudImage.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            waterCounter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            waterCounter.topAnchor.constraint(equalTo: view.topAnchor, constant: 155)
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
            cloudImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 3),
            cloudImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 90)
        ])
        
        NSLayoutConstraint.activate([
            waterCounterHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            waterCounterHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 135)
        ])
        
        NSLayoutConstraint.activate([
            waterGoal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            waterGoal.topAnchor.constraint(equalTo: view.topAnchor, constant: 265)
        ])
        
    }

    
    
    @objc func addWater250() {
        self.waterDrank += 250
        let value = self.waterDrank / 1000
        self.waterCounter.text = String(format: "%.1fl", value)
        
    }
    
    @objc func addWater500() {
        self.waterDrank += 500
        let value = self.waterDrank / 1000
        self.waterCounter.text = String(format: "%.1fl", value)

    }
    
    
}

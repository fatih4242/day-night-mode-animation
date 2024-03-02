//
//  ViewController.swift
//  AnimationUIKit
//
//  Created by Fatih Toker on 2.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let sunImage = UIImageView(image: UIImage(named: "sun"))
    let moonImage = UIImageView(image: UIImage(named: "moon"))
    
    let imageHeight = 100.0
    let imageWidth = 100.0
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()

        
    }
    
    private func initialize(){
        self.view.backgroundColor = .black
        
        sunImage.contentMode = .scaleAspectFit
        sunImage.translatesAutoresizingMaskIntoConstraints = false
        sunImage.backgroundColor = .white
        sunImage.layer.cornerRadius = 50
        sunImage.layer.shadowColor = UIColor.black.cgColor
        sunImage.layer.shadowOpacity = 0.5
        sunImage.layer.shadowOffset = CGSize(width: 0, height: 5) // Gölge konumu
        sunImage.layer.shadowRadius = 10 // Gölge yarıçapı
        
        moonImage.contentMode = .scaleAspectFit
        moonImage.translatesAutoresizingMaskIntoConstraints = false
        moonImage.backgroundColor = .black
        moonImage.layer.cornerRadius = 50
        moonImage.layer.shadowColor = UIColor.black.cgColor
        moonImage.layer.shadowOpacity = 0.5
        moonImage.layer.shadowOffset = CGSize(width: 0, height: 5) // Gölge konumu
        moonImage.layer.shadowRadius = 10 // Gölge yarıçapı
        


        
        // Padding için iç UIView oluşturun
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        moonImage.addSubview(paddingView)
        
        // Padding ayarları
        let padding: CGFloat = 50
        paddingView.topAnchor.constraint(equalTo: moonImage.topAnchor, constant: padding).isActive = true
        paddingView.leadingAnchor.constraint(equalTo: moonImage.leadingAnchor, constant: padding).isActive = true
        paddingView.trailingAnchor.constraint(equalTo: moonImage.trailingAnchor, constant: -padding).isActive = true
        paddingView.bottomAnchor.constraint(equalTo: moonImage.bottomAnchor, constant: -padding).isActive = true
        
        
        self.view.addSubview(sunImage)
        self.view.addSubview(moonImage)
     
        //Sun setup
        NSLayoutConstraint.activate([
            sunImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sunImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sunImage.heightAnchor.constraint(equalToConstant: self.imageHeight),
            sunImage.widthAnchor.constraint(equalToConstant: self.imageWidth)
        ])
        
        let sunTap = UITapGestureRecognizer(target: self, action: #selector(sunTapped))
        sunImage.isUserInteractionEnabled = true
        sunImage.addGestureRecognizer(sunTap)
        
        //Moon Setup
        NSLayoutConstraint.activate([
            moonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            moonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moonImage.heightAnchor.constraint(equalToConstant: self.imageHeight),
            moonImage.widthAnchor.constraint(equalToConstant: self.imageWidth)
        ])
        
        moonImage.transform = CGAffineTransform()
        
        let moonTap = UITapGestureRecognizer(target: self, action: #selector(moonTapped))
        moonImage.isUserInteractionEnabled = true
        moonImage.addGestureRecognizer(moonTap)
        
        setMoonOutOfView()
        
    }

    
    @objc private func sunTapped(){
        UIView.animate(withDuration: 0.5, animations: {
            self.sunImage.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height + self.imageHeight + 50)
        }, completion: { finished in
            
            if finished {
                //Animation Finished
                //Set image above
                self.setSunOutOfView()
                UIView.animate(withDuration: 0.5) {
                    self.view.backgroundColor = .white
                    self.moonImage.transform = CGAffineTransform(translationX: 0, y: 0)
                }
            }
            
        })
    }
    
    @objc private func moonTapped(){
        UIView.animate(withDuration: 0.5, animations: {
            self.moonImage.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height + self.imageHeight + 50)
        }, completion: { finished in
            
            if finished {
                //Animation Finished
                //Set image above
                self.setMoonOutOfView()
               
                UIView.animate(withDuration: 0.5) {
                    self.view.backgroundColor = .black
                    self.sunImage.transform = CGAffineTransform(translationX: 0, y: 0)
                }
            }
            
        })
    }
    
    private func setSunOutOfView(){
        self.sunImage.transform = CGAffineTransform(translationX: 0, y:  -self.screenHeight - self.imageHeight)
    }
    
    private func setMoonOutOfView(){
        self.moonImage.transform = CGAffineTransform(translationX: 0, y:  -self.screenHeight - self.imageHeight)
    }

}


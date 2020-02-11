//
//  ViewController.swift
//  animation tuto
//
//  Created by Alexandre RODRIGUEZ on 11/02/2020.
//  Copyright © 2020 Alexandre Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // création de l'image
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 600, y: 384)
        view.addSubview(imageView)
    }

    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true // cache le bouton quand il est tapé
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],
               animations: {
                switch self.currentAnimation {
                case 0:
                    self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2) // augmente la taille de l'image
                    break
                case 1:
                    self.imageView.transform = .identity// retour a la taille d'origine
                case 2:
                    self.imageView.transform = CGAffineTransform(translationX: -256, y: -256) // deplace en haut a gauche
                case 3:
                    self.imageView.transform = .identity // retour à la position d'origine
                case 4:
                    self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi) // rotation image
                case 5:
                    self.imageView.transform = .identity // retour à la position de départ
                case 6:
                    self.imageView.alpha = 0.1
                    self.imageView.backgroundColor = UIColor.green

                case 7:
                    self.imageView.alpha = 1
                    self.imageView.backgroundColor = UIColor.clear

                default:
                    break
                }
            }) { finished in
                sender.isHidden = false // affiche le bouton une fois l'animation terminé
            }

            currentAnimation += 1

            if currentAnimation > 7 {
                currentAnimation = 0
            }
        }
    
}


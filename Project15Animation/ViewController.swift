//
//  ViewController.swift
//  Project15Animation
//
//  Created by Tai Chin Huang on 2021/9/13.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
//        imageView.center = CGPoint(x: 512, y: 384)
        imageView.center = view.center
        view.addSubview(imageView)
    }

    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true
        // Spring Animation: 特殊動畫曲線，Spring Animation前期速度增加得更快，在動畫時間一定的前提下，給人感覺更加快速、乾淨
        // usingSpringWithDamping: 範圍0~1，數字越小，彈簧的震動效果越強
        // initialSpringVelocity: 數字越大，初始的啟動速度越快
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: []) {
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            case 1:
                // clear our pre-define transform, resetting any applied transform property
                self.imageView.transform = CGAffineTransform.identity
            case 2:
                // 目前的座標的相對值，這裡是往左上的意思
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.imageView.transform = .identity
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case 5:
                self.imageView.transform = .identity
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = UIColor.green

            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = UIColor.clear
            default:
                break
            }
        } completion: { finished in
            sender.isHidden = false
        }

        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}


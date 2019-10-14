//
//  ViewController.swift
//  hustle_mode
//
//  Created by NANYE on 2019/10/14.
//  Copyright © 2019年 NANYE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLal: UILabel!
    @IBOutlet weak var onLal: UILabel!
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "hustleon.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func powerBtnPress(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 20, width: 495, height: 638)
        }) {(finished) in
            self.hustleLal.isHidden = false
            self.onLal.isHidden = false
        }
    }
    
}


//
//  ViewController.swift
//  a
//
//  Created by Likhitha on 31/10/23.
//  Copyright © 2023 Likhitha. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
var player : AVAudioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let path = Bundle.main.path(forResource: "i", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: path!)as URL)
        }
        catch {
        }
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named:"i")
        backgroundImage.contentMode = .scaleAspectFit
self.view.insertSubview(backgroundImage,at:0)
        // Do any additional setup after loading the view.
    }

    @IBAction func start(_ sender: Any) {
        performSegue(withIdentifier: "s1", sender: self)
        player.play()
        player.numberOfLoops = -1
    }
    
    
    @IBOutlet weak var sw: UISwitch!
    
    @IBAction func s(_ sender: Any) {
        if sw.isOn {
            view.backgroundColor = UIColor.black
        }
        else {
            view.backgroundColor = UIColor.white
        }
    }
    
}


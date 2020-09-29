//
//  ViewController.swift
//  posty-music
//
//  Created by Aswin A Nair on 09/07/20.
//  Copyright © 2020 Aswin A Nair. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playPausePressed(_ sender: UIButton) {
        if(player != nil){
            if(player.isPlaying){
                player.pause()
            } else {
                player.play()
            }
        }
    }
    
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        if(player != nil){
            if(player.isPlaying){
                player.stop()
            }
            player = nil
        }
    }
    
    
    
    @IBAction func songButtonPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        playSound(soundName: sender.currentTitle!)
    }
    
    @IBAction func picturePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    func playSound(soundName : String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}


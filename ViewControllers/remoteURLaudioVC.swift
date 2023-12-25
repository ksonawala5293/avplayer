//
//  remoteURLvideoVC.swift
//  usingAVPlayer
//
//  Created by Apple on 25/12/23.
//

import UIKit
import AVFoundation

class remoteURLaudioVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var btnPlayPause: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        customPlayer.shared.setupThePlayer(with: mp3URL)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - IBAction
    @IBAction func btnPlayTapped(_ sender: Any) {
        if customPlayer.shared.player?.rate == 0 {
            customPlayer.shared.player?.play()
            btnPlayPause.setImage(UIImage.init(systemName: "pause.fill"), for: .normal)
        } else {
            customPlayer.shared.player?.pause()
            btnPlayPause.setImage(UIImage.init(systemName: "play.fill"), for: .normal)
        }
    }
}

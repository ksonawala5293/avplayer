//
//  playerWithSliderVC.swift
//  usingAVPlayer
//
//  Created by Apple on 25/12/23.
//

import UIKit
import CoreMedia

class playerWithSliderVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var btnPlayPause: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    //MARK: - Variables
    var timer:Timer?
    
    override func viewWillAppear(_ animated: Bool) {
        customPlayer.shared.setupThePlayer(with: mp3URL) {
            self.setupSlider()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - IBAction
    @IBAction func btnPlayTapped(_ sender: Any) {
        if customPlayer.shared.player?.rate == 0 {
            play()
        } else {
            pause()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        pause()
    }
}

//MARK: - Cuctom methods
extension playerWithSliderVC {
    private func play(){
        customPlayer.shared.player?.play()
        btnPlayPause.setImage(UIImage.init(systemName: "pause.fill"), for: .normal)
        
        if timer == nil {
            setupTimer()
        }
    }
    
    private func pause(){
        customPlayer.shared.player?.pause()
        btnPlayPause.setImage(UIImage.init(systemName: "play.fill"), for: .normal)
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    private func setupSlider() {
        guard let item = customPlayer.shared.playerItem else {
            return
        }

        slider.minimumValue = 0
        
        let duration = item.asset.duration.seconds
        slider.maximumValue = Float(duration)
        
        slider.isContinuous = true
        
        slider.addTarget(self, action: #selector(playbackSliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func playbackSliderValueChanged(_ playbackSlider:UISlider) {
        customPlayer.shared.playerSldierValueChanged(with: playbackSlider.value)
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
            guard self?.slider.isTracking == false else { return }
            self?.updateSlider(to: self!.slider.value + 1)
        }
    }
    
    private func updateSlider(to value: Float) {
        slider.value = value
    }
}

//
//  customPlayer.swift
//  usingAVPlayer
//
//  Created by Apple on 25/12/23.
//

import Foundation
import AVFoundation

final class customPlayer {
    //MARK: - Variables
    static var shared = customPlayer()
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    
    func setupThePlayer(with url: String, completionHandler: (() -> ())? = nil) {
        guard let url = URL(string: url) else {return}
        let playerItm = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItm)
        playerItem = playerItm
        completionHandler?()
    }
    
    func playerSldierValueChanged(with sliderCurrentValue: Float) {
        let seconds : Int64 = Int64(sliderCurrentValue)
        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
        
        player!.seek(to: targetTime)
    }
}

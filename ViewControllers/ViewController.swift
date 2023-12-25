//
//  ViewController.swift
//  usingAVPlayer
//
//  Created by Apple on 25/12/23.
//

import UIKit

let mp3URL = "https://s3.amazonaws.com/kargopolov/kukushka.mp3"

class ViewController: UIViewController {

    @IBOutlet weak var tblMenu: UITableView!
    
    let arrMenu = ["Play Music MP3 File From a Remote URL", "Add Playback Slider to AVPlayer", "Add Periodic Time Observer to Update Music Playback Slider"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell.selectionStyle = .none
            cell.textLabel?.text = arrMenu[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            commonMethods().navigateToVC(remoteURLaudioVC.self, hostController: self)
        case 1:
            commonMethods().navigateToVC(playerWithSliderVC.self, hostController: self)
        case 2:
            commonMethods().navigateToVC(playerWithTimeValuesVC.self, hostController: self)
        default:
            break
        }
    }
}

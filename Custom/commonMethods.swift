//
//  commonMethods.swift
//  usingAVPlayer
//
//  Created by Apple on 25/12/23.
//

import Foundation
import UIKit

class commonMethods {
    func navigateToVC<T: UIViewController>(_ targetController: T.Type, hostController: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: String(describing: targetController)) as? T else {return}
        hostController.navigationController?.pushViewController(vc, animated: true)
    }
}

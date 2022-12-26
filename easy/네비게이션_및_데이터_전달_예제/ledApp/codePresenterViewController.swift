//
//  codePresenterViewController.swift
//  ledApp
//
//  Created by 정상훈 on 2022/12/26.
//

import UIKit

class codePresenterViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            nameLabel.text = name
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func tabBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}

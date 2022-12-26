//
//  SegPresentViewController.swift
//  ledApp
//
//  Created by 정상훈 on 2022/12/26.
//

import UIKit

class SegPresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func tabBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}

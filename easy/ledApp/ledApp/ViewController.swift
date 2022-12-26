//
//  ViewController.swift
//  ledApp
//
//  Created by 정상훈 on 2022/12/26.
//

/**
 배운점
 1. UI -> 스택뷰로 묶기
 2. 텍스트 필드 -> 한줄만 가능 (여러줄 시 텍스트 뷰)
 3. 에셋 이미지 24, 48, 72 사이즈 이미지
 */

import UIKit

class ViewController: UIViewController, LEDSettingDelegate{

    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
        // Do any additional setup after loading the view.
    }
    
    //세그웨이로 화면전환 했기에 prepare 이용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textColor = self.contentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }

    func changeSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
}


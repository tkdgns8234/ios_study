//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 정상훈 on 2022/12/26.
//

/*
 배운 점
 - UIKit -> 화면 구성 요소가 포함된 프레임워크
 - UIView -> UI와 관련된 뷰들의 부모 타입
 - UIViewController -> 화면을 관리하는 단위
 - AutoLayout -> 제약조건을 이용해 뷰를 그리는것
 - contents hugging, compression resistance-> 일부 UI 요소 (텍스트 뷰, 버튼 등은 휴깅 우선순위가 존재, 우선순위에따라 제약 설정 시 크기가 변경 됨
 - 스토리 보드와 스위프트 파일 UI 연결 시 우클릭 -> 끌어당기기로 연결
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    private let quotes = [
        Quote(contents: "죽음을 두려워하는 나머지 삶을 시작조차 못하는 사람이 많다", name: "벤다이크"),
        Quote(contents: "나는 나 자신을 빼 놓고는 모두 안다.", name: "비용"),
        Quote(contents: "편견이란 실효성이 없는 의견이다.", name: "암브로스 빌"),
        Quote(contents: "분노는 바보들의 가슴속에서만 살아간다.", name: "아인슈타인")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tabQuoteGenerator(_ sender: Any) {
        let random = Int(arc4random_uniform(UInt32(quotes.count)))
        let quote = quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
        
    }
}


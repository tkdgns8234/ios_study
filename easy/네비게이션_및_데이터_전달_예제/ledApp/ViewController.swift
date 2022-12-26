//
//  ViewController.swift
//  ledApp
//
//  Created by 정상훈 on 2022/12/26.
//

/**
 - Content View Controller
 일반적인 UI 요소들
 
 - Container View Controller
 하나이상의 child view controller 를 가짐, 관리하고 레이아웃 화면 전환을 담당
 ex) Navigation Controller, TabBar Controller
 
 ios 화면 전환 방식
 스토리보드, 소스코드 이용한 방식
 - view Controller의 뷰 위에 다른 뷰를 가져와 바꿔치기 ->  되도록 지양, 메모리 누수 위험
 - View Controller에서 다른 ViewController를 호출해서 전환하기 (프레젠테이션 방식) present 메소드 이용
 - Navigation Controller 사용하기 -> 스택 형태로 자식 뷰 컨트롤러들을 관리(네비게이션 스택)
 - 화면 전환용 객체 세그웨이 를 사용하여 화면 전환하기 세그웨이 -> 두개의 뷰 컨트롤러 사이 연결된 화면전환 객체(스토리보드 이용)
 
 View Controller 생명주기
 ios 시스템에의해 호출
 appearing appeared disappearing disappeared
 
 viewDidLoad()
 뷰 컨트롤러의 모든 뷰들이 메모리에 로드됐을 때 호출 (한번)
 viewWillAppear()
 뷰가 뷰 계층에 추가되고, 화면에 보이기 직전 매번 호출 ( == onResume)
 viewDidAppear()
 뷰컨트롤러의 뷰가 뷰 계층에 추가된 후 호출됨
 viewWillDisappear()
 뷰 컨트롤러의 뷰가 뷰 계층에서 사라지기 전에 호출됨
 최종 데이터 저장작업
 viewDidDisappear()
 뷰가 뷰 계층에서 사라진 뒤 호출
 
 데이터 전달
 1. 뷰컨트롤러 인스턴스화 되면 프로퍼티에 값을 설정하는 방법
 2. 세그웨이 이용 시 prepare 이용
 3. 델리게이트 패턴 이용 콜백
 */

import UIKit

class ViewController: UIViewController, SendDataDelegate{
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabCodePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController
        else {return}
        // viewcontroller 이동 시 as? 형태로 다운캐스팅 시 프로퍼티에 직접 접근 가능
        viewController.name = "jsh"
        viewController.delegate = self
        
        print("type = \(type(of: viewController))")
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func tabCodePresentButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "codePresenterViewController") as? codePresenterViewController else { return }
        
        viewController.name = "jsh"
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("type= \(type(of: segue))")
    }
    
    func sendData(name: String) {
        self.nameLabel.text = name
    }
}


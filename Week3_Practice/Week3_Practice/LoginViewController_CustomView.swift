//
//  LoginViewController_CustomView.swift
//  Week3_Practice
//
//  Created by YOUJIM on 4/24/24.
//

import UIKit

final class LoginViewController_CustomView: UIViewController {
    
    
    // MARK: - rootView 선언
    /// 보통은 originView 또는 rootView로 많이 사용함
    
    private let rootView = LoginView()
    
    
    // MARK: - override func loadView()
    /// loadView는 컨트롤러가 관리하는 뷰를 만드는 역할을 함
    /// loadView가 뷰를 만들고 메모리에 올리면 viewDidLoad가 호출됨
    
    
    override func loadView() {
        self.view = rootView
    }
    
    
    // MARK: - override func viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setTarget()
    }
    
    
    // MARK: - setTarget()
    
    final private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(didLoginButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - final private func didLoginButtonTapped()
    
    @objc
    final private func didLoginButtonTapped() {
        print("WelcomVC 짜잔~")
    }
}

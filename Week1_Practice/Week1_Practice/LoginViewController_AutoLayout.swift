//
//  LoginViewController_AutoLayout.swift
//  Week1_Practice
//
//  Created by YOUJIM on 4/6/24.
//

import UIKit


class LoginViewController_AutoLayout: UIViewController {
    
    
    // MARK: UIComponent
    
    private let carrotLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .subhead01
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = .subhead04
        //textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 52)) // 아이디 텍스트 왼쪽 여백 생성
        //textField.leftViewMode = .always // 아이디 텍스트 왼쪽 여백 적용
        textField.backgroundColor = .gray002 // 배경색 적용
        textField.layer.cornerRadius = 3 // 테두리 둥글게
        textField.autocorrectionType = .no // 수정 제안 끄도록 설정
        textField.spellCheckingType = .no
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = .subhead04
        //textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 52)) // 아이디 텍스트 왼쪽 여백 생성
        //textField.leftViewMode = .always // 아이디 텍스트 왼쪽 여백 적용
        textField.backgroundColor = .gray002 // 배경색 적용
        textField.layer.cornerRadius = 3 // 테두리 둥글게
        textField.autocorrectionType = .no // 수정 제안 끄도록 설정
        textField.spellCheckingType = .no
        
        textField.isSecureTextEntry = true // 비밀번호 노출되지 않도록 설정
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal) // 버튼 타이틀 내용 설정
        button.setTitleColor(.white, for: .normal) // 버튼 타이틀 색 설정
        button.titleLabel?.font = .subhead01 // 버튼 타이틀 폰트 설정
        button.backgroundColor = .primaryColor // 버튼 배경색 설정
        button.layer.cornerRadius = 6 // 테두리 둥글게 설정
        button.addTarget(self, action: #selector(didLoginButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    
    // MARK: functions
    
    private func setUI() {
        self.view.backgroundColor = .white
    }
    
    private func setLayout() {
        [carrotLabel, idTextField, passwordTextField, loginButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([carrotLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 161),
                                     carrotLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40)
                                    ])
        NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: self.carrotLabel.bottomAnchor, constant: 71),
                                     idTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     idTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 20),
                                     idTextField.heightAnchor.constraint(equalToConstant: 52)
                                    ])
        NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: self.idTextField.bottomAnchor, constant: 7),
                                     passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52)
                                    ])
        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 35),
                                     loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
                                     loginButton.heightAnchor.constraint(equalToConstant: 58)
                                    ])
    }
    
    @objc
    private func didLoginButtonTapped() {
        presentToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalTransitionStyle = .coverVertical
        welcomeVC.modalPresentationStyle = .fullScreen
        
        welcomeVC.userID = idTextField.text // welcomeVC에 현재 VC id 텍스트필드 값 주입
        
        self.present(welcomeVC, animated: true) // 화면 전환
    }
}

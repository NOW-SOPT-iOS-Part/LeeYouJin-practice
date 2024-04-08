//
//  LoginViewController_Snapkit.swift
//  Week1_Practice
//
//  Created by YOUJIM on 4/6/24.
//

import UIKit

import SnapKit


class LoginViewController_Snapkit: UIViewController {
    
    
    // MARK: UIComponent
    
    private let carrotLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 114, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .subhead01
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 229, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = .subhead04
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 52)) // 아이디 텍스트 왼쪽 여백 생성
        textField.leftViewMode = .always // 아이디 텍스트 왼쪽 여백 적용
        textField.backgroundColor = .gray002 // 배경색 적용
        textField.layer.cornerRadius = 3 // 테두리 둥글게
        textField.autocorrectionType = .no // 수정 제안 끄도록 설정
        textField.spellCheckingType = .no
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 288, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = .subhead04
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 52)) // 아이디 텍스트 왼쪽 여백 생성
        textField.leftViewMode = .always // 아이디 텍스트 왼쪽 여백 적용
        textField.backgroundColor = .gray002 // 배경색 적용
        textField.layer.cornerRadius = 3 // 테두리 둥글게
        textField.autocorrectionType = .no // 수정 제안 끄도록 설정
        textField.spellCheckingType = .no
        
        textField.isSecureTextEntry = true // 비밀번호 노출되지 않도록 설정
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 58))
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
        setUI()
        setLayout()
    }
    
    
    // MARK: functions
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        [
            carrotLabel,
            idTextField,
            passwordTextField,
            loginButton
        ].forEach { view.addSubview($0) }
        
        carrotLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(114)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(carrotLabel.snp.bottom).offset(71)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(71)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
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

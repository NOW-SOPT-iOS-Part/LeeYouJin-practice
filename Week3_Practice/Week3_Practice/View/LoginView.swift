//
//  LoginView.swift
//  Week3_Practice
//
//  Created by YOUJIM on 4/24/24.
//

import UIKit

import SnapKit


final class LoginView: UIView {
    
    
    // MARK: - override init(frame: CGRect)
    /// UIView를 상속받은 Custom Class를 코드로 구현할 때 사용하는 생성자
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    // MARK: - required init?(coder: NSCoder)
    /// UIView와 UIViewController가 NSCoding 프로토콜을 채택하고 있어 생성자의 재정의가 필수적임
    /// 필수적 재정의를 알려주기 위해 required 키워드를 붙인 상태로 선언
    /// @available(*, unavailable)를 붙이지 않으면 런타임 시 메소드가 호출되어 앱이 꺼질 수도 있음
    /// 비가용성 정의라고 부르고, 이렇게 하면 컴파일 시 에러를 발생시켜 개발자가 미리 체크 가능
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Components
    /// ViewController가 CustomView에 접근하게 하기 위해 private 키워드를 지워줌
    
    let carrotLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 114, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .subhead01
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 229, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = .subhead04
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 52)) // 아이디 텍스트 왼쪽 여백 생성
        textField.leftViewMode = .always // 아이디 텍스트 왼쪽 여백 적용
        textField.backgroundColor = UIColor.gray200 // 배경색 적용
        textField.layer.cornerRadius = 3 // 테두리 둥글게
        textField.autocorrectionType = .no // 수정 제안 끄도록 설정
        textField.spellCheckingType = .no
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 288, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = .subhead04
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 52)) // 아이디 텍스트 왼쪽 여백 생성
        textField.leftViewMode = .always // 아이디 텍스트 왼쪽 여백 적용
        textField.backgroundColor = UIColor.gray200 // 배경색 적용
        textField.layer.cornerRadius = 3 // 테두리 둥글게
        textField.autocorrectionType = .no // 수정 제안 끄도록 설정
        textField.spellCheckingType = .no
        
        textField.isSecureTextEntry = true // 비밀번호 노출되지 않도록 설정
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 58))
        button.setTitle("로그인하기", for: .normal) // 버튼 타이틀 내용 설정
        button.setTitleColor(.white, for: .normal) // 버튼 타이틀 색 설정
        button.titleLabel?.font = .subhead01 // 버튼 타이틀 폰트 설정
        button.backgroundColor = UIColor.primary001 // 버튼 배경색 설정
        button.layer.cornerRadius = 6 // 테두리 둥글게 설정
        
        return button
    }()
    
    
    // MARK: - setLayout()
    
    private func setLayout() {
        [
            carrotLabel,
            idTextField,
            passwordTextField,
            loginButton
        ].forEach { self.addSubview($0) }
        
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
}

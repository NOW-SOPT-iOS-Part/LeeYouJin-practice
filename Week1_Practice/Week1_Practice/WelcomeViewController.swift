//
//  WelcomeViewController.swift
//  Week1_Practice
//
//  Created by YOUJIM on 4/3/24.
//

import UIKit


class WelcomeViewController: UIViewController {
    
    
    // MARK: UIComponent
    
    public var userID: String?
    
    private let carrotImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "img_login_carrot") // imageView 안에 들어갈 image 설정
        imageView.contentMode = .scaleAspectFit // 비율 프레임에 맞게 조정
        
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 295, width: 175, height: 60)) // 닉네임 길이 생각해서 label 길이 약간 늘림
        label.text = "???님\n반가워요!" // 나중에 bindID 함수에서 텍스트 변경
        label.font = .head01
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead01
        button.backgroundColor = .primaryColor
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(didMainButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var againLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.gray300, for: .normal)
        button.titleLabel?.font = .subhead01
        button.backgroundColor = .gray200
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(didAgainLoginButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        setUI()
        setLayout()
        bindID()
    }
    
    
    // MARK: Functions
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        [
            carrotImageView,
            welcomeLabel,
            mainButton,
            againLoginButton
        ].forEach { view.addSubview($0) }
    }
    
    private func bindID() {
        guard let userText = userID else { return }
        
        self.welcomeLabel.text = "\(userText)님\n반가워요!"
    }
    
    @objc
    private func didMainButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc
    private func didAgainLoginButtonTapped() {
        self.dismiss(animated: true)
    }
}

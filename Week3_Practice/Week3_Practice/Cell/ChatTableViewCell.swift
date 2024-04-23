//
//  ChatTableViewCell.swift
//  Week3_Practice
//
//  Created by YOUJIM on 4/24/24.
//

import UIKit

import SnapKit
import Then

class ChatTableViewCell: UITableViewCell {
    
    
    // MARK: - Identifier
    /// 각 셀을 구분하기 위한 식별자 등록
    /// 전역 변수로 선언
    
    static let identifier = "ChatTableViewCell"
    
    
    // MARK: - Component
    
    final private let profileImageView = UIImageView()
    
    final private let nameLabel: UILabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
    }
    
    final private let placeLabel: UILabel = UILabel().then {
        $0.textColor = UIColor(red: 156, green: 156, blue: 156, alpha: 1)
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Bold", size: 12)
    }
    
    final private let chatLabel: UILabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    final private let itemImageView = UIImageView()

    // MARK: - override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    /// 처음에 init만 작성하면 에러 발생
    /// Fix 눌러서 required init 추가하기
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    
    // MARK: - required init?(coder: NSCoder)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setLayout()
    
    final private func setLayout() {
        [profileImageView, nameLabel, placeLabel, chatLabel, itemImageView].forEach {
            contentView.addSubview($0)
        }
        
        profileImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.top.equalTo(nameLabel).offset(2)
        }
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        itemImageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }
}


extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        itemImageView.image = chatData.itemImg
    }
}

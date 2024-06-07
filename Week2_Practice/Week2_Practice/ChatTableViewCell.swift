//
//  ChatTableViewCell.swift
//  Week2_Practice
//
//  Created by YOUJIM on 4/20/24.
//

import UIKit

import SnapKit
import Then

class ChatTableViewCell: UITableViewCell {
    
    
    // MARK: Idenfifier
    
    static let id = "chatTableViewCell"
    
    
    // MARK: Components
    
    let profileImageView: UIImageView =  UIImageView().then {
        $0.image = .icProfile
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    private let nameLabel: UILabel = UILabel().then {
        $0.text = "사람이름"
        $0.textColor = .black
        $0.font = .subhead03
    }
    
    private let placeLabel: UILabel = UILabel().then {
        $0.text = "동이름"
        $0.textColor = .gray200
        $0.font = .info
    }
    
    private let chatLabel: UILabel = UILabel().then {
        $0.text = "채팅내용"
        $0.textColor = .black
        $0.font = .subhead05
    }
    
    let productImageView: UIImageView = UIImageView().then {
        $0.image = .icSample
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    // MARK: Init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: setLayout
    
    private func setLayout() {
        self.backgroundColor = .white
        
        [
            profileImageView, nameLabel, placeLabel, chatLabel, productImageView
        ].forEach { self.contentView.addSubview($0) }
        
        profileImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView).offset(0.5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        placeLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        productImageView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(16)
            $0.width.height.equalTo(40)
        }
    }
}

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        productImageView.image = chatData.itemImg
    }
}

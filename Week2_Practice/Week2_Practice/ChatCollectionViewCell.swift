//
//  ChatCollectionViewCell.swift
//  Week2_Practice
//
//  Created by YOUJIM on 4/20/24.
//

import UIKit

import SnapKit
import Then

class ChatCollectionViewCell: UICollectionViewCell {
    
    
    static let id = "chatCollectionViewCell"
    
    
    private let productImageView: UIImageView = UIImageView().then {
        $0.image = .profile1
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    private let heartButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "heart"), for: .normal)
        $0.tintColor = .red
    }
    
    private let nameLabel: UILabel = UILabel().then {
        $0.text = "물건이름"
        $0.textColor = .black
        $0.font = .subhead04
    }
    
    private let priceLabel: UILabel = UILabel().then {
        $0.text = "nnn원"
        $0.textColor = .accent
        $0.font = .subhead03
    }
    
    
    
    // MARK: Init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: setLayout
    
    private func setLayout() {
        self.backgroundColor = .white
        
        [
            productImageView, nameLabel, priceLabel, heartButton
        ].forEach { self.contentView.addSubview($0) }
        
        productImageView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }
        
        heartButton.snp.makeConstraints {
            $0.bottom.equalTo(productImageView.snp.bottom).inset(8)
            $0.trailing.equalTo(productImageView.snp.trailing).inset(8)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.top.equalTo(productImageView).offset(4)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
    }
}

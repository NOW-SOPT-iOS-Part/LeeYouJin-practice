//
//  ScrollViewController.swift
//  Week1_Practice
//
//  Created by YOUJIM on 4/6/24.
//

import UIKit

class ScrollViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false

        return scrollView
    }()
    
    private let contentView = UIView()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        setUpLayout()
    }
    
    private func setUpUI() {
        view.backgroundColor = .clear
        navigationController?.hidesBarsOnSwipe = true // 스와이프할 때 네비게이션 바 안보이게 해주는 코드
    }
    
    private func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalTo(337)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(redView.snp.trailing)
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalTo(337)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalTo(337)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalTo(337)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
    }
}

//
//  LoginViewController_CustomView.swift
//  Week2_Practice
//
//  Created by YOUJIM on 4/20/24.
//

import UIKit

import SnapKit


final class LoginViewController_CustomView: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
}

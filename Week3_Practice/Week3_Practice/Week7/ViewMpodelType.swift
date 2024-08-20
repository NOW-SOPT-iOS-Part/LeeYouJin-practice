//
//  ViewMpodelType.swift
//  Week3_Practice
//
//  Created by YOUJIM on 5/25/24.
//


import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}

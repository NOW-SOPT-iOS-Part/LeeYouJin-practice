//
//  ItemModel.swift
//  Week2_Practice
//
//  Created by YOUJIM on 4/20/24.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel
        ]
    }
}

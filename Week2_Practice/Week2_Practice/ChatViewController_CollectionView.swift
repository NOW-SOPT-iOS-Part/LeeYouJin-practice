//
//  ChatViewController_CollectionView.swift
//  Week2_Practice
//
//  Created by YOUJIM on 4/20/24.
//

import UIKit

class ChatViewController_CollectionView: UIViewController {
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    private let chatList = ChatModel.dummy()
    
    private let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())


    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setRegister()
        setDelegate()
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setRegister() {
        collectionView.register(
            ChatCollectionViewCell.self,
            forCellWithReuseIdentifier: ChatCollectionViewCell.id
        )
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ChatViewController_CollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let screenWidth = UIScreen.main.bounds.width
                  let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
                  return CGSize(width: doubleCellWidth / 2, height: 198)
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return carrotLineSpacing
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return carrotInterItemSpacing
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          return carrotInset
      }
}


extension ChatViewController_CollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

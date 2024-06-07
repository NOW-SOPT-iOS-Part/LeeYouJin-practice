//
//  ChatViewController_TableView.swift
//  Week2_Practice
//
//  Created by YOUJIM on 4/20/24.
//

import UIKit

class ChatViewController_TableView: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private let chatList = ChatModel.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setRegister()
        setDelegate()
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setRegister() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.id)
    }

    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension ChatViewController_TableView: UITableViewDelegate, UITableViewDataSource {
    
    // 몇개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 셀 높이 어떻게 정해줄거야?
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    // 어떤 셀 보여줄거야?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.id,
            for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        
        cell.dataBind(chatList[indexPath.row])
        
        return cell
    }
}

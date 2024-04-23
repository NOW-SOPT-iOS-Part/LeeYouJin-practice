//
//  ChatViewController.swift
//  Week3_Practice
//
//  Created by YOUJIM on 4/24/24.
//

import UIKit

import SnapKit


class ChatViewController: UIViewController {
    
    
    // MARK: - tableView
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let dummy = ChatModel.dummy()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setDelegate()
        register()
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    
    // MARK: - setDelegate()
    /// 셀의 높이, 개수, 클릭했을 때의 작업 등등 ,,, 을 커스터마이징하고 원하는 방식으로 동작시키게 하기 위해 delegate 선언
    /// 각각 UITableViewDelegate와 UITableViewDataSource에게 역할 위임
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK: - register()
    /// register() 함수를 통해 셀을 등록함
    /// 셀과 해당 셀의 식별자를 register() 함수의 인자로 넣어줌
    
    private func register() {
        tableView.register(ChatTableViewCell.self,
                           forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
/// UITableViewDelegete: 선택사항 관리, header와 footer, 셀 삭제와 재정렬 등 TableView에서 일어나는 다양한 액션 처리
/// UITableViewDataSource: 데이터를 수신해 뷰 처리

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    /// 셀 각각의 높이를 반환
    /// indexPath로 각각의 높이도 설정해 반환 가능
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    /// UITableViewDelegate의 필수 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    /// UITableViewDataSource의 필수 메소드
    /// .dequeueReusableCell은 재사용 큐에서 필요한 cell을 dequeue해주는 함수임
    /// 재사용 큐 안에서 구별하기 위해 withIdentifier로 identifier 받아냄
    /// 행 구별을 위해 for로 indexPath를 받아냄
    /// - indexPath는 indexPath.row와 indexPath.section으로 구분됨
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.identifier,
            for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        
        cell.dataBind(dummy[indexPath.row])
        
        return cell
    }
}

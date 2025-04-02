//
//  PlayersListViewController.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 20.02.25.
//

import UIKit
import SnapKit

class PlayersListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PlayersListCell.self, forCellReuseIdentifier: PlayersListCell.identifier)
        return table
    }()
    
    private var players: [Player] = [
        Player(number: 1, image: UIImage(systemName: "person.fill"), name: "Malr1ne", matches: "29-11", usp: "7.46"),
        Player(number: 2, image: UIImage(systemName: "person.fill"), name: "Skiter", matches: "29-11", usp: "6.27"),
        Player(number: 3, image: UIImage(systemName: "person.fill"), name: "Nightfall", matches: "19-12", usp: "5.65"),
        Player(number: 4, image: UIImage(systemName: "person.fill"), name: "DM", matches: "21-15", usp: "5.61"),
        Player(number: 5, image: UIImage(systemName: "person.fill"), name: "ATF", matches: "29-11", usp: "5.38"),
        Player(number: 6, image: UIImage(systemName: "person.fill"), name: "Payk", matches: "14-17", usp: "5.27"),
        Player(number: 7, image: UIImage(systemName: "person.fill"), name: "Lorenof", matches: "19-12", usp: "5.19"),
        Player(number: 8, image: UIImage(systemName: "person.fill"), name: "Crystallis", matches: "21-15", usp: "5.17")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Players"
        view.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayersListCell.identifier, for: indexPath) as? PlayersListCell else {
            return UITableViewCell()
        }
        
        let player = players[indexPath.row]
        cell.configure(with: player)
        
        return cell
    }
}

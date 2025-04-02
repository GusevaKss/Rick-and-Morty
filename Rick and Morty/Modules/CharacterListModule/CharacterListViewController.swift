//
//  CharacterListViewController.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 28.10.24.
//

import UIKit
enum CharacterListType {
    case RickMorty
    case AdvTime
}


class CharacterListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var characters = [CharacterListItem]()
    private let network: CharactersNetworkProtocol
    private let listType: CharacterListType
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 150
        return tableView
    }()
    
    
    init(network: CharactersNetworkProtocol, listType: CharacterListType) {
        self.network = network
        self.listType = listType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CharacterListViewController loaded")
        
        setupUI()
        fetchCharacterList()
    }
    
    private func setupUI() {
        navigationItem.title = "Characters"
        
        view.addSubview(tableView)
        tableView.register(CharacterListCell.self, forCellReuseIdentifier: CharacterListCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    private func fetchCharacterList() {
        network.fetchCharacterList { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching characters: \(error.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListCell.identifier, for: indexPath) as? CharacterListCell else {
            return UITableViewCell()
        }
        
        let character = characters[indexPath.row]
        cell.configure(with: character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let selectedCharacter = characters[indexPath.row]
        if let characterID = selectedCharacter.id {
            let assembly = CharacterDetailAssembly()
            switch(listType) {
            case .RickMorty:
                let detailViewController = assembly.buildR(with: characterID)
                navigationController?.pushViewController(detailViewController, animated: true)
            case .AdvTime:
                let detailViewController = assembly.buildA(with: characterID)
                navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
    }
}

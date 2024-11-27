//
//  CharacterListViewController.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 28.10.24.
//

import UIKit

class CharacterListViewController: UITableViewController {
    
    private var characters = [CharacterListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CharacterDetailViewController loaded")
        
        setupUI()
        fetchCharacterList()
    }
    
    private func setupUI() {
        tableView.register(CharacterListCell.self, forCellReuseIdentifier: CharacterListCell.identifier)
        navigationItem.title = "Characters"
        
        tableView.rowHeight = 150
    }
    
    private func fetchCharacterList() {
        NetworkService.shared.fetchCharacterList { [weak self] result in
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListCell.identifier, for: indexPath) as? CharacterListCell else {
            return UITableViewCell()
        }
        
        let character = characters[indexPath.row]
        cell.configure(with: character)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        let detailVC = CharacterDetailViewController()
        detailVC.characterID = selectedCharacter.id
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

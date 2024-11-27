//
//  CharacterDetailViewController.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 25.11.24.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var characterID: Int?
    
    private var characterDetail: CharacterDetail?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCharacterDetail()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        view.addSubview(speciesLabel)
        view.addSubview(genderLabel)
        view.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            speciesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 10),
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func fetchCharacterDetail() {
        guard let characterID = characterID else { return }
        
        NetworkService.shared.fetchCharacterDetails(id: characterID) { [weak self] result in
            switch result {
            case .success(let characterDetail):
                self?.characterDetail = characterDetail
                DispatchQueue.main.async {
                    self?.updateUI()
                }
            case .failure(let error):
                print("Error fetching character details: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateUI() {
        guard let character = characterDetail else { return }
        
        nameLabel.text = character.name
        statusLabel.text = "Status: \(character.status ?? "N/A")"
        speciesLabel.text = "Species: \(character.species ?? "N/A")"
        genderLabel.text = "Gender: \(character.gender ?? "N/A")"
        locationLabel.text = "Location: \(character.location?.name ?? "N/A")"
        
        if let imageUrl = character.image, let url = URL(string: imageUrl) {
            imageView.loadImage(from: url)
        }
    }
}

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}

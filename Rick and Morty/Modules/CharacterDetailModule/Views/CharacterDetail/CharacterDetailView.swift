//
//  CharacterDetailView.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 25.11.24.
//

import UIKit

class CharacterDetailView: UIView {
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()

    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let speciesLabel = UILabel()
    private let typeLabel = UILabel()
    private let genderLabel = UILabel()
    private let originLabel = UILabel()
    private let locationLabel = UILabel()
    private let episodesLabel = UILabel()
    private let createdLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)

        contentStackView.axis = .vertical
        contentStackView.spacing = 16
        contentStackView.alignment = .leading
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),

            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -32)
        ])

        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addArrangedSubview(imageView)

        let labels = [nameLabel, statusLabel, speciesLabel, typeLabel, genderLabel, originLabel, locationLabel, episodesLabel, createdLabel]
        labels.forEach { label in
            label.font = UIFont.systemFont(ofSize: 16)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            contentStackView.addArrangedSubview(label)
        }
    }

    func configure(with character: CharacterDetail) {
        let url = URL(string: character.image ?? "Unknown")
        imageView.kf.setImage(with: url)
        
        nameLabel.text = "Name: \(character.name ?? "Unknown")"
        statusLabel.text = "Status: \(character.status ?? "Unknown")"
        speciesLabel.text = "Species: \(character.species ?? "Unknown")"
        typeLabel.text = "Type: \(character.type ?? "Unknown")"
        genderLabel.text = "Gender: \(character.gender ?? "Unknown")"
        originLabel.text = "Origin: \(character.origin?.name ?? "Unknown")"
        locationLabel.text = "Location: \(character.location?.name ?? "Unknown")"
        episodesLabel.text = "Episodes: \(character.episode?.count ?? 0)"
        createdLabel.text = "Created: \(character.created ?? "Unknown")"
    }
}

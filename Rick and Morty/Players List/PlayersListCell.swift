//
//  PlayersListCell.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 20.02.25.
//

import UIKit
import SnapKit

class PlayersListCell: UITableViewCell {
    
    static let identifier = "PlayerCell"
    
    private let playerNumber: UILabel = {
        let number = UILabel()
        number.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return number
    }()
    
    private let playerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        name.textColor = .white
        return name
    }()
    
    private let matchesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let uspLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(playerNumber)
        contentView.addSubview(playerImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(matchesLabel)
        contentView.addSubview(uspLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        playerNumber.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        playerImage.snp.makeConstraints { make in
            make.left.equalTo(playerNumber.snp.left).offset(30)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(playerImage.snp.left).offset(75)
            make.centerY.equalToSuperview()
        }
        
        matchesLabel.snp.makeConstraints { make in
            make.left.equalTo(uspLabel.snp.right).offset(-100)
            make.centerY.equalToSuperview()
        }
        
        uspLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(with player: Player) {
        playerNumber.text = "\(player.number)"
        playerImage.image = player.image
        nameLabel.text = player.name
        matchesLabel.text = player.matches
        uspLabel.text = player.usp
    }
}

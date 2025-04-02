//
//  CharactersNetworkService.swift
//  Rick and Morty
//
//  Created by Kseniya Kovgorenya on 25.11.24.
//

import Foundation
import Alamofire

class CharactersNetworkService: CharactersNetworkProtocol {

    func fetchCharacterList(completion: @escaping (Result<[CharacterListItem], Error>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        AF.request(url)
            .validate()
            .responseDecodable(of: CharacterListResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func fetchCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetail, Error>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character/\(id)"
        AF.request(url)
            .validate()
            .responseDecodable(of: CharacterDetail.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

class CharactersNetworkServiceAdventureTime: CharactersNetworkProtocol {

    func fetchCharacterList(completion: @escaping (Result<[CharacterListItem], Error>) -> Void) {

        let adventureTimeCharacters = [
            CharacterListItem(id: 1, name: "Finn The Human", image: "https://i.pinimg.com/474x/68/fa/a7/68faa75d50a73338826f2a2d5d00f346.jpg"),
            CharacterListItem(id: 2, name: "Jake The Dog", image: "https://static1.cbrimages.com/wordpress/wp-content/uploads/2018/08/jake-the-dog-pure-css-adventure-time-wallpaper-by-sangreprimitiva-d5vs51f.jpg"),
            CharacterListItem(id: 3, name: "Princess Bubblegum", image: "https://i.pinimg.com/1200x/df/fa/a9/dffaa935253283502262fac3efc1edc7.jpg"),
            CharacterListItem(id: 4, name: "Ice King", image: "https://pyxis.nymag.com/v1/imgs/26d/311/5d77f80ae9cb39ad03ecbcfc57faf60472-31-ice-king.rsquare.w400.jpg"),
            CharacterListItem(id: 5, name: "Marceline", image: "https://i.redd.it/is-it-me-or-does-marceline-look-different-as-the-series-v0-wmaum5d3uh3b1.jpg?width=1080&format=pjpg&auto=webp&s=892ec3ea6b84dc0beb02c66d5ae6c15c1b00b506"),
            CharacterListItem(id: 6, name: "Lady Rainicorn", image: "https://i.pinimg.com/564x/74/d7/4c/74d74cb117d8d8ba0c51fb87e5c6ce2a.jpg"),
            CharacterListItem(id: 7, name: "BMO", image: "https://i.redd.it/6j6vqnpia9hc1.jpeg"),
            CharacterListItem(id: 8, name: "Lumpy Space Princess", image: "https://static.wikia.nocookie.net/adventuretimewithfinnandjake/images/7/73/LSP%27s_Phone.png/revision/latest?cb=20130724203924"),
            CharacterListItem(id: 9, name: "Earl of Lemongrab", image: "https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/09/lemongrab-feature.jpg"),
            CharacterListItem(id: 10, name: "Tree Trunks", image: "https://static1.personality-database.com/profile_images/389a8c7526ca4dd3bc3c1c3cbb3aeb4a.png")
        ]
        completion(.success(adventureTimeCharacters))
    }

    func fetchCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetail, Error>) -> Void) {
        let details = [
            1: CharacterDetail(
                id: 1,
                name: "Finn The Human",
                status: "Alive",
                species: "Human",
                type: "Hero",
                gender: "Male",
                origin: Location(name: "Land of Ooo", url: ""),
                location: Location(name: "Tree Fort", url: ""),
                image: "https://i.pinimg.com/474x/68/fa/a7/68faa75d50a73338826f2a2d5d00f346.jpg",
                episode: ["1", "2"],
                url: "https://i.pinimg.com/474x/68/fa/a7/68faa75d50a73338826f2a2d5d00f346.jpg",
                created: "2025-01-20T12:34:56.789Z"
            ),
            2: CharacterDetail(
                id: 2,
                name: "Jake The Dog",
                status: "Alive",
                species: "Dog",
                type: "Magical Dog",
                gender: "Male",
                origin: Location(name: "Land of Ooo", url: ""),
                location: Location(name: "Tree Fort", url: ""),
                image: "https://static1.cbrimages.com/wordpress/wp-content/uploads/2018/08/jake-the-dog-pure-css-adventure-time-wallpaper-by-sangreprimitiva-d5vs51f.jpg",
                episode: ["3", "4"],
                url: "https://static1.cbrimages.com/wordpress/wp-content/uploads/2018/08/jake-the-dog-pure-css-adventure-time-wallpaper-by-sangreprimitiva-d5vs51f.jpg",
                created: "2025-01-20T12:34:56.789Z"
            ),
            3: CharacterDetail(
                id: 3,
                name: "Princess Bubblegum",
                status: "Alive",
                species: "Candy Person",
                type: "Princess",
                gender: "Female",
                origin: Location(name: "Candy Kingdom", url: ""),
                location: Location(name: "Candy Kingdom", url: ""),
                image: "https://i.pinimg.com/1200x/df/fa/a9/dffaa935253283502262fac3efc1edc7.jpg",
                episode: ["5", "6"],
                url: "https://i.pinimg.com/1200x/df/fa/a9/dffaa935253283502262fac3efc1edc7.jpg",
                created: "2025-01-20T12:34:56.789Z"
            ),
            4: CharacterDetail(
                id: 4,
                name: "Ice King",
                status: "Unknown",
                species: "Wizard",
                type: "Villain",
                gender: "Male",
                origin: Location(name: "Ice Kingdom", url: ""),
                location: Location(name: "Ice Kingdom", url: ""),
                image: "https://pyxis.nymag.com/v1/imgs/26d/311/5d77f80ae9cb39ad03ecbcfc57faf60472-31-ice-king.rsquare.w400.jpg",
                episode: ["7", "8"],
                url: "https://pyxis.nymag.com/v1/imgs/26d/311/5d77f80ae9cb39ad03ecbcfc57faf60472-31-ice-king.rsquare.w400.jpg",
                created: "2025-01-20T12:34:56.789Z"
            ),
            5: CharacterDetail(
                id: 5,
                name: "Marceline",
                status: "Alive",
                species: "Vampire",
                type: "Musician",
                gender: "Female",
                origin: Location(name: "Land of Ooo", url: ""),
                location: Location(name: "Marceline's Cave", url: ""),
                image: "https://i.redd.it/is-it-me-or-does-marceline-look-different-as-the-series-v0-wmaum5d3uh3b1.jpg?width=1080&format=pjpg&auto=webp&s=892ec3ea6b84dc0beb02c66d5ae6c15c1b00b506",
                episode: ["9", "10"],
                url: "https://i.redd.it/is-it-me-or-does-marceline-look-different-as-the-series-v0-wmaum5d3uh3b1.jpg?width=1080&format=pjpg&auto=webp&s=892ec3ea6b84dc0beb02c66d5ae6c15c1b00b506",
                created: "2025-01-20T12:34:56.789Z"
            ),
            6: CharacterDetail(
                id: 6,
                name: "Lady Rainicorn",
                status: "Alive",
                species: "Rainicorn",
                type: "Companion",
                gender: "Female",
                origin: Location(name: "Land of Ooo", url: ""),
                location: Location(name: "Cloud Kingdom", url: ""),
                image: "https://i.pinimg.com/564x/74/d7/4c/74d74cb117d8d8ba0c51fb87e5c6ce2a.jpg",
                episode: ["11", "12"],
                url: "https://i.pinimg.com/564x/74/d7/4c/74d74cb117d8d8ba0c51fb87e5c6ce2a.jpg",
                created: "2025-01-20T12:34:56.789Z"
            ),
            7: CharacterDetail(
                id: 7,
                name: "BMO",
                status: "Alive",
                species: "Robot",
                type: "Game Console",
                gender: "Unknown",
                origin: Location(name: "Land of Ooo", url: ""),
                location: Location(name: "Tree Fort", url: ""),
                image: "https://i.redd.it/6j6vqnpia9hc1.jpeg",
                episode: ["13", "14"],
                url: "https://i.redd.it/6j6vqnpia9hc1.jpeg",
                created: "2025-01-20T12:34:56.789Z"
            ),
            8: CharacterDetail(
                id: 8,
                name: "Lumpy Space Princess",
                status: "Alive",
                species: "Lumpy Space Person",
                type: "Princess",
                gender: "Female",
                origin: Location(name: "Lumpy Space", url: ""),
                location: Location(name: "Lumpy Space", url: ""),
                image: "https://static.wikia.nocookie.net/adventuretimewithfinnandjake/images/7/73/LSP%27s_Phone.png/revision/latest?cb=20130724203924",
                episode: ["15", "16"],
                url: "https://static.wikia.nocookie.net/adventuretimewithfinnandjake/images/7/73/LSP%27s_Phone.png/revision/latest?cb=20130724203924",
                created: "2025-01-20T12:34:56.789Z"
            ),
            9: CharacterDetail(
                id: 9,
                name: "Earl of Lemongrab",
                status: "Unknown",
                species: "Lemon Person",
                type: "Earl",
                gender: "Male",
                origin: Location(name: "Lemon Kingdom", url: ""),
                location: Location(name: "Lemon Kingdom", url: ""),
                image: "https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/09/lemongrab-feature.jpg",
                episode: ["17", "18"],
                url: "https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/09/lemongrab-feature.jpg",
                created: "2025-01-20T12:34:56.789Z"
            ),
            10: CharacterDetail(
                id: 10,
                name: "Tree Trunks",
                status: "Alive",
                species: "Elephant",
                type: "Baker",
                gender: "Female",
                origin: Location(name: "Land of Ooo", url: ""),
                location: Location(name: "Tree Trunks' House", url: ""),
                image: "https://static1.personality-database.com/profile_images/389a8c7526ca4dd3bc3c1c3cbb3aeb4a.png",
                episode: ["19", "20"],
                url: "https://static1.personality-database.com/profile_images/389a8c7526ca4dd3bc3c1c3cbb3aeb4a.png",
                created: "2025-01-20T12:34:56.789Z"
            )
        ]

        if let detail = details[id] {
            completion(.success(detail))
        } else {
            let error = NSError(domain: "CharacterNotFound", code: 404, userInfo: [NSLocalizedDescriptionKey: "Character with ID \(id) not found"])
            completion(.failure(error))
        }
    }
}

//
//  DndApi.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/17/22.
//

import Combine
import Foundation

enum DndApiError: Error {
    case badUrl(String)
}


enum NetworkError: Error {
  case invalidRequestError(String)
  case transportError(Error)
  case serverError(statusCode: Int)
  case noData
  case decodingError(Error)
  case encodingError(Error)
}

class DndApi {

    var characters: AnyPublisher<Characters, Never> {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/classes") else { return Just<Characters>(Characters()).eraseToAnyPublisher()  }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Characters.self, decoder: JSONDecoder())
            .replaceError(with: Characters())
            .eraseToAnyPublisher()
    }

    func spells(for actor: Character, completion: @escaping (Result<Spells, NetworkError>) -> Void) {
        guard let url = URL(string: "https://www.dnd5eapi.co\(actor.url)/spells") else {
        completion(.failure(.invalidRequestError("URL invalid")))
        return
      }

      let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
          completion(.failure(.transportError(error)))
          return
        }

        if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
          completion(.failure(.serverError(statusCode: response.statusCode)))
          return
        }

        guard let data = data else {
          completion(.failure(.noData))
          return
        }

        do {
          let decoder = JSONDecoder()
          let object = try decoder.decode(Spells.self, from: data)
          completion(.success(object))
        }
        catch {
          completion(.failure(.decodingError(error)))
        }
      }

      task.resume()
    }

    func spell(for spell: Spell, completion: @escaping (Result<SpellDetail, NetworkError>) -> Void) {
        guard let url = URL(string: "https://www.dnd5eapi.co\(spell.url)") else {
        completion(.failure(.invalidRequestError("URL invalid")))
        return
      }

      let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
          completion(.failure(.transportError(error)))
          return
        }

        if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
          completion(.failure(.serverError(statusCode: response.statusCode)))
          return
        }

        guard let data = data else {
          completion(.failure(.noData))
          return
        }

        do {
          let decoder = JSONDecoder()
          let object = try decoder.decode(SpellDetail.self, from: data)
          completion(.success(object))
        }
        catch {
          completion(.failure(.decodingError(error)))
        }
      }

      task.resume()
    }

}

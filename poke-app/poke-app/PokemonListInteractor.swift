import Foundation

class PokemonListInteractor: PokemonListInteractorInputProtocol {
    
    weak var presenter: PokemonListInteractorOutputProtocol?
    
    func fetchPokemons() {
        let url = URL(string: "http://127.0.0.1:3000/pokemons")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.presenter?.didFailFetchingPokemons(error.localizedDescription)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.presenter?.didFailFetchingPokemons("No data received")
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                DispatchQueue.main.async {
                    self.presenter?.didFetchPokemons(result.data)
                }
            } catch {
                DispatchQueue.main.async {
                    self.presenter?.didFailFetchingPokemons(error.localizedDescription)
                }
            }
        }.resume()
    }
}

struct PokemonListResponse: Codable {
    let data: [Pokemon]
    let message: String
    let statusCode: Int
}

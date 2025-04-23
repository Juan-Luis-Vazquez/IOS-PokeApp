import Foundation

class PokemonListPresenter: PokemonListPresenterProtocol {
    
    weak var view: PokemonListViewProtocol?
    var interactor: PokemonListInteractorInputProtocol?
    var router: PokemonListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchPokemons()
    }
    
    func didSelectPokemon(_ pokemon: Pokemon) {
        router?.navigateToPokemonDetail(for: pokemon)
    }
}

extension PokemonListPresenter: PokemonListInteractorOutputProtocol {
    func didFetchPokemons(_ pokemons: [Pokemon]) {
        view?.showPokemons(pokemons)
    }
    
    func didFailFetchingPokemons(_ error: String) {
        view?.showError(error)
    }
}

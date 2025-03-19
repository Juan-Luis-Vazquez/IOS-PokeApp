import Foundation

//Presenter -> View
protocol PokemonListViewProtocol: AnyObject {
    func showPokemons(_ pokemons: [Pokemon])
    func showError(_ message: String)
}

// View -> Presenter
protocol PokemonListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectPokemon(_ pokemon: Pokemon)
}

//Presenter -> Interactor
protocol PokemonListInteractorInputProtocol: AnyObject {
    func fetchPokemons()
}

// Interactor -> Presenter
protocol PokemonListInteractorOutputProtocol: AnyObject {
    func didFetchPokemons(_ pokemons: [Pokemon])
    func didFailFetchingPokemons(_ error: String)
}

// Router
protocol PokemonListRouterProtocol: AnyObject {
    static func createPokemonListModule() -> PokemonListViewController
    func navigateToPokemonDetail(for pokemon: Pokemon)
}

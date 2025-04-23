import UIKit

class PokemonListRouter: PokemonListRouterProtocol {
    
    static func createPokemonListModule() -> PokemonListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PokemonListViewController") as! PokemonListViewController
        
        let presenter = PokemonListPresenter()
        let interactor = PokemonListInteractor()
        let router = PokemonListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToPokemonDetail(for pokemon: Pokemon) {
        print("Navigate to detail for \(pokemon.name)")
    }
}

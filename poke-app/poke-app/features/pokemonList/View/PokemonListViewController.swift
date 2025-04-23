import UIKit

class PokemonListViewController: UIViewController, PokemonListViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!

    var presenter: PokemonListPresenterProtocol?
    private var pokemons: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "PokemonListTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonCell")
    }
    
    func showPokemons(_ pokemons: [Pokemon]) {
        self.pokemons = pokemons
        tableView.reloadData()
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource methods
extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonListTableViewCell else {
            //Handle Error
            return UITableViewCell()
        }
        var pokemon = pokemons[indexPath.row]
        cell.pokemonName?.text = pokemon.name.capitalized
        cell.pokemonInfo?.text = pokemon.description ?? "No description"
        
        if(pokemon.image == nil){
            if let urlString = pokemon.sprite,
               let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, _, error in
                    guard let data = data, error == nil, let image = UIImage(data: data) else { return }
                    DispatchQueue.main.async {
                        pokemon.image = image
                        cell.pokemonImage?.image = pokemon.image
                    }
                }.resume()
            } else {
                cell.pokemonImage?.image = nil
            }
        } else {
            cell.pokemonImage?.image = pokemon.image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        presenter?.didSelectPokemon(pokemon)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Index path refers to cell
        return 180
    }
}

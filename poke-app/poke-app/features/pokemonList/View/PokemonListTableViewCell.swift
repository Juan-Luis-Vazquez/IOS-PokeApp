//
//  PokemonListTableViewCell.swift
//  poke-app
//
//  Created by Juan Vazquez on 20/03/25.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonInfo: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
          contentView.backgroundColor = .clear
          containerView.backgroundColor = .white
          containerView.layer.cornerRadius  = 10
        containerView.layer.borderWidth   = 1.5
          containerView.layer.borderColor   = UIColor.gray.cgColor
          containerView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

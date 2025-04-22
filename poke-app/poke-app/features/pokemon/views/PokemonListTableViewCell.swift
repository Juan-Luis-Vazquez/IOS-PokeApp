//
//  PokemonListTableViewCell.swift
//  poke-app
//
//  Created by Juan Vazquez on 20/03/25.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

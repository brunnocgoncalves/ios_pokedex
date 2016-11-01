//
//  PokeCell.swift
//  pokedex
//
//  Created by Brunno Goncalves on 29/10/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon){
        
        self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name.capitalized
        pokeImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
        
    }
    
}

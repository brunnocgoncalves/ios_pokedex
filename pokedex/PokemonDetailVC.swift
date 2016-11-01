//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Brunno Goncalves on 31/10/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var wightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var currentEvolImage: UIImageView!
    @IBOutlet weak var nextEvolImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
        pokeImage.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvolImage.image = UIImage(named: "\(pokemon.pokedexId)")
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

}

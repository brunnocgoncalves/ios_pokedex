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
    @IBOutlet weak var nextEvoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokemon.downloadPokemonDetail {
            
            self.updateUI()
            
        }
        
    }
    
    func updateUI(){
        
        nameLabel.text = pokemon.name.capitalized
        pokeImage.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvolImage.image = UIImage(named: "\(pokemon.pokedexId)")
        wightLabel.text = "\(pokemon.weight)"
        heightLabel.text = "\(pokemon.height)"
        attackLabel.text = "\(pokemon.attack)"
        defenseLabel.text = "\(pokemon.defense)"
        typeLabel.text = pokemon.type
        descLabel.text = pokemon.desc
        pokedexIdLabel.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvolutionId == 0{
            
            nextEvoLabel.text = "No evolutions available"
            nextEvolImage.isHidden = true
            
        } else{
            
            nextEvoLabel.text = pokemon.nextEvolutionTxt
            nextEvolImage.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            nextEvolImage.isHidden = false
            
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

}

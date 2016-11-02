//
//  Pekemon.swift
//  pokedex
//
//  Created by Brunno Goncalves on 29/10/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import Foundation

class Pokemon{
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _desc: String!
    private var _type: String!
    private var _defense: Int!
    private var _height: Int!
    private var _weight: Int!
    private var _attack: Int!
    
    var name: String{
        
        return _name
        
    }
    
    var pokedexId: Int{
        
        return _pokedexId
        
    }
    
    var desc: String{
        
        return _desc
        
    }
    
    var type: String{
        
        return _type
        
    }
    
    var defense: Int{
        
        return _defense

    }
    
    var height: Int{
        
        return _height
        
    }
    
    var weight: Int{
        
        return _weight
        
    }
    
    var attack: Int{
        
        return _attack
        
    }
    
    
    
    init(name: String, pokedexId: Int){
        
        self._name = name
        self._pokedexId = pokedexId
        
    }
    
}

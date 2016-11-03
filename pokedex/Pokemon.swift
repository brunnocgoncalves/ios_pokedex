//
//  Pekemon.swift
//  pokedex
//
//  Created by Brunno Goncalves on 29/10/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon{
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _desc: String!
    private var _type: String!
    private var _defense: Int!
    private var _height: Int!
    private var _weight: Int!
    private var _attack: Int!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionId: Int!
    private var _nextEvolutionLevel: Int!
    private var _pokemonURL: String!
    private var _descriptionURL: String!
    
    var nextEvolutionName: String{
        
        if _nextEvolutionName == nil{
            
            _nextEvolutionName = ""
            
        }
        
        return _nextEvolutionName
        
    }
    
    var nextEvolutionTxt: String{
        
        if _nextEvolutionTxt == nil{
            
            _nextEvolutionTxt = "Next Evolution: \(self.nextEvolutionName.capitalized) LVL \(self.nextEvolutionLevel)"
            
        }
        
        return _nextEvolutionTxt
        
    }
    
    var nextEvolutionId: Int{
        
        if _nextEvolutionId == nil{
            
            _nextEvolutionId = 0
            
        }
        
        return _nextEvolutionId
        
    }
    
    var nextEvolutionLevel: Int{
        
        if _nextEvolutionLevel == nil{
            
            _nextEvolutionLevel = 0
            
        }
        
        return _nextEvolutionLevel
        
    }
    
    var name: String{
        
        return _name
        
    }
    
    var pokedexId: Int{
        
        return _pokedexId
        
    }
    
    var desc: String{
        
        if _desc == nil{
            
            _desc = ""
            
        }
        
        return _desc
        
    }
    
    var type: String{
        
        if _type == nil{
            
            _type = ""
            
        }
        
        return _type
        
    }
    
    var defense: Int{
        
        if _defense == nil{
            
            _defense = 0
            
        }
        
        return _defense

    }
    
    var height: Int{
        
        if _height == nil{
            
            _height = 0
            
        }
        
        return _height
        
    }
    
    var weight: Int{
        
        if _weight == nil{
            
            _weight = 0
            
        }
        
        return _weight
        
    }
    
    var attack: Int{
        
        if _attack == nil{
            
            _attack = 0
            
        }
        
        return _attack
        
    }
    
    var pokemonURL: String{
        
        return _pokemonURL
        
    }
    
    
    
    init(name: String, pokedexId: Int){
        
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)"
        
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete){
        
        Alamofire.request(self._pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String{
                    
                    if let weightInt = Int(weight){
                        
                        self._weight = weightInt
                        
                    }
                    
                }
                
                if let height = dict["height"] as? String{
                    
                    if let heightInt = Int(height){
                        
                        self._height = heightInt
                        
                    }
                
                }
                
                if let attack = dict["attack"] as? Int{
                    
                    self._attack = attack
                    
                }
                
                if let defense = dict["defense"] as? Int{
                    
                    self._defense = defense
                    
                }
                
                if let types = dict["types"] as? [Dictionary<String, AnyObject>], types.count > 0 {
                    
                    for type in types{
                        
                        if let typeString = type["name"] as? String{
                        
                            if self._type == nil{
                            
                                self._type = typeString.capitalized
                            
                            } else{
                            
                                self._type! += "/\(typeString.capitalized)"
                            
                            }
                            
                        }
                        
                    }
                    
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, AnyObject>], descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] as? String{
                        
                        self._descriptionURL = url
                        
                        Alamofire.request("\(URL_BASE)\(url)").responseJSON { (response) in
                            
                            if let dictDesc = response.result.value as? Dictionary<String, AnyObject>{
                        
                                if let description = dictDesc["description"] as? String{
                                    
                                    self._desc = description
                                    
                                }
                                
                            }
                            
                            completed()
                            
                        }
                        
                    }
                    
                }
                
                if let evolutionArr = dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutionArr.count > 0{
                    
                    if let nextEvo = evolutionArr[0]["to"] as? String{
                        
                        if nextEvo.range(of: "mega") == nil{
                            
                            self._nextEvolutionName = nextEvo
                            
                            if let uri = evolutionArr[0]["resource_uri"] as? String{
                                
                                let newString = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoId = newString.replacingOccurrences(of: "/", with: "")
                                
                                if let nextEvoIdInt = Int(nextEvoId){
                                
                                    self._nextEvolutionId = nextEvoIdInt
                                
                                }
                                
                                if let lvlExist = evolutionArr[0]["level"] as? Int {
                                    
                                    self._nextEvolutionLevel = lvlExist
                                    
                                } else {
                                    
                                    self._nextEvolutionLevel = 0
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            completed()
            
        }
        
    }
    
}

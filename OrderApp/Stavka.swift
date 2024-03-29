//
//  Stavka.swift
//  
//

import UIKit

class Stavka: NSObject {
    
    var artikal:String
    var kolicina = 1
    var cena = 0
    
    var pijalok:Bool = false
    
    
    init(artikal:String, cena:Int,pijalok:Bool) {
        self.artikal = artikal
        self.cena = cena
        self.pijalok = pijalok
    }
    
    override var description: String{
        return "\(artikal) \(kolicina) x \(cena) = \(vkupnaCena()) "
    }
    
    func dodadiKolicina(){
        kolicina += 1
    }
    
    func vkupnaCena() -> Int {
        return cena * kolicina
    }
    
    func odzemiKolicina(){
        if kolicina > 0 {
            kolicina -= 1
        }
        
    }

}

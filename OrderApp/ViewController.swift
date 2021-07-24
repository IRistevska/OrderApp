//
//  ViewController.swift
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tabela: UITableView!
    var smetkahrana:[Stavka] = []
    var smetkapijaloci:[Stavka] = []
    
   
    @IBAction func platiButton(_ sender: Any) {
        showalert()
    }
   func reset(){
        for i in artikli{
            i.kolicina = 1
        }
        
        smetkahrana.removeAll()
        smetkapijaloci.removeAll()
        total()
        tabela.reloadData()
    }

    
    let artikli:[Stavka] = [
        Stavka(artikal: "хамбургер", cena: 150,pijalok:false),
        Stavka(artikal: "чизбургер", cena: 180, pijalok:false),
        Stavka(artikal: "Биг Мек", cena: 200,pijalok:false),
        Stavka(artikal: "чикен", cena: 150,pijalok:false),
        Stavka(artikal: "хот-дог", cena: 120,pijalok:false),
        Stavka(artikal: "тост", cena: 100,pijalok:false),
        Stavka(artikal: "кока-кола", cena: 60,pijalok:true),
        Stavka(artikal: "фанта", cena: 60,pijalok:true),
        Stavka(artikal: "вода", cena: 50,pijalok:true)]
    
    
    @IBAction func dodadiArtikal(sender:UIButton) {
        
        
        print(sender.tag)
        
   
        let momentalenArtikal = artikli[sender.tag]
        
        print(momentalenArtikal)
        
        
        if momentalenArtikal.pijalok {
        var postoi = false
            
            
            
            for stavka in smetkapijaloci {
                if momentalenArtikal == stavka {
                   postoi = true
                }
            }
    if postoi {
    momentalenArtikal.dodadiKolicina()
    } else {
    smetkapijaloci.append(momentalenArtikal)
            }
    }
        
       
        else{
           var postoi = false
            
            for stavka in smetkahrana {
                if stavka == momentalenArtikal {
                postoi = true
                }
            }
             if postoi {
            momentalenArtikal.dodadiKolicina()
           } else {
            smetkahrana.append(momentalenArtikal)
            }
    }
        
        print(smetkahrana)
        total()
//
        tabela.reloadData()
    
    }
    
    
    @IBOutlet var suma:UILabel!
 
    
    
    func total(){
        
        var vkupno = 0
        for stavka in smetkahrana {
            vkupno += stavka.vkupnaCena()
            
        }
        
        
        for stavka in smetkapijaloci {
            vkupno += stavka.vkupnaCena()
            
        }
        
        
        print(vkupno)
        
        suma.text = "\(vkupno) ден."
    }
    //
   
    
    


    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
     
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reset()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if section == 0 {
            return "Храна"
        }
        else{
            return "Пијалоци"
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return smetkahrana.count
        }
        else{
            return smetkapijaloci.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "stavkaCell", for: indexPath) as? StavkaTableViewCell

       
        if indexPath.section == 0{
            let stavka = smetkahrana[indexPath.row]
            cell?.labelaCell(stavka: stavka)
        }
        else{
            let stavka = smetkapijaloci[indexPath.row]
           
            cell?.labelaCell(stavka: stavka)
        }
        
        
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
   
        if indexPath.section == 0{
            let stavka = smetkahrana[indexPath.row]
            
            if stavka.kolicina == 1 {
                
                smetkahrana.remove(at: indexPath.row)
            }
            else {
                stavka.odzemiKolicina()
            }
        }
        
        else{
            let stavka = smetkapijaloci[indexPath.row]
            
            //        stavka.odzemiKolicina()
            if stavka.kolicina == 1 {
                
                smetkapijaloci.remove(at: indexPath.row)
            }
            else {
                stavka.odzemiKolicina()
            }}
        
        
        total()
        self.tabela.reloadData()
        
    }
    
    
    func showalert(){
      self.performSegue(withIdentifier: "smetkaSegue", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let destination = segue.destination as? SmetkaViewController {
            destination.smetkaHrana = smetkahrana
            destination.smetkaPijaloci = smetkapijaloci
          
            
        }
        
    }
    
    

}


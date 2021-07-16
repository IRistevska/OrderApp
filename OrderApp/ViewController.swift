//
//  ViewController.swift
//  7ca
//
//  Created by Martin Anchevski on 5/13/19.
//  Copyright © 2019 Martin Anchevski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tabela: UITableView!
    var smetkahrana:[Stavka] = []
    var smetkapijaloci:[Stavka] = []
    
    //koga go stiskam kopcheto plati ni se povikuva funkcijata(koja e definirana podolu) za da ne odnesi na vtoriot view controler
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

    //прво ги дефинирам артиклите , односно правам низа од објекти
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
    
    //додаваме акција и ја поврзуваме со сите копчиња и на секое копче поставуваме таг
    @IBAction func dodadiArtikal(sender:UIButton) {
        
        // го принтаме тагот на копчето кое е стиснато
        print(sender.tag)
        
   // во моментален артикал го сместуваме артиклот од копчето кое е притиснатo со соодветниот таг
        let momentalenArtikal = artikli[sender.tag]
        //принт на elementot koj e pritisnat
        print(momentalenArtikal)
        
        //пристапуваме до карактеристиката пијалок од артиклот кој е стиснат , ако пијалок=true значи постои пијалок , тогаш варијаблата postoi ја иницијализираме на false i ja izminuvame nizata smetkapijaloci {
        
        if momentalenArtikal.pijalok {
        var postoi = false
            
            // sporedba na artkli (na objekti)
            // ako artiklot koj e stisnat e ednakov na barem eden artikl vo smetka pijaloci togash postoi=true, ako postoi e true togash zgolemija kolicinata na toj artikl odnosno povikaj ja funkcijata dodadi kolicina, inaku ako ne e ist pijalok vo smetka pijaloci dodaj go artiklot koj e stisnat.
            
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
        
        // inaku postoi = false , stisnat e artikl hrana , zartoa postoi=false
        else{
           var postoi = false
            
            // ja izminuvame nizata smetkahrana , ako artiklot koj e stisnat e endakov na bilo koj artikl od nizata smetkahrana togash postoi e true i vlegva vo nov if-clouse i se zgolemuva kolicinata,ako ne momentalen artikl se dodava vo nizata smetkahrana , odnosno toa e nov razlicen artikl
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
        // ja pecatime nizata smetka hrana , odnosno site artikli koi treba da vlezat vo kelijata smetka hrana , koi se raspredeluvaat vo hrana
        print(smetkahrana)
        total()
//        let vkupno = total(smetka: smetka)
//        print(vkupno)
//        suma.text = "\(vkupno) den"
        
        //povtorno vcituvanje na site podatoci , i tie so se plus vo tabelata, reloat of data
        tabela.reloadData()
    
    }
    
    
    //definirame outlet i go povrzuvame so postavenata labela vo storibordot vo koja treba da se prikazuva vkupnata suma
    @IBOutlet var suma:UILabel!
 
    
    /* probna funkcija za kako da dobieme vkupna suma
     func test() {
        print("ova e test")
        let hamburger:Stavka = Stavka(artikal: "Hamburger", cena: 150,pijalok: false)
        print(hamburger)
        let cocaCola:Stavka = Stavka(artikal: "CocaCola", cena: 60,pijalok: true)
        print(cocaCola)
        let pomfrit:Stavka = Stavka(artikal: "Pomfrit", cena: 80,pijalok: false)
        print(pomfrit)
        hamburger.dodadiKolicina()
        print(hamburger)
        print(hamburger.vkupnaCena())
        
        var smetka:[Stavka] = []
        smetka.append(hamburger)
        smetka.append(cocaCola)
        smetka.append(pomfrit)
        print(smetka)
   //    print(total(smetka: smetka))
        print(t(smetka: smetka))
        let testSmetka:[Stavka] = []
        print(t(smetka: testSmetka))
    }

    */
    
    
    // funkcija za presmetuvanje na vkupna suma koja treba daa se plati i istata da se pojavi na labalata
    func total(){
        //definirame promenliva vkupno i ja inicijalizirame na 0 , gi izminuvame site artikli vo nizata smetkahrana i ja dodavame vkupnata cena na sekoj artikl
        var vkupno = 0
        for stavka in smetkahrana {
            vkupno += stavka.vkupnaCena()
            
        }
        
        // istoto go pravime i za smetka na pijaloci
        for stavka in smetkapijaloci {
            vkupno += stavka.vkupnaCena()
            
        }
        
        // ja printame sumata
        print(vkupno)
        // na labelata suma go lepime tekstot "\(vkupno) den"
        suma.text = "\(vkupno) ден."
    }
    //
   
    
    
 /* rekurzivna funkcija kako alternativa za presmetuvanje na vkupna suma koja treba da se pojavuva na labelata sum
     
     func t(smetka:[Stavka]) -> Int {
        if smetka.count == 0 {
            return 0
        }else {
            var temp = smetka
            let stavka = temp.removeLast()
            return stavka.vkupnaCena() + t(smetka: temp)
        }
    }
    */

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
     //   test()
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // se povikuva koga prikazot na viewcontrolerot e ispolnet i treba se povikuva sleden prikaz vo hierarhijata
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reset()
    }

    // Ovaa funkcija se povikuva koga nema dovolno memorija
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // tabelata ima dve sekcii 0 i 1 ; titleforheaderinsection: 0 ili 1; ovaa funkcija prima dva parametri klasa UITableView i titleforsection... int , a vrakja string
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
// ako sekcijata e 0 , vrati vo header hrana, ako ne pijaloci
        if section == 0 {
            return "Храна"
        }
        else{
            return "Пијалоци"
        }
    }
    
    //funkcija za broj na sekcii 2 (edna za pijaloci i edna za hrana , vrakja cel broj)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //funkcija koja se odnesuva na tabelata i ima broj na redovi vo sekoja sekcija kolku so ima pijaloci i hrana koi se razlicni soodetno
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return smetkahrana.count
        }
        else{
            return smetkapijaloci.count
        }
    }
    
    
    // FUNKCIja Koja VLEGUVA VO UITableviewdatasource:
    //customcell e izgledot na kelijata po pritiskanje na nekoe kopce (sodrzi ime levo i edno pod drugo kopce za kolicina i cena ) Znaci
    // Index`Path e lokacijata na kelijata[taa ima broj na sekcija i broj na red vo sekcijata]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // vo tableview da se formira nova ponovoupotrebliva kelija , so identifajer i spored klasata stavkaTableviewCell (custom cell)
        let cell = tableView.dequeueReusableCell(withIdentifier: "stavkaCell", for: indexPath) as? StavkaTableViewCell

        // ako lokacijata na kelijata e vo sekcija 0 togash vo stavka smesti ja i ispishi ja  nizata po redovi na nacin povikuvajki ja funkcijata labelaCell definirana vo klasata StavkaTableViewCell, ako ne pecatigi isto taka pijalocite
        if indexPath.section == 0{
            let stavka = smetkahrana[indexPath.row]
            cell?.labelaCell(stavka: stavka)
        }
        else{
            let stavka = smetkapijaloci[indexPath.row]
            //povikaj ja funkcijata labelaCell
            cell?.labelaCell(stavka: stavka)
        }
        
        
        return cell ?? UITableViewCell()
    }
    
    // UITableViewDelegate
    //ako e kliknato na bilo koj red od sekcijata (selektirano), togash:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    //    ako lokacijata e sekcija 0 , togash smesti go vo stavka artiklot so lokacija vo toj i toj red
        // ako kolicinata na artiklot e 1 togash izbrishi go artiklot , ako ne odzemi kolicina
        
        if indexPath.section == 0{
            let stavka = smetkahrana[indexPath.row]
            
            //        stavka.odzemiKolicina()
            if stavka.kolicina == 1 {
                
                smetkahrana.remove(at: indexPath.row)
            }
            else {
                stavka.odzemiKolicina()
            }
        }
        
        // inaku istoto napravi go i za vtorata sekcija
        else{
            let stavka = smetkapijaloci[indexPath.row]
            
            //        stavka.odzemiKolicina()
            if stavka.kolicina == 1 {
                
                smetkapijaloci.remove(at: indexPath.row)
            }
            else {
                stavka.odzemiKolicina()
            }}
        
        // kako se stiska se povikuva funkcijata za presmetuvanje na vkupna cena total i se obnovuvaat podatocite vo tabelata
        total()
        self.tabela.reloadData()
        
    }
    
    // od koga kje go stisnam kopceto plati pokazi go view controlerot na krajnata smetka
    func showalert(){
      self.performSegue(withIdentifier: "smetkaSegue", sender: nil)
    }
    
// ovaj metod se povikuva od view controllerot pred da se realizira segueto
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // sender se odnesuva na objektot ili kopceto koe e stisnato koe go inicira ova prefrluvanje na drug viewcontroller,
        // od koga kje ja znaeme destinacijata na swque , odnosno kon koj viewcontroller vodi , tamu z=smesti gi promenlivite  smetkahrana i smetkapijaloci
        if let destination = segue.destination as? SmetkaViewController {
            destination.smetkaHrana = smetkahrana
            destination.smetkaPijaloci = smetkapijaloci
           // pass data to next view controler/ prefrluvanje na podatoci na drug kontroler
            
        }
        
    }
    
    

}


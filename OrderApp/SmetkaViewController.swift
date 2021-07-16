//
//  SmetkaViewController.swift
//  7ca
//
//  Created by Deni Smilevska on 5/15/19.
//  Copyright © 2019 Martin Anchevski. All rights reserved.
//

import UIKit

class SmetkaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // dissmisAction e kop;eto za isklucuvanje na view controlerot
    @IBAction func dissmisAction(_ sender: Any) {
        //press true to animate the transition,  compilation( stalno ne vrakja vrednost i zatoa stoi nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    // broj na redici vo tableview ima kolku sto e zbirot na elementi vo smetka hrana i smetka pijaloci
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return smetkaHrana.count + smetkaPijaloci.count
        
    }
    
    //kako treba da izgleda edna k=custom kelija 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // ako brojot na redot na kelijata e pogolem ili ednakov na brojot na smetkahrana elementite togash vo stavka stavi go elementot od smetka pijaloci so index indexPath.row - smetkaHrana.count i ispecatigo istiot element vo format koj e definiran vo funkcijata descriptiion , inaku vo stavka smesti go elemetot od smetkahrana so broj na red , i vrati ja taa custom kelija
        if indexPath.row >= smetkaHrana.count{
            let stavka = smetkaPijaloci[indexPath.row - smetkaHrana.count]
            cell.textLabel?.text = stavka.description
            
        }else {
            let stavka = smetkaHrana[indexPath.row]
            cell.textLabel?.text = stavka.description
            

        }
        return cell
    }
    
    
    var smetkaHrana:[Stavka] = []
    var smetkaPijaloci:[Stavka] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

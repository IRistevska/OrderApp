//
//  SmetkaViewController.swift
//

//

import UIKit

class SmetkaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBAction func dissmisAction(_ sender: Any) {
       
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return smetkaHrana.count + smetkaPijaloci.count
        
    }
    
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
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

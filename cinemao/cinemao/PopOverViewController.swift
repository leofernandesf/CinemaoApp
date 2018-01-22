//
//  PopOverViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 22/03/17.
//
//

import UIKit

class PopOverViewController: UIViewController {
    
    var cidades = ["Manaus", "Petrópolis", "Rio de Janeiro", "Salvador", "São Paulo", "Tocantins", "Vitória"]
    
    
    @IBOutlet weak var myTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension PopOverViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cidadeCell", for: indexPath) as! PopOverTableViewCell
        cell.cidade = self.cidades[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cidades.count
    }
}

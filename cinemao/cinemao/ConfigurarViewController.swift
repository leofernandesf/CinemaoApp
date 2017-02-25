//
//  ConfigurarViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

class ConfigurarViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var cidadesOpcoesView: UIView!
    @IBOutlet weak var btCidade: UIButton!
    @IBOutlet weak var tfCidade: UITextField!
    var cinamsSelecionados = [Int]()
    var cidade = String()
    var row = Int()
    var cidades = ["Manaus", "Petrópolis", "Rio de Janeiro", "Salvador", "São Paulo", "Tocantins", "Vitória"]
    
    var cinemas = ["Cinépolis Ponta Negra", "Cinemark", "Cinoplex", "PlayArt Manauara"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    fileprivate func setUpView() {
        //self.hideKeyboardWhenTappedAround()
        self.cidadesOpcoesView.layer.cornerRadius = 5
        self.btCidade.layer.cornerRadius = 5
        self.btCidade.clipsToBounds = true
        self.navigationController?.navigationBar.barTintNoColor = true
        self.btCidade.setBackgroundImage(UIColor.imageWithColor(color: UIColor.black.withAlphaComponent(0.5)), for: .highlighted)
        Layout.addImageTo(navigation: self.navigationItem, image: #imageLiteral(resourceName: "logo_cinemao"))
        Layout.addPickerView(tf: self.tfCidade, target: self, action: #selector(ConfigurarViewController.donePicker(sender:)), view: self.view, vc: self)
        
    }
    
    
    func donePicker (sender:UIBarButtonItem) {
        print("teste: \(self.cidades[row])")
        dismissKeyboard()
        
        
    }
    
    @IBAction func aprecerCidade(_ sender: Any) {
        tfCidade.becomeFirstResponder()
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


extension ConfigurarViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "configurarCell", for: indexPath) as! ConfigurarTableViewCell
        cell.lbName.text = cinemas[indexPath.row]
        
        if cinamsSelecionados.contains(indexPath.row) {
            cell.ivCheckBox.image = #imageLiteral(resourceName: "checkbox_selected")
            cell.lbName.textColor = UIColor.white
        } else {
            cell.ivCheckBox.image = #imageLiteral(resourceName: "chebox_unselected")
            cell.lbName.textColor = #colorLiteral(red: 0.8755691051, green: 0.3265503645, blue: 0.1802178323, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cinemas.count
    }
}

extension ConfigurarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(123)
        if cinamsSelecionados.contains(indexPath.row) {
            cinamsSelecionados = cinamsSelecionados.filter({return $0 != indexPath.row})
        } else {
            cinamsSelecionados.append(indexPath.row)
        }
        
        self.myTable.reloadData()
    }
}

//MARK: - UIPickerViewDelegate
extension ConfigurarViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cidades[row]
    }
}

extension ConfigurarViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cidades.count
    }
}

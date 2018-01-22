//
//  ViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

class ChooseCityViewController: UIViewController {
    
    
    @IBOutlet weak var blackView: UIView!

    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var myTableHeight: NSLayoutConstraint!
    @IBOutlet weak var tfCidades: UITextField!
    @IBOutlet weak var btCidades: UIButton!
    @IBOutlet weak var cidadesOpcoesView: UIView!
    var cidade = String()
    var row = Int()
    var cidades = ["Manaus", "Petrópolis", "Rio de Janeiro", "Salvador", "São Paulo", "Tocantins", "Vitória"]
    var isToUp = true
    override func viewDidLoad() {
        super.viewDidLoad()
        seuUpView()
        self.myTableHeight.constant = 0
        self.myTable.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    fileprivate func seuUpView() {
        //self.hideKeyboardWhenTappedAround()
        self.cidadesOpcoesView.layer.cornerRadius = 5
        self.btCidades.layer.cornerRadius = 5
        self.btCidades.clipsToBounds = true
        self.navigationController?.navigationBar.barTintNoColor = true
        self.btCidades.setBackgroundImage(UIColor.imageWithColor(color: UIColor.black.withAlphaComponent(0.5)), for: .highlighted)
        Layout.addImageTo(navigation: self.navigationItem, image: #imageLiteral(resourceName: "logo_cinemao"))
        
        self.blackView.alpha = 0.0
        //Layout.addPickerView(tf: self.tfCidades, target: self, action: #selector(ChooseCityViewController.donePicker(sender:)), view: self.view, vc: self)
        
    }
    
    func up() {
        self.isToUp = false
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 1.0
            self.myTableHeight.constant = 292
            self.view.layoutIfNeeded()
        }
    }
    
    func down() {
        self.isToUp = true
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0.0
            self.myTableHeight.constant = 0.0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        self.down()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menu(_ sender: Any) {
    }
    
    
    @IBAction func cidade(_ sender: UIButton) {
        
        
       
            
        if self.isToUp {
            self.up()
        } else {
            self.down()
        }
        
        
        
//        print(123)
//        tfCidades.becomeFirstResponder()
        
        
        
        
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "PopOver") as! PopOverViewController
//        vc.preferredContentSize = CGSize(width: sender.frame.width, height: 200)
//        vc.modalPresentationStyle = .popover
//        vc.popoverPresentationController?.delegate = self
//        vc.popoverPresentationController?.backgroundColor = #colorLiteral(red: 0.9849171042, green: 0.532286942, blue: 0.4111022353, alpha: 1)
//        vc.popoverPresentationController?.permittedArrowDirections = .up
//        vc.popoverPresentationController?.sourceView = sender
//        vc.popoverPresentationController?.sourceRect = CGRect(origin: CGPoint(x: 0, y: -10), size: sender.frame.size)
//
//        self.present(vc, animated: true, completion: nil)
    }
    
    func donePicker (sender:UIBarButtonItem) {
        print("teste: \(self.cidades[row])")
        dismissKeyboard()
        self.performSegue(withIdentifier: "home", sender: self)
        
    }
    
    
    fileprivate func saveCidade(cidade: String) {
        
    }
    
    func selectedCity(index: Int) {
        
        
        self.performSegue(withIdentifier: "home", sender: self)
       // self.isToUp = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "home" {
            
        }
    }

}

//MARK: - UIPickerViewDelegate
extension ChooseCityViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cidades[row]
    }
}

extension ChooseCityViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cidades.count
    }
}

extension ChooseCityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cidadeCell", for: indexPath)
        cell.textLabel?.text = cidades[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cidades.count
    }
}

extension ChooseCityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCity(index: indexPath.row)
    }
}

extension ChooseCityViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}


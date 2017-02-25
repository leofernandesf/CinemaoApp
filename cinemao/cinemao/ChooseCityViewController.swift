//
//  ViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

class ChooseCityViewController: UIViewController {

    @IBOutlet weak var tfCidades: UITextField!
    @IBOutlet weak var btCidades: UIButton!
    @IBOutlet weak var cidadesOpcoesView: UIView!
    var cidade = String()
    var row = Int()
    var cidades = ["Manaus", "Petrópolis", "Rio de Janeiro", "Salvador", "São Paulo", "Tocantins", "Vitória"]
    override func viewDidLoad() {
        super.viewDidLoad()
        seuUpView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    fileprivate func seuUpView() {
        self.hideKeyboardWhenTappedAround()
        self.cidadesOpcoesView.layer.cornerRadius = 5
        self.btCidades.layer.cornerRadius = 5
        self.btCidades.clipsToBounds = true
        self.navigationController?.navigationBar.barTintNoColor = true
        self.btCidades.setBackgroundImage(UIColor.imageWithColor(color: UIColor.black.withAlphaComponent(0.5)), for: .highlighted)
        Layout.addImageTo(navigation: self.navigationItem, image: #imageLiteral(resourceName: "logo_cinemao"))
        Layout.addPickerView(tf: self.tfCidades, target: self, action: #selector(ChooseCityViewController.donePicker(sender:)), view: self.view, vc: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menu(_ sender: Any) {
    }
    
    
    @IBAction func cidades(_ sender: Any) {
        
        print(123)
        tfCidades.becomeFirstResponder()
        
    }
    
    func donePicker (sender:UIBarButtonItem) {
        print("teste: \(self.cidades[row])")
        dismissKeyboard()
        self.performSegue(withIdentifier: "home", sender: self)
        
    }
    
    
    fileprivate func saveCidade(cidade: String) {
        
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


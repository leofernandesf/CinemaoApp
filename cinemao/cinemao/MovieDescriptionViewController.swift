//
//  MovieDescriptionViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 12/02/17.
//
//

import UIKit

struct Elenco {
    var nome: String!
    var image: UIImage!
}

class MovieDescriptionViewController: UIViewController {
    
    @IBOutlet weak var ivThumb: UIImageView!
    
    @IBOutlet weak var btAmigos: UIButton!
    var thumbImage = UIImage()
    
    fileprivate let elenco = [Elenco(nome: "J.J ABRAMS", image: #imageLiteral(resourceName: "thumb1")), Elenco(nome: "J.J ABRAMS", image: #imageLiteral(resourceName: "thumb1")), Elenco(nome: "J.J ABRAMS", image: #imageLiteral(resourceName: "thumb1")), Elenco(nome: "J.J ABRAMS", image: #imageLiteral(resourceName: "thumb1")), Elenco(nome: "J.J ABRAMS", image: #imageLiteral(resourceName: "thumb1")), Elenco(nome: "J.J ABRAMS", image: #imageLiteral(resourceName: "thumb1")), Elenco(nome: "J.J ABRAMS", image: #imageLiteral(resourceName: "thumb1")), Elenco(nome: "J.J ABRAMS", image: #imageLiteral(resourceName: "thumb1"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.view.showAnimation()
        
        //setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpView()
    }
    
    func setUpView() {
        self.ivThumb.image = thumbImage
        self.btAmigos.applyGradient(withColours: [#colorLiteral(red: 0.2, green: 0.7323096395, blue: 0.631372549, alpha: 1), #colorLiteral(red: 0.2117647059, green: 0.07450980392, blue: 0.4470588235, alpha: 1)], gradientOrientation: .horizontal)
        
    }
//    func gradientColor () {
//        let gradient = CAGradientLayer()
//        gradient.frame = self.btAmigos.bounds
//        gradient.colors = [#colorLiteral(red: 0.2019590735, green: 0.7323096395, blue: 0.6310634017, alpha: 1).cgColor, #colorLiteral(red: 0.2165358067, green: 0.07713570446, blue: 0.4426269829, alpha: 1).cgColor]
//        gradient.locations = [0.0, 1.0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
//        self.btAmigos.layer.insertSublayer(gradient, at: 0)
//    }
    
    

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
    @IBAction func back(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        self.view.removeAnimate()
        
    }

}



extension MovieDescriptionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieElenco", for: indexPath) as! MovieElencoCollectionViewCell
        cell.person = elenco[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elenco.count
    }
}

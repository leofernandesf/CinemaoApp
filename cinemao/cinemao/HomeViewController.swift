//
//  HomeViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var viewBott: UIView!
    let viewControllerHorarioIdentifier = "horarios"
    let viewControllerMenuIdentifier = "menuOpcoes"
    
    let filmes = [#imageLiteral(resourceName: "filme1"), #imageLiteral(resourceName: "filme_moana"), #imageLiteral(resourceName: "filme_rogue"), #imageLiteral(resourceName: "filme_achegada"), #imageLiteral(resourceName: "filme_cachorro"), #imageLiteral(resourceName: "filme_lalaland"), #imageLiteral(resourceName: "filme_batmanlego")]
    
    let filmeCopy = [#imageLiteral(resourceName: "filme1"), #imageLiteral(resourceName: "filme_moana copy"), #imageLiteral(resourceName: "filme_rogue copy"), #imageLiteral(resourceName: "filme_achegada copy"), #imageLiteral(resourceName: "filme_cachorro copy"), #imageLiteral(resourceName: "filme_lalaland copy"), #imageLiteral(resourceName: "filme_batmanlego copy")]
    @IBOutlet weak var pageControll: UIPageControl!
    
    @IBOutlet weak var blackView: UIView!
    
    
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "meusJobs")
        return firstChildTabVC
    }()
    
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "venderJobs")
        return secondChildTabVC
    }()
    
    lazy var thirdChildTabVC : UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "comprarJobs")
        return thirdChildTabVC
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }

    
    func setUpView() {
        self.blackView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        self.navigationController?.navigationBar.barTintNoColor = true
        Layout.addImageTo(navigation: self.navigationItem, image: #imageLiteral(resourceName: "logo_cinemao"))
        Layout.loadSwipe(view: viewBott, ob: self, selector: #selector(HomeViewController.respondToSwipeGesture(gesture:)))
        self.pageControll.numberOfPages = filmes.count
        //gradientColor()
        
        self.view.applyGradient(withColours: [#colorLiteral(red: 0.2, green: 0.768627451, blue: 0.6431372549, alpha: 1), #colorLiteral(red: 0.2078431373, green: 0.431372549, blue: 0.5490196078, alpha: 1), #colorLiteral(red: 0.2117647059, green: 0.09411764706, blue: 0.4509803922, alpha: 1), #colorLiteral(red: 0.2117647059, green: 0.07450980392, blue: 0.4470588235, alpha: 1)], locations: [0.0, 0.6, 0.9, 1.0])
    }
    
    
    func gradientColor () {
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [#colorLiteral(red: 0.2019590735, green: 0.7323096395, blue: 0.6310634017, alpha: 1).cgColor, #colorLiteral(red: 0.553648591, green: 0.1441813707, blue: 0.7200562358, alpha: 1).cgColor]
        gradient.locations = [0.0, 1.0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menu(_ sender: Any) {
        
        presentView(identifier: viewControllerMenuIdentifier)
    }
    
    @IBAction func queroVer(_ sender: Any) {
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.up:
                print(123)
                
                presentView(identifier: viewControllerHorarioIdentifier)
                return
            default:
                return
            }
        }
        
    }
    
    
    
    fileprivate func presentView(identifier: String) {
        var vc = UIViewController()
        
        if identifier == viewControllerHorarioIdentifier {
            let customVc = self.storyboard?.instantiateViewController(withIdentifier: identifier) as! HorariosViewController
            customVc.delegateHome = self
            vc = customVc
        } else {
            let customVc = self.storyboard?.instantiateViewController(withIdentifier: identifier) as! MenuViewController
            customVc.delegateHome = self
            vc = customVc
        }
        UIView.animate(withDuration: 1.5) {
            self.blackView.alpha = 1.0
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    fileprivate func presentDescriptionView(index: Int) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "movieDescription") as! MovieDescriptionViewController
        controller.thumbImage = self.filmeCopy[index]
        //self.present(controller, animated: true, completion: nil)
        self.addChildViewController(controller)
        controller.view.frame = self.view.frame
        self.view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    func dismisView() {
        UIView.animate(withDuration: 1.5) {
            self.blackView.alpha = 0.0
        }
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


extension HomeViewController : UIScrollViewDelegate {
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControll.currentPage = Int(currentPage);
        // Change the text accordingly
    }
    
}


extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! FilmesHomeCollectionViewCell
        cell.ivFilme.image = filmes[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmes.count
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presentDescriptionView(index: indexPath.row)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

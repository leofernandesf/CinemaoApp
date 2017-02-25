//
//  MenuViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

class MenuViewController: UIViewController {
    enum TabIndex : Int {
        case firstChildTab = 0
        case secondChildTab = 1
        case thirdChildTab = 2
    }
    
    let cellIdentifier = "menuCell"
    let menuOpcoes = ["Quero ver", "configurar", "Sobre nós"]

    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var contentView: UIView!
    
    var selectedCell = Int()
    var delegateHome: HomeViewController?
    
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "queroVer")
        return firstChildTabVC
    }()
    
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "configurar")
        return secondChildTabVC
    }()
    
    lazy var thirdChildTabVC : UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "sobreNos")
        return thirdChildTabVC
    }()
    
    var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }

    
    
    func setUpView() {
        selectedCell = 0
        self.myCollection.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
        self.myCollection.reloadData()
        displayCurrentTab(TabIndex.firstChildTab.rawValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.firstChildTab.rawValue :
            let vc1: QueroVerViewController = firstChildTabVC as! QueroVerViewController
            vc = vc1
        case TabIndex.secondChildTab.rawValue :
            let vc2: ConfigurarViewController = secondChildTabVC as! ConfigurarViewController
            vc = vc2
        case TabIndex.thirdChildTab.rawValue :
            let vc3 = thirdChildTabVC
            vc = vc3
        default:
            return nil
        }
        
        return vc
    }
    
    @IBAction func back(_ sender: Any) {
        delegateHome?.dismisView()
        self.dismiss(animated: true, completion: nil)
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


extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MenuCollectionViewCell
        cell.cellIndex = indexPath.row
        cell.index = selectedCell
        cell.lbTitle.text = menuOpcoes[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuOpcoes.count
    }
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedCell = indexPath.row
        myCollection.reloadData()
        self.currentViewController?.view.removeFromSuperview()
        self.currentViewController?.removeFromParentViewController()
        displayCurrentTab(indexPath.item)
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3, height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

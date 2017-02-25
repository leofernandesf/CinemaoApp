//
//  QueroVerViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit
import MGSwipeTableCell

class QueroVerViewController: UIViewController {

    
    var itens = [#imageLiteral(resourceName: "filme1"), #imageLiteral(resourceName: "filme_moana copy"), #imageLiteral(resourceName: "filme_rogue copy"), #imageLiteral(resourceName: "filme_achegada copy"), #imageLiteral(resourceName: "filme_cachorro copy"), #imageLiteral(resourceName: "filme_lalaland copy"), #imageLiteral(resourceName: "filme_batmanlego copy")]
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColor()
        setUpView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        self.myTable.tableFooterView = UIView(frame: .zero)
        //self.view.applyGradient(withColours: [#colorLiteral(red: 0.8081011176, green: 0.3192472458, blue: 0.1950010955, alpha: 1), #colorLiteral(red: 0.2165358067, green: 0.07713570446, blue: 0.4426269829, alpha: 1)], gradientOrientation: .topLeftBottomRight)
    }
    
    func gradientColor () {
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [#colorLiteral(red: 0.8081011176, green: 0.3192472458, blue: 0.1950010955, alpha: 1).cgColor, #colorLiteral(red: 0.2165358067, green: 0.07713570446, blue: 0.4426269829, alpha: 1).cgColor]
        gradient.locations = [0.0, 0.9]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.1)
        gradient.endPoint = CGPoint(x: 0.2, y: 1.0)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    func deletCell(index: IndexPath) {
        itens.remove(at: index.row)
        //myTable.deleteRows(at: [index], with: .automatic)
        self.myTable.reloadData()
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

extension QueroVerViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.x
        print(yOffset)
        
    }
    
}

extension QueroVerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellQueroVer", for: indexPath) as! QueroVerTableViewCell
        cell.ivThumb.image = itens[indexPath.row]
        
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//    }
    
}


extension QueroVerViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let x = UITableViewRowAction(style: .default, title: "") { (action, index) in
//            print(123)
//        }
//        
//        
//        let img: UIImage = #imageLiteral(resourceName: "delete")
//        let imgSize: CGSize = tableView.frame.size
//        UIGraphicsBeginImageContext(imgSize)
//        img.draw(in: CGRect(x: 0, y: 80, width: 14, height: 14))
//        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        x.backgroundColor = UIColor(patternImage: newImage)
//        return [x]
//    }
}

extension QueroVerViewController : MGSwipeTableCellDelegate {
    func swipeTableCell(_ cell: MGSwipeTableCell, swipeButtonsFor direction: MGSwipeDirection, swipeSettings: MGSwipeSettings, expansionSettings: MGSwipeExpansionSettings) -> [UIView]? {
        switch direction {
            
        case .rightToLeft:
            // configure right buttons
            let deleteButton = MGSwipeButton(title: "", icon: #imageLiteral(resourceName: "delete"), backgroundColor: UIColor.clear)
            let blankButton = MGSwipeButton(title: "", backgroundColor: UIColor.clear)
            
            
            swipeSettings.transition = .border
            swipeSettings.enableSwipeBounces = true
            
            expansionSettings.buttonIndex = 0
            expansionSettings.animationDuration = 0
            expansionSettings.fillOnTrigger = true
            
            return [ deleteButton, blankButton, blankButton, blankButton ]
        default:
            return [MGSwipeButton()]
            
        }
    }
    
    func swipeTableCell(_ cell: MGSwipeTableCell, tappedButtonAt index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        
        if let indexPath = myTable.indexPath(for: cell) {
            switch direction {
            case .rightToLeft:
                if index == 0 {
                    print(indexPath)
                    self.deletCell(index: indexPath)
                } else {
                    return false
                }
            default:
                print(456)
                
            }
        }
        
        return true
    }
    
}

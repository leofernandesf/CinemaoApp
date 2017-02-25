//
//  HorariosViewController.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

class HorariosViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    let cellIdentifier = "cellHorario"
    var delegateHome: HomeViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setUpView() {
        Layout.loadSwipe(view: self.view, ob: self, selector: #selector(HorariosViewController.respondToSwipeGesture(gesture:)))
        myTable.tableFooterView = UIView(frame: .zero)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        self.view.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.down:
                print(123)
                delegateHome?.dismisView()
                self.dismiss(animated: true, completion: nil)
//                UIView.animate(withDuration: 0.1, animations: {
//                    self.view.backgroundColor = UIColor.clear
//                }) { (terminou) in
//                    if terminou {
//                        UIView.animate(withDuration: 2, animations: {
//                            self.dismiss(animated: true, completion: nil)
//                        })
//                        
//                    }
//                }
                
                return
            default:
                return
            }
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

extension HorariosViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

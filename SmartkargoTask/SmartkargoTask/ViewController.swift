//
//  ViewController.swift
//  SmartkargoTask
//
//  Created by Arjun  on 24/02/21.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
    
    
    @IBOutlet weak var itemstable: UITableView!
    
    var cargo_items:[Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        itemstable.tableFooterView = UIView()

        print(getThreeIncreasing(inputArray: [1, 4, 5, 6, 2]))
        self.readLocalFile(forName: "items")
    }
    
    
    @IBAction func checkResult(_ sender: Any) {
        let alert = UIAlertController(title: "Result : \(getThreeIncreasing(inputArray: [1, 4, 5, 6, 2]))", message: "Input Array [1, 4, 5, 6, 2] has three increasing adjacent numbers like .... 4, 5, 6, ... or 23, 24, 25.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func readLocalFile(forName name: String){
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(Items.self,
                                                               from: jsonData)
                self.cargo_items = decodedData.items!
                self.itemstable.reloadData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getThreeIncreasing(inputArray: [Int]) -> Bool {
        var result = false
        for i in 0..<inputArray.count-2 {
            if inputArray[i] + 1 == inputArray[i+1] && inputArray[i+1] + 1 == inputArray[i+2]{
                result = true
            }
        }
        return result
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cargo_items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ItemsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell") as! ItemsTableViewCell
        
        self.attributingWithColorForVC2(label: cell.nameLabel, boldTxt: "Name : ", regTxt: "\(cargo_items?[indexPath.row].name ?? "")", color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), fontSize: 15, firstFontWeight: .semibold, secFontWeight: .bold)
        self.attributingWithColorForVC2(label: cell.releaseDateLabel, boldTxt: "Release Date : ", regTxt: "\(cargo_items?[indexPath.row].releaseDate ?? "")", color: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), fontSize: 15, firstFontWeight: .semibold, secFontWeight: .bold)
        cell.itemImg.image = UIImage(named: cargo_items?[indexPath.row].image ?? "")

        return cell
    }

}


extension UIViewController{
    func attributingWithColorForVC2(label:UILabel,boldTxt:String,regTxt:String,color:UIColor,fontSize:CGFloat,firstFontWeight:UIFont.Weight,secFontWeight:UIFont.Weight) -> Void {
        var test1Attributes:[NSAttributedString.Key: Any] = [.font : UIFont.systemFont(ofSize: fontSize, weight: firstFontWeight)]
        test1Attributes[.foregroundColor] = color

        let test2Attributes:[NSAttributedString.Key: Any] = [.font : UIFont.systemFont(ofSize: fontSize, weight: secFontWeight)]

        let test1 = NSAttributedString(string: boldTxt, attributes:test1Attributes)
        let test2 = NSAttributedString(string: regTxt, attributes:test2Attributes)
        let text = NSMutableAttributedString()
        text.append(test1)
        text.append(test2)
        label.attributedText = text
    }

}

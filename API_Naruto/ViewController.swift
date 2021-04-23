//
//  ViewController.swift
//  API_Naruto
//
//  Created by Omar Hisham on 4/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    let vm = ViewModel()
    
    var arr = [NarutoInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vm.fetchData{
            //define
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell
        let naruto = vm.getObject(index: indexPath.row)
        cell?.setCell(naruto: naruto)
        return cell ?? UITableViewCell.init()
    }
}

struct Naruto: Decodable {
    let results: [NarutoInfo]
}

struct NarutoInfo: Decodable {
    let title: String
    let type: String
    let image_url: String
}

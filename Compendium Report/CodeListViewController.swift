//
//  CodeListViewController.swift
//  Compendium Report
//
//  Created by Anubhav Mishra on 6/1/23.
//

import UIKit
import CoreData

class CodeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    
    
    
    @IBOutlet var tableView: UITableView!

    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    var ARCCodeModel = [ARCCode]()
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCodeList()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        populateCodeList()
    }
    
    func populateCodeList(){
        do{
            ARCCodeModel = try context.fetch(ARCCode.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            print("\(error)")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ARCCodeModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! ARCCodeListTableViewCell
        let model = ARCCodeModel[indexPath.row]
        cell.codeNameLabel.text = model.name
        cell.codeNumberLabel.text = model.id
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteCode), for: .touchUpInside)
        return cell
    }
    
    @objc func deleteCode(sender:UIButton)
    {
        let key = ARCCodeModel[sender.tag].id ?? ""
        do{
            ARCCodeModel = try context.fetch(ARCCode.fetchRequest())
            for result in ARCCodeModel{
                if(result.id == key){
                    context.delete(result)
                }
            }
        }catch let error as NSError{
            print("\(error)")
        }
        populateCodeList()
    }


}

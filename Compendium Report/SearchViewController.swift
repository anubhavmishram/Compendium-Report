//
//  SearchViewController.swift
//  Compendium Report
//
//  Created by Anubhav Mishra on 5/22/23.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
   

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView:UITableView!
    
    
    var map: [String: String] = [
            "2.1113": "Reduce Combustion air flow to optimum - REDUCE AIR INFILTRATION IN OVEN",
             "2.1114": "Limit and control secondary combustion air in furnace - OXYGEN BOOSTING TECHNOLOGY FOR THE FLOAT FURNANCES",
             "2.1116": "Improve combustion control capability - IMPLEMENT BOLIER TURNDOWN AT NIGHT AND WEEKEND",
             "2.1121": "Use insulation in furnaces to facilitate heating/cooling - INSULATE UN-INSULATED PIPES",
             "2.1122": "Re-size charging openings or add a movable door on equipment - STANDARIZE THE CHARGING SYSTEM FOR THE FURNACE TO MINIMIZE THE HEAT LOSS",
             "2.1131": "Repair faulty insulation in furnaces, boilers, etc. - INSULATE FURNANCE SURFACES",
             "2.1133": "Adjust burners for efficient operations - RECONDITION THE EXISTING CORE MAKING MACHINES",
             "2.1135": "Repair furnaces and oven doors so that they seal efficiently - ELIMINATE THE HEAT LOSSES THROUGH FURNANCE DOOR OPENINGS",
             "2.1221": "Replace the Obsolete Burners with more efficient ones - REPLACE THE HOT OIL HEATER FOR A LIQUID ASPHALT STORAGE TANK",
             "2.1222": "Install turbulators - INSTALLING TURBULATORS IN BOILER TO INCREASE EFFICIENCY"
        ]

    var filteredData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customCell")
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let value = filteredData[indexPath.row]
        let key = map.first { $0.value == value }?.key ?? ""
        cell.textLabel?.text = value
        cell.detailTextLabel?.text = key
        let addbutton = UISwitch()
        addbutton.tag = indexPath.row
        addbutton.addTarget(self, action: #selector(didClickButton(_:)), for: .touchUpInside)
        cell.accessoryView = addbutton
        return cell
    }

    @objc func didClickButton(_ sender: UISwitch){
        if sender.isOn{
            let value = filteredData[sender.tag]
            let key = map.first { $0.value == value }?.key ?? ""
            print(key)
        }else{
            print("off")
        }
    }
    // MARK: - UISearchBarDelegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData.removeAll()

        if searchText.isEmpty {
            filteredData = Array(map.values)
        } else {
            let lowercasedSearchText = searchText.lowercased()

            filteredData = map.filter { key, value in
                return key.lowercased().contains(lowercasedSearchText) ||
                       value.lowercased().contains(lowercasedSearchText)
            }.map { $0.value }
        }

        tableView.reloadData()
    }

}

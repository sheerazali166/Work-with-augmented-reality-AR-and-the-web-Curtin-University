//
//  CountryTableViewController.swift
//  CountriesOfTheWorld
//
//  Created by Sheeraz on 13/05/2024.
//

import UIKit

class CountryTableViewController: UITableViewController {
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    var countries: [Country] = [
    
        Country(flag: "🇦🇺", name: "Austrelia", region: "Oceania", population: "24.13m"),
        Country(flag: "🇳🇿", name: "New Zealand", region: "Oceania", population: "4.69m"),
        Country(flag: "🇨🇦", name: "Canada", region: "North America", population: "36.3m"),
        Country(flag: "🇳🇴", name: "Norway", region: "Scandivania", population: "3.8m"),
        Country(flag: "🇸🇧", name: "Solomon Islands", region: "Micronesia", population: "611k"),
        Country(flag: "🇮🇳", name: "India", region: "South Asia", population: "1.324b"),
        Country(flag: "🇨🇳", name: "China", region: "East Asia", population: "1.379b"),
        Country(flag: "🇬🇲", name: "Gambia", region: "West Africa", population: "2.039m"),
        Country(flag: "🇨🇱", name: "Chile", region: "South America", population: "17.91m"),
        Country(flag: "🇨🇴", name: "Columbia", region: "South America", population: "48.68m"),
        Country(flag: "🇩🇪", name: "Germany", region: "Europe", population: "82.67m"),
        Country(flag: "🇬🇹", name: "Guatemala", region: "Central America", population: "16.58m"),
        Country(flag: "🇬🇾", name: "Guyana", region: "South America", population: "773k"),
        Country(flag: "🇦🇪", name: "United Arab Emirates", region: "Westren Asia", population: "9.4m"),
        Country(flag: "🇦🇱", name: "Albania", region: "Balkan Peninsula", population: "2.873m"),
        Country(flag: "🇪🇹", name: "Ethiopia", region: "Horn Of Africa", population: "105m"),
        Country(flag: "🇦🇪", name: "Greece", region: "South Eastren Europe", population: "10.77m"),
        Country(flag: "🇰🇬", name: "Kyrgyzstan", region: "Central Asia", population: "6.2m")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        
    
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return countries.count
            
        } else {
            
            return 0
        }
        
        

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell

        let country = countries[indexPath.row]
        cell.update(with: country)
        
        
//        cell.textLabel?.text = "\(country.flag) - \(country.name)"
//        cell.detailTextLabel?.text = country.region

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let country = countries[indexPath.row]
//        print("\(country.flag) \(indexPath)")
//    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            countries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.automatic)
        }
    }
    


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        let movedCountry = countries.remove(at: fromIndexPath.row)
        countries.insert(movedCountry, at: to.row)
        tableView.reloadData()
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    
    @IBAction func unwindToCountryTableView(segue: UIStoryboardSegue) {
     
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? AddEditFlagTableViewController,
              let country = sourceViewController.country else {return}
                
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            
            countries[selectedIndexPath.row] = country
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
            
        } else {
            
            let newIndexPath = IndexPath(row: countries.count, section: 0)
            countries.append(country)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "EditCountry" {
            
            let indexPath = tableView.indexPathForSelectedRow!
            let country = countries[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditFlagTableViewController = navController.topViewController as! AddEditFlagTableViewController
            addEditFlagTableViewController.country = country
        }
        
    }
    

}

//
//  AddFlightTableViewController.swift
//  CurtinAiro
//
//  Created by Sheeraz on 14/05/2024.
//

import UIKit

class AddFlightTableViewController: UITableViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var frequentFlyerTextField: UITextField!
    
    @IBOutlet weak var departureDateLabel: UILabel!
    
    @IBOutlet weak var departuredatePicker: UIDatePicker!
    
    @IBOutlet weak var returnDateLabel: UILabel!
    
    @IBOutlet weak var returnDatePicker: UIDatePicker!
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var mealsSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let midnightToday = Calendar.current.startOfDay(for: Date())
        departuredatePicker.minimumDate = midnightToday
        
        updateDateViews()
        updateNumberOfPassengers()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func updateNumberOfPassengers() {
        
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    
    @IBAction func mealsSwitchChanges(_ sender: UISwitch) {
        
        print("Meals Changed.")
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        updateNumberOfPassengers()
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        print("Done Button Tapped")
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let frequentFlyer = frequentFlyerTextField.text ?? ""
        
        let departureDate = departuredatePicker.date
        let returnDate = returnDatePicker.date
    
        let numberOfAdults = "\(Int(numberOfAdultsStepper.value))"
        let numberOfChildren = "\(Int(numberOfChildrenStepper.value))"
        
        let hasMeals = mealsSwitch.isOn
        
        
        print("firstName: \(firstName)")
        print("lastName: \(lastName)")
        print("frequentFlyer: \(frequentFlyer)")
        print("departureDate: \(departureDate)")
        print("returnDate: \(returnDate)")
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        print("hasMeals: \(hasMeals)")
    }
    
    
    func updateDateViews() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        returnDatePicker.minimumDate = departuredatePicker.date.addingTimeInterval(86400)
        
        departureDateLabel.text = dateFormatter.string(from: departuredatePicker.date)
        
        
        returnDateLabel.text = dateFormatter.string(from: returnDatePicker.date)
        
        
        
    }
    
    @IBAction func departureDatePicker(_ sender: UIDatePicker) {
        
        updateDateViews()
        
    }
    
    @IBAction func returnDatePicker(_ sender: UIDatePicker) {
        
        updateDateViews()
    }
    
    let departureDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let returnDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isDepartureDatePickerShown:Bool = false {
        
        didSet {
            departuredatePicker.isHidden = !isDepartureDatePickerShown
        }
    }
    
    var isReturnDatePickerShown:Bool = false {
        
        didSet {
            returnDatePicker.isHidden = !isReturnDatePickerShown
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath {
            
        case departureDatePickerCellIndexPath:
            if isDepartureDatePickerShown {
                
                return 216.00
                
            } else {
            
                return 0.0
            }
            
        case returnDatePickerCellIndexPath:
            if isReturnDatePickerShown {
                
                return 216.00
                
            } else {
                
                return 0.0
            }
            
        default:
            return 44.0
        }
        
    }
    
    let departureDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let returnDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
            
        case departureDateLabelCellIndexPath:
            if isDepartureDatePickerShown {
                
                isDepartureDatePickerShown = false
                
            } else if isReturnDatePickerShown {
                
                isReturnDatePickerShown = false
                isDepartureDatePickerShown = true
                
            } else {
                
                isDepartureDatePickerShown = true
            }
            
        tableView.beginUpdates()
        tableView.endUpdates()
        
        case returnDateLabelCellIndexPath:
            if isReturnDatePickerShown {
                
                isReturnDatePickerShown = false
                
            } else if isDepartureDatePickerShown {
                
                isDepartureDatePickerShown = false
                isReturnDatePickerShown = true
                
            } else {
                
                isReturnDatePickerShown = true
            }
            
        tableView.beginUpdates()
        tableView.endUpdates()
        default:
            break
        }
        
    }
    
    
    
    
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

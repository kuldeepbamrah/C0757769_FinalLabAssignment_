//
//  ProductTTableViewController.swift
//  FinalLabAssignment-C0757769
//
//  Created by Rizul goyal on 2020-01-25.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ProductTTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var seachBar: UISearchBar!
    var productArray = [Item]()
    var searching = false
    var searchArray  : [Item]?
    var tempArray = [Item]()
    let singletonObj = Singleton.getInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        seachBar.delegate = self
        let userDefaults = UserDefaults.standard
        //userDefaults.set(false, forKey: "hasLaunched")
        if userDefaults.bool(forKey: "hasLaunched")
        {
            //deleteData()
            loadFromCoreData()
            print(productArray.count)
        }
        else{
            singletonObj().createCust()
            tempArray = singletonObj().returnProductArray()
        productArray = tempArray
        saveToCoreData()
        loadFromCoreData()
        print(productArray.count)
            userDefaults.set(true, forKey: "hasLaunched")
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searching
        {
            return searchArray!.count
        }
        else
        {
        return productArray.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        
        if searching
        {
            cell.nameLabel.text = searchArray![indexPath.row].name
            cell.descLabel.text = searchArray![indexPath.row].description
        }
        else{
        cell.nameLabel.text = productArray[indexPath.row].name
        cell.descLabel.text = productArray[indexPath.row].description
        }
        // Configure the cell...

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productArray.removeAll()
        loadFromCoreData()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let newVC = sb.instantiateViewController(identifier: "detailView") as! DetailsViewController
        if searching{
            newVC.product = searchArray![indexPath.row]
        }else
        {
            newVC.product = productArray[indexPath.row]
        }
        navigationController?.pushViewController(newVC, animated: true)
    }

    func deleteData()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                     
        let context = appDelegate.persistentContainer.viewContext
               let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        fetchRequest.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(fetchRequest)
            
            for managedObjects in results{
                if let managedObjectsData = managedObjects as? NSManagedObject
                {
                    context.delete(managedObjectsData)
                }
            
            }

            
            
        }catch{
            print(error)
        }
        
        
        
    }
    
    func saveToCoreData()
    {
        deleteData()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        for i in tempArray
        {
            
            
            
            
            //fdgdfgdgdfgdf
            let newTask = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
            newTask.setValue(i.name, forKey: "name")
            newTask.setValue(i.description, forKey: "desc")
            newTask.setValue(i.price, forKey: "price")
            newTask.setValue(i.id, forKey: "id")
        
        
        do
                   {
                        try context.save()
                       print(newTask, "is saved")
                   }catch
                   {
                       print(error)
                   }
        }
        
    }
    func loadFromCoreData()
    {
        
        productArray = [Item]()
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
              
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        do{
            let results = try context.fetch(fetchRequest)
            if results is [NSManagedObject]
            {
                for result in results as! [NSManagedObject]
                {
                    let name = result.value(forKey: "name") as! String
                    let desc = result.value(forKey: "desc") as! String
                    let price = result.value(forKey: "price") as! Double
                    let id = result.value(forKey: "id") as! String
                    let product = Item(id: id, name: name, description: desc, price: price)
                    self.productArray.append(product)
                    print(productArray.count)
                    //print(result)

                }
            }
        } catch{
            print(error)
        }
                      
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
     let filtered = productArray.filter { $0.name.lowercased().contains(searchText.lowercased())}
                
        if filtered.count>0
        {
         //tasks = []
            searchArray = filtered;
            searching = true;
        }
        else
        {
         searchArray = self.productArray
            searching = false;
        }
        self.tableView.reloadData();
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
    {
        return true;
    }
    
    
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

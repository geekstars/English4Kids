//
//  DetailVC.swift
//  English4Kids
//e
//  Created by Hoàng Minh Thành on 9/6/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class DetailVC: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle : String!
    var dictData : NSDictionary!
    var arrayKeys : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.title = stringTitle
        self.createDataWithName(stringTitle)
        self.tableView.registerClass((UITableViewCell.self), forCellReuseIdentifier: "Cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayKeys.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        let key:String = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 50
    }
    var chosenCellIndex = 0
    func createDataWithName(title:String)
    {
        var path: String = ""
        if (title == "Fruits")
        {
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")!
        }
        if (title == "Animals")
        {
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")!
        }
        if (title == "Natures")
        {
            path = NSBundle.mainBundle().pathForResource("NaturesList", ofType: "plist")!
        }
        if (title == "Flowers")
        {
            path = NSBundle.mainBundle().pathForResource("FlowersList", ofType: "plist")!
        }
        if (title == "Pokemons")
        {
            path = NSBundle.mainBundle().pathForResource("PokemonsList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys
        arrayKeys = arrayKeys.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        chosenCellIndex = indexPath.row
        self.performSegueWithIdentifier("yourSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let secondViewController = segue.destinationViewController as! ShowDetailVC
        secondViewController.name = String(arrayKeys[chosenCellIndex])
        secondViewController.image = String(dictData[String(arrayKeys[chosenCellIndex])]!)
    }
}

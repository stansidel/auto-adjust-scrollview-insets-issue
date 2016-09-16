//
//  TableViewController.swift
//  Test Adjust Scrollview Insets Issue
//
//  Created by Stanislav Sidelnikov on 15/09/16.
//  Copyright © 2016 Stanislav Sidelnikov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let searchController = UISearchController(searchResultsController: nil)
    private let data = ["One", "Two", "Three", "Four", "Five"]

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("InfoCell", forIndexPath: indexPath)

        cell.textLabel?.text = data[indexPath.row]

        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            (segue.destinationViewController as! ViewController).titleString = data[selectedIndexPath.row]
        }
    }

}

extension TableViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    }
}


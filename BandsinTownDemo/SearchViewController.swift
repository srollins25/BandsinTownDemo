//
//  SearchViewController.swift
//  BandsinTownDemo
//
//  Created by stephan rollins on 10/15/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {

    }
    

    @IBOutlet weak var artistsView: UIView!
    @IBOutlet weak var favoritesView: UIView!
    var users = [User]()
    var searchUser = [User]()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationItem.title = "test"
        //view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeView(_ sender: UISegmentedControl)
    {
        if(sender.selectedSegmentIndex == 0)
        {
            artistsView.alpha = 1
            favoritesView.alpha = 0
        }
        else if(sender.selectedSegmentIndex == 1)
        {
            artistsView.alpha = 0
            favoritesView.alpha = 1
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

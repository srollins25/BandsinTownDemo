//
//  SearchViewController.swift
//  BandsinTownDemo
//
//  Created by stephan rollins on 10/15/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {

    }
    

    @IBOutlet weak var artistsView: UIView!
    @IBOutlet weak var favoritesView: UIView!
    @IBOutlet weak var searchTblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var artists = [Artist]()
    //let headers = ["x-api-key": "EJqbBuarkq7bNqBZgNnaA6hPG5b0HzAY1q6CBAF4"]
    //var searchUser = [User]()
    //https://search.bandsintown.com/search?query=%7B%22term%22%3A%22John%22%2C%22entities%22%3A% 5B%7B%22type%22%3A%22artist%22%7D%5D%7D​
    var searching = false
    var searchArtist = [Artist]()
    

        
        //navigationItem.title = "test"
        //view.backgroundColor = .red
        // Do any additional setup after loading the view.
    
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching)
        {
            //set cell pic, label, and fav button
            return searchArtist.count
        }
        else
        {
            //set cell pic, label, and fav button
            return artists.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! ArtistCell
        
        if(searching)
        {
            //set cell pic, label, and fav button
        }
        else
        {
            //set cell pic, label, and fav button
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        searchArtist = artists.filter({$0.name!.lowercased().prefix(textSearched.count) == textSearched.lowercased()})
        searching = true
        searchTblView.reloadData()
        
    }
    
}
























//
//  SearchViewController.swift
//  BandsinTownDemo
//
//  Created by stephan rollins on 10/15/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {

    }
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    @IBOutlet weak var artistsView: UIView!
    @IBOutlet weak var favoritesView: UIView!
    @IBOutlet weak var searchTblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var artists = [Artist]()
    var searching = false
    var searchArtist = [Artist]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        execute(URL(string: "https://rest.bandsintown.com/artists/LilWayne?app_id=test")!, completion: { (json, error) in
            if let error = error {
                print(error.localizedDescription)
            }
                
            else if let json = json {
                print(json.description)
            }
        }  )
        // Do any additional setup after loading the view.
    }

    
    //
    // changes the view depending on what segment is selected
    //
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
    
    
    //
    //
    //
    func execute(_ url: URL, completion: @escaping WebServiceResponse)
    {
        Alamofire.request(url, headers: ["x-api-key": "EJqbBuarkq7bNqBZgNnaA6hPG5b0HzAY1q6CBAF4"]).responseJSON(completionHandler: { response in
            
            if let error = response.error {
                completion(nil, error)
            }
                
            else if let jsonArr = response.result.value as? [[String: Any]]
            {
                completion(jsonArr, nil)
            }
                
            else if let jsonDictionary = response.result.value as? [String: Any]
            {
                let artist = Artist()
                artist.id = (jsonDictionary["id"] as! String)
                artist.name = (jsonDictionary["name"] as! String)
                artist.image_url = (jsonDictionary["image_url"] as! String)
                artist.upcoming_event_count = (jsonDictionary["upcoming_event_count"] as! NSNumber)
                self.artists.append(artist)
                print("id test: ", artist.id!)
                print("name test: ", artist.name!)
                print("image_url test: ", artist.image_url!)
                print("upcoming_event_count test: ", artist.upcoming_event_count!)
                completion([jsonDictionary], nil)

            }
        })
    }

    //
    //
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if(searching)
//        {
//            //set cell pic, label, and fav button
//            print(true)
//            return searchArtist.count
//        }
//        else
//        {
//            //set cell pic, label, and fav button
//            print(false)

            return artists.count
       // }

    }
    
    //
    //
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = searchTblView.dequeueReusableCell(withIdentifier: "custom") as! ArtistCell
        
//        if(searching)
//        {
//            //set cell pic, label, and fav button
//        }
//        else
//        {
//            //set cell pic, label, and fav button
//        }
        cell.backgroundColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    //
    //
    //
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        searchArtist = artists.filter({$0.name!.lowercased().prefix(textSearched.count) == textSearched.lowercased()})
        searching = true
        searchTblView.reloadData()
    }
    
    //
    //
    //
    
    
}
























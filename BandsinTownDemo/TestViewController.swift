//
//  TestViewController.swift
//  BandsinTownDemo
//
//  Created by stephan rollins on 10/20/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    private let networkClient = NetworkingClient()
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func requestButton(_ sender: Any) {
        guard let urlToExecute = URL(string: "https://search.bandsintown.com/search?query=%7B%22term%22%3A%22John%22%2C%22entities%22%3A%5B%7B%22type%22%3A%22artist%22%7D%5D%7D")
        else
        {
            return
        }
        
        networkClient.execute(urlToExecute) { (json, error) in
            
            if let error = error {
                self.textView.text = error.localizedDescription
            }
            
            else if let json = json {
                self.textView.text = json.description
            }
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

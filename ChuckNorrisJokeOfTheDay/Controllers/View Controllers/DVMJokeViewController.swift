//
//  DVMJokeViewController.swift
//  ChuckNorrisJokeOfTheDay
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

import UIKit

class DVMJokeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var jokeLabel: UILabel!
    
    //MARK: - Properties
    var joke: DVMJoke?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func fetchJokeButtonTapped(_ sender: Any) {
        fetchNewJoke()
    }
    
    func fetchNewJoke() {
        DVMJokeController.fetchNewJoke { (joke) in
            if let joke = joke {
                self.updateViews(for: joke)
            }
        }
    }
    
    func updateViews(for joke: DVMJoke) {
        DispatchQueue.main.async {
            self.jokeLabel.text = joke.joke
        }
        
    }
    
    
}//end of class

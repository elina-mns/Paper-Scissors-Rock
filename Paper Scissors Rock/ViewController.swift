//
//  PlayViewController.swift
//  Paper Scissors Rock
//
//  Created by Elina Mansurova on 2020-08-31.
//  Copyright © 2020 Elina Mansurova. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    var resultString = ""
    var resultImage: UIImage?
    var history = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showHistory(_ sender: AnyObject) {
        //TODO: Present HistoryViewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didTapOnPaper" {
            let controller = segue.destination as! ResultViewController
            controller.resultString = self.resultString
            controller.image = resultImage
        } else if segue.identifier == "didTapOnScissors" {
            let controller = segue.destination as! ResultViewController
            let userChoice = GameState.scissors
            let appResult = randomResult()
            let result = compareResult(userResult: userChoice, appResult: appResult)
            resultString = result.text
            resultImage = result.image
            controller.resultString = self.resultString
            controller.image = resultImage
        }
    }
    
    @IBAction func didTapOnPaper(_ sender: Any) {
        let userChoice = GameState.paper
        let appResult = randomResult()
        let result = compareResult(userResult: userChoice, appResult: appResult)
        resultString = result.text
        resultImage = result.image
        performSegue(withIdentifier: "didTapOnPaper", sender: self)
    }
    
    @IBAction func didTapOnRock(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
        let userChoice = GameState.rock
        let appResult = randomResult()
        let result = compareResult(userResult: userChoice, appResult: appResult)
        resultString = result.text
        resultImage = result.image
        controller.resultString = self.resultString
        controller.image = self.resultImage
        present(controller, animated: true, completion: nil)
    }
    
    func randomResult() -> GameState {
        let names = GameState.allCases
        let result = names.randomElement() ?? .paper
        return result
    }
    
    
    func compareResult(userResult: GameState, appResult: GameState) -> (text: String, image: UIImage?) {
        switch (userResult, appResult) {
        case (.paper, .rock):
            return ("Paper covers rock. You win!", UIImage(named: "PaperCoversRock"))
        case (.paper, .paper):
            return ("We have a tie.", UIImage(named: "itsATie"))
        case (.paper, .scissors):
            return ("Scissors cut paper. You lost.", UIImage(named: "ScissorsCutPaper"))
        case (.rock, .paper):
            return ("Paper covers rock. You lost.", UIImage(named: "PaperCoversRock"))
        case (.rock, .scissors):
            return ("Rock stronger than scissors. You win!", UIImage(named: "RockCrushesScissors"))
        case (.rock, .rock):
            return ("We have a tie.", UIImage(named: "itsATie"))
        case (.scissors, .paper):
            return ("Scissors cut paper. You win!", UIImage(named: "ScissorsCutPaper"))
        case (.scissors, .rock):
            return ("Scissors weaker than rock. You lost.", UIImage(named: "RockCrushesScissors"))
        case (.scissors, .scissors):
            return ("We have a tie.", UIImage(named: "itsATie"))
        }
    }
}



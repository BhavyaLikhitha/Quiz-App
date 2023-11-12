import UIKit
struct Question {
    let text: String
    let options: [String]
    let correctAnswer: String
    let image: UIImage
}

class QuizViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var answerButtonA: UIButton!
    @IBOutlet weak var answerButtonB: UIButton!
    @IBOutlet weak var answerButtonC: UIButton!
    @IBOutlet weak var answerButtonD: UIButton!
    
    let questions: [Question] = [
        Question(
            text: "What is the national animal of India?",
            options: ["Lion", "Tiger", "Panda", "Polar Bear"],
            correctAnswer: "Tiger",
            image: UIImage(named: "p")!
        ),
        Question(
            text: "What is the national flower of India?",
            options: ["Lotus", "Lilli", "Hibiscus","Sunflower"],
            correctAnswer: "Lotus",
            image: UIImage(named: "f")!

        ),
        Question(
        text: "What is the national bird of India?",
        options: ["Swift", "Hyna", "Parrot","Peacock"],
        correctAnswer: "Peacock",
        image: UIImage(named: "an")!
        )
    ]
    
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
    }
    
    func displayQuestion() {
        if currentQuestionIndex >= questions.count{
            performSegue(withIdentifier: "s2", sender: nil)
        }
        if currentQuestionIndex < questions.count {
            let currentQuestion = questions[currentQuestionIndex]
            questionLabel.text = currentQuestion.text
            questionImageView.image = currentQuestion.image
            answerButtonA.setTitle(currentQuestion.options[0], for: .normal)
            answerButtonB.setTitle(currentQuestion.options[1], for: .normal)
            answerButtonC.setTitle(currentQuestion.options[2], for: .normal)
            answerButtonD.setTitle(currentQuestion.options[3], for: .normal)
            //view.backgroundColor = currentQuestion.bg
          
        } else {
            // All questions have been answered, transition to the "Thank You" screen
            performSegue(withIdentifier: "s2", sender: nil)
        }
    }
    
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        if currentQuestionIndex >= questions.count-1{
            displayQuestion()
        }
        let currentQuestion = questions[currentQuestionIndex]
        if sender.currentTitle == currentQuestion.correctAnswer {
            score += 1
        } else {
            // Show an alert for incorrect answers
            let alertController = UIAlertController(title: "WRONG ANSWER", message: "Try again later", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        
        
        currentQuestionIndex += 1
        
        displayQuestion()
    }    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "s2" {
            if let thankYouViewController = segue.destination as? ThankYouViewController {
                thankYouViewController.score = score
            }
        }
    }
}


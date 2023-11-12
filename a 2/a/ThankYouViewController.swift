
    import UIKit
    
    class ThankYouViewController: UIViewController {
        @IBOutlet weak var scoreLabel: UILabel!
        
        var score: Int = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named:"j")
            backgroundImage.contentMode = .scaleAspectFit
            self.view.insertSubview(backgroundImage,at:0)
            scoreLabel.text = "Your score is: \(score)"
        }
        
    
        @IBOutlet weak var web1: UIWebView!
        
        @IBAction func b1(_ sender: Any) {
            var urlString1 = URL(string: "https://www.youtube.com/shorts/xb0Qb3QEWsU")
            var UrlReq1  = URLRequest(url: urlString1!)
            web1.loadRequest(UrlReq1)
        }
        
    
}

    

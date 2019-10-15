
import UIKit
import Alamofire

class ViewController: UIViewController {

    private let networkingClient = NetworkingClient()
    
    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func BtnTapped(_ sender: Any) {
        print("fgihuhgifd")
        guard let urlToExecute = URL(string:"https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        networkingClient.excute(urlToExecute) { (json, error) in
            if let error = error{
                self.textview.text=error as? String
            }else if let json = json{
                self.textview.text=json.description
                print(self.textview.text!)
            }
        }
    }
    
    
    
//https://jsonplaceholder.typicode.com/posts

}


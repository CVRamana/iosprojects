
import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var txtfld: AppTextField!
    
    private let viewModel = ViewModel()
    // To hide the keyboard -
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        txtfld.delegate = self
       // txtfld.cornerRadius = 5;
        txtfld.textAlignment = .center
        txtfld.borderColor = UIColor.red.cgColor
     //   txtfld.Background = UIImage.init(cgImage: "logo1" as! //CGImage)
        
   //     print(txtfld.cornerRadius)
        
    }
    
    @IBAction private func btnAction(_ sender: UIButton) {
        viewModel.hitAPI()
    }
}


//MARK: - ViewModelProtocol implementation -
extension ViewController: ViewModelProtocol {
    func willHitAPI(_ obj: ViewModel) {
        if obj === viewModel {
            
        } else {
            
        }
        print("show loader")

    }
    
    func apiHiSuccessful(_ obj: ViewModel, message: String) {
        print("hide loader")
        print(message)

    }
    
    func apiHitFail(_ obj: ViewModel, message: String) {
        print("hide loader")
        print(message)
    }
    
}


extension ViewController: UITextFieldDelegate {
    
    @objc private func textDidChange(_ textFiled: UITextField ) {
    }
}

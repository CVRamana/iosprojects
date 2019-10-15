
import UIKit

class AppTextField: UITextField {
 
    var borderColor: CGColor? {
        get {
            return self.layer.borderColor
        }
        
        set {
            self.layer.borderWidth = 1
            self.layer.borderColor = newValue
        }
    }
  
    var cornerRadius: CGFloat {
        set  {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
////
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
    
    private func setup(){
        self.background = UIImage(named: "logo1")
        self.textAlignment = .center
        self.borderStyle = .roundedRect
       // self.borderColor = .
       // self.leftView = .appearance()
    }
    
    //
    var lightTextColor: UIColor = UIColor.gray {
    didSet {
    self.textColor = lightTextColor
    }
}

var boldTextColor: UIColor = UIColor.black

override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.textColor = lightTextColor
    self.delegate = self as? UITextFieldDelegate
}
    
    required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
    }

}

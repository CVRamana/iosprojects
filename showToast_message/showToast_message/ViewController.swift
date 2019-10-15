
import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        showToast(message: "gsdkhjgjhsdvgkjdhgkjfsdgjhdsgkuyfliauytghkcnvb,ajhgsfkluycjhgv,jhdsvgacfleiuwfcliuekwvgkjdhgkjfsdgjhdsgkuyfliauytghkcnvb,ajhgsfkluycjhgv,jhdsvgacfleiuwfcliuekwvgkjdhgkjfsdgjhdsgkuyfliauytghkcnvb,ajhgsfkluycjhgv,jhdsvgacfleiuwfcliuekwvgkjdhgkjfsdgjhdsgkuyfliauytghkcnvb,ajhgsfkluycjhgv,jhdsvgacfleiuwfcliuekwvgkjdhgkjfsdgjhdsgkuyfliauytghkcnvb,ajhgsfkluycjhgv,jhdsvgacfleiuwfcliuekwcghjv,bv,xhjcc")
    }
    
}
extension UIViewController{
 
    
    
    func showToast(message:String){
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        let toastlabel=UILabel()
        toastlabel.text=message
        toastlabel.textAlignment = .center
        toastlabel.font = UIFont.systemFont(ofSize: 14)
        toastlabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastlabel.numberOfLines=0
        
        let textSize = toastlabel.intrinsicContentSize
        let labelHeight = (textSize.width / window.frame.width*30)
        let labelWidth = min(textSize.width, window.frame.width - 40)
        let lbl  = max(labelHeight, textSize.height+20)
    
        
        toastlabel.frame = CGRect(x: 20, y: (window.frame.height-90) - lbl , width: labelWidth, height: lbl)
        toastlabel.center.x = window.center.x
        toastlabel.layer.cornerRadius=10
        toastlabel.layer.masksToBounds=true
        
        window.addSubview(toastlabel)
        UIView.animate(withDuration: 3.0, animations: {
            toastlabel.alpha=0
        }) { (_) in
            toastlabel.removeFromSuperview()
        }
        
    }
    
    
}


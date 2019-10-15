/// THE SOFTWARE.

import UIKit

class ViewController: UIViewController {
  
  /// The currently selected curve to be used for all animations
  var selectedCurve: UIView.AnimationCurve = .easeInOut

  /// A list of colors to be used when animating the background color
  let colors: [UIColor] = [.white, .red, .green, .orange, .yellow, .lightGray, .darkGray]

  /// The ⬇️ button that rotates and moves around the screen
  @IBOutlet var movingButton: UIButton!

  /// The fake HUD view
  @IBOutlet var hud: FakeHUD?

  @IBAction func moveTo(button: UIButton) {
    let destination = view.convert(button.center, from: button.superview)
    movingButton.move(to: destination.applying(CGAffineTransform(translationX: 0.0, y: -70.0)),
                      duration: 1.0,
                      options: selectedCurve.animationOption)
  }
  
  @IBAction func rotate(button: UIButton) {
    button.rotate180(duration: 1.0, options: selectedCurve.animationOption)
  }
  
  @IBAction func zoomIn(button: UIButton) {
    let pickerVC = AnimationCurvePickerViewController(style: .grouped)
    pickerVC.delegate = self
    pickerVC.view.bounds = CGRect(x: 0, y: 0, width: 280, height: 300)
    pickerVC.view.center = view.center
    
    addChild(pickerVC)
    view.addSubviewWithZoomInAnimation(pickerVC.view, duration: 1.0, options: selectedCurve.animationOption)
    pickerVC.didMove(toParent: self)
  }
  
  @IBAction func showHUD() {
    let nib = UINib.init(nibName: "FakeHUD", bundle: nil)
    nib.instantiate(withOwner: self, options: nil)
    if let hud = hud {
      hud.center = view.center
      view.addSubviewWithFadeAnimation(hud, duration: 1.0, options: selectedCurve.animationOption)
    }
  }
  
  @IBAction func dismissHUD() {
    hud?.removeWithSinkAnimation(steps: 75)
  }

  @IBAction func changeBackgroundColor() {
    view.changeColor(to: colors.randomElement()!, duration: 1.0, options: selectedCurve.animationOption)
  }

}

// MARK: AnimationCurvePickerViewControllerDelegate
extension ViewController: AnimationCurvePickerViewControllerDelegate {
  
  func animationCurvePickerViewController(_ controller: AnimationCurvePickerViewController, didSelectCurve curve: UIView.AnimationCurve) {
    selectedCurve = curve
    
    controller.willMove(toParent: nil)
    controller.view.removeWithZoomOutAnimation(duration: 1.0, options: selectedCurve.animationOption)
    controller.removeFromParent()
  }
  
}

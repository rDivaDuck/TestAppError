

import UIKit

class SettingsLauncher {
    
    var homeController: HomeController?
    let shadowView = UIView()
    
    let MenuView: UIView = {
        let View = UIView(frame: .zero)
        View.backgroundColor = UIColor.white
        View.translatesAutoresizingMaskIntoConstraints = false
        return View
    }()
    
    var downConstraint: NSLayoutConstraint?
    var upConstraint: NSLayoutConstraint?

    func showSettings() {
        if let window = UIApplication.shared.keyWindow{
            shadowView.backgroundColor = UIColor(white: 0,
                                                alpha: 0.4)
            shadowView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(settingsDown)))
            window.addSubview(shadowView)
            shadowView.frame = window.frame
            shadowView.alpha = 0

            window.addSubview(MenuView)

            downConstraint = MenuView.topAnchor.constraint(equalTo: window.bottomAnchor)
            downConstraint?.isActive = true
            upConstraint = MenuView.topAnchor.constraint(equalTo: window.bottomAnchor, constant: -300)
            MenuView.heightAnchor.constraint(equalToConstant: 300).isActive = true
            MenuView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
            MenuView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
            MenuView.layoutIfNeeded()
            window.layoutIfNeeded()
            settingsUp()
        }
    }
    
    func settingsUp() {
        downConstraint?.isActive = false
        upConstraint?.isActive = true
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.shadowView.alpha = 1
                        if let window = UIApplication.shared.keyWindow {
                            window.layoutIfNeeded()
                        }
        }, completion: nil)
    }
    
    @objc func settingsDown() {
        downConstraint?.isActive = true
        upConstraint?.isActive = false
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.shadowView.alpha = 0
                        if let window = UIApplication.shared.keyWindow {
                            window.layoutIfNeeded()
                        }
        }, completion: nil )
    }
    
}


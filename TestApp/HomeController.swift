

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView.backgroundColor = UIColor.blue
        setupNavBar()
            }
    
    func setupNavBar() {
        navigationController?.navigationBar.isTranslucent = false
        let leftNavButton: UIBarButtonItem = {
            let Button = UIBarButtonItem(barButtonSystemItem: .play ,
                                         target: self,
                                         action: #selector(self.settingsLauncherFunc))
            Button.tintColor = UIColor.red
            return Button
        }()
        navigationItem.leftBarButtonItem = leftNavButton
    }
    
    // MARK: Settings Launcher Adds settingsLauncher. functionality in the homeView
    lazy var settingsLauncher:  SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    // Launches the settings menu and dismisses the keyboard
    @objc func settingsLauncherFunc() {
        settingsLauncher.showSettings()
        print("Settings launcher func called")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.magenta
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 50, height: 50)
    }

}

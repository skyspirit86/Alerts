//
//  ViewController.swift
//  Alerts
//
//  Created by Zolt Varga on 02/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // One Button. PreferredStyle: alert. Style: default
    @objc func alertType1() {
        // 1. Create Alert
        let alert = UIAlertController(title: "Reminder",
                                      message: "Your Ticket will Expire Soon.",
                                      preferredStyle: .alert)
        
        // 2. Creeate Actions
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in print("OK tap") }))
        
        // 3. Show
        present(alert, animated: true, completion: nil)
    }
    
    // Two Button. PreferredStyle: alert. Style: default, cancel
    @objc func alertType2() {
        // 1. Create Alert
        let alert = UIAlertController(title: "A new update is now available for application",
                                      message: "Do you want to update?",
                                      preferredStyle: .alert)
        
        // 2. Creeate Actions
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { _ in print("OK tap") }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in print("Cancel tap") }))
        
        // 3. Show
        present(alert, animated: true, completion: nil)
    }
    
    // Three Button. PreferredStyle: alert. Style: default, destructive, cancel
    @objc func alertType3() {
        // 1. Create Alert
        let alert = UIAlertController(title: "News",
                                      message: "New Sound was released by your favourite artist.",
                                      preferredStyle: .alert)
        
        // 2. Creeate Actions
        alert.addAction(UIAlertAction(title: "Download Now", style: .default, handler: { _ in print("Download Now tap") }))
        alert.addAction(UIAlertAction(title: "Remind Me Later", style: .destructive, handler: { _ in print("Remind Me Later tap") }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in print("Cancel tap") }))
        
        // 3. Show
        present(alert, animated: true, completion: nil)
    }
    
    // ActionSheet
    @objc func alertType4() {
        // 1. Create Alert
        let alert = UIAlertController(title: "News",
                                      message: "New Sound was released by your favourite artist.",
                                      preferredStyle: .actionSheet)
        
        // 2. Creeate Actions
        alert.addAction(UIAlertAction(title: "Download Now", style: .default, handler: { _ in print("Download Now tap") }))
        alert.addAction(UIAlertAction(title: "Remind Me Later", style: .destructive, handler: { _ in print("Remind Me Later tap") }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in print("Cancel tap") }))
        
        // 3. Show
        // Because iPad /START
        alert.popoverPresentationController?.sourceView = view
        alert.popoverPresentationController?.sourceRect = button4.frame
        // Because iPad /END
        present(alert, animated: true, completion: nil)
    }
    
    // Alert with Edit Field
    @objc func alertType5() {
        // 1. Create Alert
        let alertController = UIAlertController(title: "Add", message: "Add new item to Todo list?", preferredStyle: .alert)
        
        // 2. Create Actions
        let confirmAction = UIAlertAction(title: "Save", style: .default) { _ in
            // 2a. Monitor the Text
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                print("Final Text: \(text)")
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        alertController.addTextField { textField in
            textField.placeholder = "Please enter your new Item"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        // 3. Show
        present(alertController, animated: true, completion: nil)
    }
    
    // Alert with No Buttons
    @objc func alertType6() {
        // 1. Create Alert
        let alert = UIAlertController(title: "Alert Title",
                                      message: "No Buttons. Can't dismiss now. Damn.",
                                      preferredStyle: .alert)
        
        // 2. Create Actions
        
        // 3. Show
        present(alert, animated: true, completion: nil)
    }
    
    // Activity Views
    @objc func alertType7() {
        let image = UIImage(systemName: "heart.fill")
        let items: [Any] = [image!,
                            "This app is my favorite",
                            URL(string: "https://medium.com/@varga-zolt")!]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        // Because iPad /START
        activityViewController.popoverPresentationController?.sourceView = view
        activityViewController.popoverPresentationController?.sourceRect = button7.frame
        // Because iPad /END
        
        present(activityViewController, animated: true)
    }
    
    // Popover
    @objc func alertType8() {
        
        // 1. Frame where to present Popover
        let buttonFrame = button8.frame
        
        // 2. Configure the presentation controller
        let popoverContentController = PopoverViewController()
        popoverContentController.modalPresentationStyle = .popover
        
        // 3. Present popover
        if let popoverPresentationController = popoverContentController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = view
            popoverPresentationController.sourceRect = buttonFrame
            popoverPresentationController.delegate = self
            present(popoverContentController, animated: true, completion: nil)
        }
    }
    
    // MARK: - UI
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        
        return stackView
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("One Button", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alertType1), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Two Button", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alertType2), for: .touchUpInside)
        return button
    }()
    
    lazy var button3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Three Button", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alertType3), for: .touchUpInside)
        return button
    }()
    
    lazy var button4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ActionSheet", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alertType4), for: .touchUpInside)
        return button
    }()
    
    lazy var button5: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Alert with Edit Field", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alertType5), for: .touchUpInside)
        return button
    }()
    
    lazy var button6: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Alert with No Button", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alertType6), for: .touchUpInside)
        return button
    }()
    
    lazy var button7: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Activity Views", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alertType7), for: .touchUpInside)
        return button
    }()
    
    lazy var button8: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Popover", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alertType8), for: .touchUpInside)
        return button
    }()
}

// MARK: - UI
private extension ViewController {
    func setupUI() {
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        let buttons = [button1, button2, button3, button4, button5, button6, button7, button8]
        for item in buttons {
            item.widthAnchor.constraint(equalToConstant: 370).isActive = true
            item.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)
        stackView.addArrangedSubview(button6)
        stackView.addArrangedSubview(button7)
        stackView.addArrangedSubview(button8)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .fullScreen // 1. screen type
    }

    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        
        // 2. Create Popover and configure
        let vc = PopoverViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: Selector("dismiss"))
        navigationController.topViewController?.navigationItem.rightBarButtonItem = btnDone
        
        return navigationController
    }
    
    // 3. Actions
    @objc func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

class PopoverViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        view.backgroundColor = .red
    }
}

//
//  ViewController.swift
//  ContactsSample
//
//  Created by Shota Nakagami on 2018/09/28.
//  Copyright © 2018年 Shota Nakagami. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController {
    private lazy var contactPickerViewController : CNContactPickerViewController = {
       let vc = CNContactPickerViewController()
        vc.delegate = self
        vc.displayedPropertyKeys = [CNContactEmailAddressesKey]
        vc.predicateForEnablingContact = NSPredicate(format: "emailAddresses.@count > 0")
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(contactPickerViewController, animated: true, completion: nil)
    }
}

extension ViewController: CNContactPickerDelegate {
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("canceled")
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
        print("\(contactProperty.key) selected")
        guard let emailAddess = contactProperty.value as? String else { return }
        print(emailAddess)
        
        print("isEmailAddess: \(emailAddess.isEmailAddress)")
    }
}

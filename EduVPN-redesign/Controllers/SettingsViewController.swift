//
//  SettingsViewController.swift
//  EduVPN
//

import UIKit

enum SettingsViewControllerError: Error {
    case noLogAvailable
    case cannotShowLog
}

extension SettingsViewControllerError: AppError {
    var summary: String {
        switch self {
        case .noLogAvailable: return NSLocalizedString("No log available", comment: "")
        case .cannotShowLog: return NSLocalizedString("Unable to show log", comment: "")
        }
    }
}

class SettingsViewController: UITableViewController, ParametrizedViewController {

    struct Parameters {
        let environment: Environment
    }

    private var parameters: Parameters!

    @IBOutlet weak var useTCPOnlySwitch: UISwitch!

    func initializeParameters(_ parameters: Parameters) {
        guard self.parameters == nil else {
            fatalError("Can't initialize parameters twice")
        }
        self.parameters = parameters
    }

    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done, target: self, action: #selector(doneTapped(_:)))

        let userDefaults = UserDefaults.standard
        let isForceTCPEnabled = userDefaults.forceTCP

        useTCPOnlySwitch.isOn = isForceTCPEnabled
    }

    @IBAction func useTCPOnlySwitchToggled(_ sender: Any) {
        print("toggled")
        UserDefaults.standard.forceTCP = useTCPOnlySwitch.isOn
    }

    @objc func doneTapped(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController {
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 1 && indexPath.row == 0 {
            // This is a 'Connection Log' row
            return indexPath
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            // This is a 'Connection Log' row
            print("Show log")
        }
    }
}
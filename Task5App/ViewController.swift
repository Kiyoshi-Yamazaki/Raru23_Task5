//
//  ViewController.swift
//  Task5App
//
//  Created by 山崎喜代志 on 2021/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var leftTextField: UITextField!
    @IBOutlet private weak var rightTextField: UITextField!
    @IBOutlet private weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        leftTextField.keyboardType = .numberPad
        rightTextField.keyboardType = .numberPad
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "課題5",
                                      message: message,
                                      preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil)
        )
        present(alert, animated: true, completion: nil)
    }

    @IBAction func calculateButton(_ sender: Any) {
        guard let leftCount = Double(leftTextField.text!) else {
            showAlert(message: "割られる数を入力してください")
            return
        }
        guard let rightCount = Double(rightTextField.text!) else {
            showAlert(message: "割る数を入力してください")
            return
        }
        guard rightCount != 0  else {
            showAlert(message: "割る数に0を入力しないでください")
            return
        }
        let totalNum = leftCount / rightCount
        // 小数点以下5桁まで表示
        totalLabel.text = String(floor(totalNum * 100000) / 100000)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

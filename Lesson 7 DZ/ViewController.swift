//
//  ViewController.swift
//  Lesson 7 DZ
//
//  Created by Павел Яковенко on 03.12.2021.
//

import UIKit

class ViewController: UIViewController{
    

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceLabel2: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var prepaymentLabel: UILabel!
    
    
    var segmentedControl = UISegmentedControl()
    var imageView = UIImageView()
    var menuArray = ["Green", "Blue", "Pink"]
    let imageArray = [UIImage(named: "nb_green.jpg"),
                      UIImage(named: "nb_grey.jpg"),
                      UIImage(named: "nb_pink.jpg")]
    let picker = UIPickerView()
    var sizeArray = [String]()
    var switchPrepayment = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create SegmentControl
        self.segmentedControl = UISegmentedControl(items: self.menuArray)
        self.segmentedControl.frame = CGRect(x: 200, y: 600, width: 170, height: 30)
        self.view.addSubview(self.segmentedControl)
        
        self.segmentedControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        
        //Create ImageView
        self.imageView.frame = CGRect(x: 10, y: 200, width: 350, height: 200)
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(self.imageView)
        
        
        //Create PickerView
        picker.dataSource = self
        picker.delegate = self
        self.picker.frame = CGRect(x: 200, y: 630, width: 130, height: 100)
        self.view.addSubview(picker)
        sizeArray = ["38", "39", "40", "41", "42", "43", "44", "45", "46"]
        
        //Create Switch
        self.switchPrepayment.frame = CGRect(x: 320, y: 730, width: 10, height: 5)
        self.view.addSubview(self.switchPrepayment)
        
        
        priceLabel.text = "Стоимость"
        priceLabel2.text = "14 990 р."
        colorLabel.text = "Выберите модель"
        sizeLabel.text = "Выберите размер"
        prepaymentLabel.text = "Предоплата"
        
        
    }
    @IBAction func buttonOrder(_ sender: Any) {
        let buttonOrder = UIButton()
        
    }
    
    @objc func selectedValue (target: UISegmentedControl) {
        if target == self.segmentedControl {
            let segmentIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imageArray[segmentIndex]
        }
    }


}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizeArray.count
    }
    
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sizeArray[row]
    }
}



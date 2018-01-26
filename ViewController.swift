//
//  ViewController.swift
//  bbb
//
//  Created by 佐々木友哉 on 2017/09/08.
//  Copyright © 2017年 佐々木友哉. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var testPickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stopButtonTapped: UIButton!
    var timer: Timer?
    var currentSeconds = 0
    var stopTime = 0
    var imageView : UIImageView = UIImageView()
    var imageView2 : UIImageView = UIImageView()
    var softbank : UIImage = UIImage()
    var softbank2 : UIImage = UIImage()
    var softbank3 : UIImage = UIImage()
    var noodle : UIImage = UIImage()
    var noodle2 : UIImage = UIImage()
    var noodle3 : UIImage = UIImage()
    var noodleCount = 0
    @IBOutlet weak var startButtonTapped: UIButton!
    @IBOutlet weak var pauseButtonTapped: UIButton!
    @IBOutlet weak var restartButtonTapped: UIButton!
    let dataList = [[Int](0...60), [Int](0...59)]
    
    @IBAction func startCountDown(_ sender: UIButton) {
        stopTime = 0
        startButtonTapped.isEnabled = true
        stopButtonTapped.isEnabled = true
        pauseButtonTapped.isEnabled = true
        restartButtonTapped.isEnabled = false
        timer?.invalidate()
        currentSeconds = dataList[0][testPickerView.selectedRow(inComponent: 0)] * 60
            +  dataList[0][testPickerView.selectedRow(inComponent: 1)]
        
        if(noodleCount == 4){
            imageView.removeFromSuperview()
            softbank = UIImage(named: "p0.jpg")!
            imageView.image = softbank
            imageView.frame = CGRect(x: 200, y: 450, width: 150, height: 150)
            self.view.contentMode = UIViewContentMode.topLeft
            self.view.addSubview(imageView)
            self.view.sendSubview(toBack: imageView)
            imageView.alpha = 1.0
            
            softbank2 = UIImage(named: "p4.jpeg")!
            imageView2.image = softbank2
            imageView2.frame = CGRect(x: 0, y: 500, width: 110, height: 110)
            self.view.contentMode = UIViewContentMode.topLeft
            self.view.addSubview(imageView2)
            self.view.sendSubview(toBack: imageView2)
        }
        
        start(seconds: currentSeconds)
    }

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        startButtonTapped.isEnabled = true
        stopButtonTapped.isEnabled = false
        pauseButtonTapped.isEnabled = false
        restartButtonTapped.isEnabled = false
        label.textColor = UIColor.black
        noodleCount = 1
        if(noodleCount == 1){
            imageView.removeFromSuperview()
            softbank = UIImage(named: "p0.jpg")!
            imageView.image = softbank
            imageView.frame = CGRect(x: 200, y: 450, width: 150, height: 150)
            self.view.contentMode = UIViewContentMode.topLeft
            self.view.addSubview(imageView)
            self.view.sendSubview(toBack: imageView)
            imageView.alpha = 1.0
            
            softbank2 = UIImage(named: "p4.jpeg")!
            imageView2.image = softbank2
            imageView2.frame = CGRect(x: 0, y: 500, width: 110, height: 110)
            self.view.contentMode = UIViewContentMode.topLeft
            self.view.addSubview(imageView2)
            self.view.sendSubview(toBack: imageView2)
        }
        label.text = ("停止しました")
        timer?.invalidate()
        currentSeconds = 0
    }


    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        stopButtonTapped.isEnabled = true
        restartButtonTapped.isEnabled = true
        startButtonTapped.isEnabled = false
        if(currentSeconds >= 60){
            label.text = "残り\(currentSeconds / 60)分\(currentSeconds % 60)秒です"
        }else if(currentSeconds < 60){
            label.text = "残り\(currentSeconds)秒です"
        }
        timer?.invalidate()
        stopTime = currentSeconds
    }
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        pauseButtonTapped.isEnabled = true
        restartButtonTapped.isEnabled = false
        startButtonTapped.isEnabled = false
        stopButtonTapped.isEnabled = true
        noodleCount = 0
        start(seconds: 0)
        
    }
    
    func start(seconds: Int){

        if(currentSeconds == 180){
            imageView2.removeFromSuperview()
            noodle = UIImage(named: "p1.png")!
            imageView.image = noodle
            imageView.frame = CGRect(x: 15, y: 100, width: 300, height: 300)
            self.view.contentMode = UIViewContentMode.topLeft
            self.view.addSubview(imageView)
            self.view.sendSubview(toBack: imageView)
            imageView.alpha = 0.25
            noodleCount = 1
        }else if(currentSeconds == 240){
            imageView2.removeFromSuperview()
            noodle2 = UIImage(named: "p2.jpg")!
            imageView.image = noodle2
            imageView.frame = CGRect(x: 10, y: 100, width: 300, height: 300)
            self.view.contentMode = UIViewContentMode.topLeft
            self.view.addSubview(imageView)
            self.view.sendSubview(toBack: imageView)
            imageView.alpha = 0.25
            noodleCount = 2
        }else if(currentSeconds == 300){
            imageView2.removeFromSuperview()
            noodle3 = UIImage(named: "p3.jpg")!
            imageView.image = noodle3
            imageView.frame = CGRect(x: 10, y: 100, width: 300, height: 300)
            self.view.contentMode = UIViewContentMode.topLeft
            self.view.addSubview(imageView)
            self.view.sendSubview(toBack: imageView)
            imageView.alpha = 0.25
            noodleCount = 3
        }else{
            if(noodleCount == 1 || noodleCount == 2 || noodleCount == 3){
                imageView.removeFromSuperview()
                softbank = UIImage(named: "p0.jpg")!
                imageView.image = softbank
                imageView.frame = CGRect(x: 200, y: 450, width: 150, height: 150)
                self.view.contentMode = UIViewContentMode.topLeft
                self.view.addSubview(imageView)
                self.view.sendSubview(toBack: imageView)
                imageView.alpha = 1.0
                softbank2 = UIImage(named: "p4.jpeg")!
                imageView2.image = softbank2
                imageView2.frame = CGRect(x: 0, y: 500, width: 110, height: 110)
                self.view.contentMode = UIViewContentMode.topLeft
                self.view.addSubview(imageView2)
                self.view.sendSubview(toBack: imageView2)
            }
        }
        
        currentSeconds = seconds + stopTime
        label.textColor = UIColor.black
        if(currentSeconds >= 60){
        label.text = "残り\(currentSeconds / 60)分\(currentSeconds % 60)秒です"
        }else if(currentSeconds < 60){
            label.text = "残り\(currentSeconds)秒です"
        }

        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(ViewController.update), userInfo:nil, repeats:true)
    }
    func update(){
        
        if(currentSeconds == 0){
            timer?.invalidate()
            label.text = ("終了です")
            label.textColor = UIColor.black
            let soundId: SystemSoundID = 1005
            AudioServicesPlayAlertSound(soundId)
            startButtonTapped.isEnabled = true
            stopButtonTapped.isEnabled = false
            pauseButtonTapped.isEnabled = false
            restartButtonTapped.isEnabled = false
        }else{
            currentSeconds -= 1
            if(currentSeconds >= 60){
                label.textColor = UIColor.black
                label.text = "残り\(currentSeconds / 60)分\(currentSeconds % 60)秒です"
            }else if(currentSeconds <= 60){
                label.textColor = UIColor.black
            label.text = "残り\(currentSeconds)秒です"
            }
            if(currentSeconds <= 10){
                label.textColor = UIColor.red
            }
            if(currentSeconds == 0){
                timer?.invalidate()
                label.text = ("終了です")
                label.textColor = UIColor.black
                let soundId: SystemSoundID = 1005
                AudioServicesPlayAlertSound(soundId)
                startButtonTapped.isEnabled = true
                stopButtonTapped.isEnabled = false
                pauseButtonTapped.isEnabled = false
                restartButtonTapped.isEnabled = false
                imageView2.removeFromSuperview()
                softbank3 = UIImage(named: "p5.jpeg")!
                imageView.image = softbank3
                imageView.frame = CGRect(x: 60, y: 360, width: 200, height: 220)
                self.view.contentMode = UIViewContentMode.topLeft
                self.view.addSubview(imageView)
                self.view.sendSubview(toBack: imageView)
                imageView.alpha = 1.0
                noodleCount = 4
            }
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataList.count
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component:Int) -> CGFloat {
        
        switch component {
        case 0:
            return 40
        default:
            return 50
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textAlignment = NSTextAlignment.left
        pickerLabel.text = String(dataList[component][row])
        
        return pickerLabel
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopButtonTapped.isEnabled = false
        pauseButtonTapped.isEnabled = false
        restartButtonTapped.isEnabled = false

        let mStr = UILabel()
        mStr.text = "分"
        mStr.sizeToFit()
        mStr.frame = CGRect(x: testPickerView.bounds.width*19/50 - mStr.bounds.width/2,
                            y: testPickerView.bounds.height/2 - (mStr.bounds.height/2),
                            width: mStr.bounds.width, height: mStr.bounds.height)
        testPickerView.addSubview(mStr)
        
        let sStr = UILabel()
        sStr.text = "秒"
        sStr.sizeToFit()
        sStr.frame = CGRect(x: testPickerView.bounds.width*51/100 - sStr.bounds.width/2,
                            y: testPickerView.bounds.height/2 - (sStr.bounds.height/2),
                            width: sStr.bounds.width, height: sStr.bounds.height)
        testPickerView.addSubview(sStr)
        
        
        softbank = UIImage(named: "p0.jpg")!
        imageView.image = softbank
        imageView.frame = CGRect(x: 200, y: 450, width: 150, height: 150)
        self.view.contentMode = UIViewContentMode.topLeft
        self.view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        softbank2 = UIImage(named: "p4.jpeg")!
        imageView2.image = softbank2
        imageView2.frame = CGRect(x: 0, y: 500, width: 110, height: 110)
        self.view.contentMode = UIViewContentMode.topLeft
        self.view.addSubview(imageView2)
        self.view.sendSubview(toBack: imageView2)
        
        label.text = ("時間を設定")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


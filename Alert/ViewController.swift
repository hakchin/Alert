//
//  ViewController.swift
//  Alert
//
//  Created by Hakchin Kim on 9/6/16.
//  Copyright © 2016 Hakchin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 켜진 전구 이미지, 꺼지 전구 이미지, 제거된 전구 이미지의 상수
    let imgOn     : UIImage! = UIImage(named: "lamp-on.png")
    let imgOff    : UIImage! = UIImage(named: "lamp-off.png")
    let imgRemove : UIImage! = UIImage(named: "lamp-remove.png")
    
    // 전구 상태를 나타내는 변수(켜진 상태는 true, 꺼진 상태는 false)
    var isLampOn = true

    @IBOutlet weak var ivwLamp: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ivwLamp.image = imgOn  // 앱 실행 시 켜진 전구 이미지가 나타남
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLampOn(sender: UIButton) {
        if(isLampOn==true) {
            //전구가 켜져 있을 때
            //전구가 켜져 있다고 Alert을 실행함
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertControllerStyle.Alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.Default, handler: nil)
            lampOnAlert.addAction(onAction)
            presentViewController(lampOnAlert, animated: true, completion: nil)
        }
        else {
            //전구가 켜져 있지 않을 때
            //전구를 켬
            ivwLamp.image = imgOn
            isLampOn=true
        }
    }

    @IBAction func btnLampOff(sender: UIButton) {
        if isLampOn {
            // 전구가 켜져 있을 경우
            // 전구를 끌 것인지를 묻는 Alert을 실행
            // if(isLampOn==true)로 작성해도 무방
            let lampOffAlert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertControllerStyle.Alert)
            
            let offAction = UIAlertAction(title: "네", style: UIAlertActionStyle.Default, handler: {ACTION in self.ivwLamp.image = self.imgOff; self.isLampOn=false})
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertActionStyle.Default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            presentViewController(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertControllerStyle.Alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertActionStyle.Default, handler: {ACTION in self.ivwLamp.image = self.imgOff
            self.isLampOn=false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertActionStyle.Default, handler: {
            ACTION in self.ivwLamp.image = self.imgOn
            self.isLampOn=true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertActionStyle.Destructive, handler: {
            ACTION in self.ivwLamp.image = self.imgRemove
            self.isLampOn=false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        presentViewController(lampRemoveAlert, animated: true, completion: nil)
    }
    
}


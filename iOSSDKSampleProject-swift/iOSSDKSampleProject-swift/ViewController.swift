//
//  ViewController.swift
//  iOSSDKSampleProject-swift
//
//  Created by Roberto Avanzi on 12/12/17.
//  Copyright © 2017 Pikkart. All rights reserved.
//

import UIKit

class ViewController: PKTRecognitionController {

    var context:EAGLContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let authInfo:PKTCloudRecognitionInfo = PKTCloudRecognitionInfo(databaseName: "")
        let options:PKTRecognitionOptions = PKTRecognitionOptions(recognitionStorage:.PKTLOCAL,
                                                                  andMode:.PKTRECOGNITION_CONTINUOS_SCAN,
                                                                  andCloudAuthInfo:authInfo )
        
        startRecognition(options, andRecognitionCallback:self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        super.loadView()
        self.context=EAGLContext(api: EAGLRenderingAPI.openGLES3)
        let textureView:GLKView=GLKView(frame:UIScreen.main.bounds, context:self.context!)
        textureView.drawableColorFormat=GLKViewDrawableColorFormat.RGB565
        textureView.drawableDepthFormat=GLKViewDrawableDepthFormat.format24
        textureView.drawableStencilFormat=GLKViewDrawableStencilFormat.format8
        textureView.drawableMultisample=GLKViewDrawableMultisample.multisampleNone
        self.view=textureView
    }
    
    // MARK: PKTIRecognitionListener callbacks
    override func executingCloudSearch() {
        
    }
    
    override func cloudMarkerNotFound() {
        
    }
    
    override func internetConnectionNeeded() {
        
    }
    
    override func markerFound(_ marker: PKTMarker) {
        print("markerFound called with Id = \(marker.markerId!)!!!")
    }
    
    override func markerNotFound() {
        
    }
    
    override func markerTrackingLost(_ markerId: String!) {
        print("markerTrackingLost called!!!")
    }
    
    override func isConnectionAvailable() -> Bool {
        return false
    }
    
    
    
}


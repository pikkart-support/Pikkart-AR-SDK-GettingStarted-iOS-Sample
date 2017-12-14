//
//  ViewController.m
//  iOSSDKSampleProject-objc
//
//  Created by Roberto Avanzi on 12/12/17.
//  Copyright © 2017 Pikkart. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) EAGLContext * context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PKTCloudRecognitionInfo * authInfo = [PKTCloudRecognitionInfo PKTCloudRecognitionInfoWithDatabaseName:@""];
    PKTRecognitionOptions * options = [PKTRecognitionOptions  PKTRecognitionOptionsWithRecognitionStorage:PKTLOCAL
                                                                                                  andMode:PKTRECOGNITION_CONTINUOS_SCAN
                                                                                         andCloudAuthInfo:authInfo];
    [self StartRecognition:options andRecognitionCallback:self];
}


-(void)loadView {
    // here we define a common openGL view, not using multisampling
    [super loadView];
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    GLKView * textureView=[[GLKView alloc]
                           initWithFrame:[[UIScreen mainScreen] bounds]
                           context:self.context];
    textureView.drawableColorFormat = GLKViewDrawableColorFormatRGB565;
    textureView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    textureView.drawableStencilFormat = GLKViewDrawableStencilFormat8;
    
    // Enable multisampling
    textureView.drawableMultisample = GLKViewDrawableMultisampleNone;
    
    self.view = textureView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PKTIRecognitionListener callbacks
-(void)executingCloudSearch {
    
}

-(void)cloudMarkerNotFound {
    
}

-(void) internetConnectionNeeded {
    
}

-(void)markerFound:(PKTMarker *)marker {
    NSLog(@"markerFound called with id = %@\n", marker.markerId);
}

-(void) markerNotFound {
    
}

-(bool)isConnectionAvailable {
    return false;
}

-(void)markerTrackingLost:(NSString *)markerId {
    NSLog(@"markerLost called with id = %@\n", markerId);

}

@end

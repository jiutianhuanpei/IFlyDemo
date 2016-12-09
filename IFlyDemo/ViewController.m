//
//  ViewController.m
//  IFlyDemo
//
//  Created by shenhongbang on 2016/12/9.
//  Copyright © 2016年 中移(杭州)信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import <iflyMSC/iflyMSC.h>
#import <SHBLog/SHBLog.h>
#import <YYModel.h>

#import "IFlyFunctions.h"


@interface ViewController ()<IFlySpeechRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController {

    __weak IBOutlet UIButton *recordBtn;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (IBAction)clickedBtn:(UIButton *)btn {
    
    IFlySpeechRecognizer *recognizer = [IFlySpeechRecognizer sharedInstance];
    recognizer.delegate = self;
    
    //
    //
    [recognizer setParameter:@"1" forKey:@"asr_wbest"];
    //       cloud    local
    [recognizer setParameter:@"cloud" forKey:[IFlySpeechConstant ENGINE_TYPE]];
    //        utf-8
    [recognizer setParameter:@"utf-8" forKey:[IFlySpeechConstant TEXT_ENCODING]];
    //         bnf       abnf
    [recognizer setParameter:@"abnf" forKey:[IFlyResourceUtil GRAMMARTYPE]];
    //        asr
//    [recognizer setParameter:@"asr" forKey:[IFlySpeechConstant IFLY_DOMAIN]];

    
    [recognizer startListening];
    
}

- (IBAction)clickedCancel:(id)sender {
    
    [[IFlySpeechRecognizer sharedInstance] stopListening];
}


#pragma mark - IFlySpeechRecognizerDelegate
- (void)onError:(IFlySpeechError *)errorCode {
    SHBLog(@"Error:\n%@", [errorCode yy_modelDescription]);
}

- (void)onResults:(NSArray *)results isLast:(BOOL)isLast {
    SHBLog(@"result:\n%@", [results yy_modelDescription]);
    
    [_textView insertText:IFlyStringWithResult(results)];
    
}

- (void) onVolumeChanged: (int)volume {
    
}

- (void)onBeginOfSpeech {
    SHBLog(@"___开始录音");
}

- (void)onEndOfSpeech {
    SHBLog(@"++++结束录音");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

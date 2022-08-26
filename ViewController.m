//
//  ViewController.m
//  iDecide
//
//  Created by Dylan Ngo on 8/24/22.
//

#import "ViewController.h"

@interface ViewController () {
    UILabel* decisionText;
    int answerIndex;
    NSMutableArray *answers;
}
- (int)generateRandomNumberWithLower:(int)lowerIndex andUpper:(int)upperIndex;

@property (strong, nonatomic) IBOutlet UILabel *decisionText;
@end

@implementation ViewController

- (int)generateRandomNumberWithLower:(int)lowerIndex andUpper:(int)upperIndex {
    return lowerIndex + arc4random() % (upperIndex - lowerIndex);
}

@synthesize decisionText = decisionText;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    answerIndex = 0;
    answers =  @[@"Go for it!", @"Ask a trusted friend!", @"Wait a better time!", @"Go for a run!", @"Get some food!", @"Hit the gym!", @"Enjoy the moment!", @"Take a break!"].mutableCopy;
}

#pragma mark - Action Items

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Button was pressed");

    int count = (int)[answers count];
    if (![decisionText.text isEqual: @"What should I do?"]) {
        decisionText.text = @"What should I do?";
    } else {
        answerIndex = [self generateRandomNumberWithLower:0 andUpper: count];
        decisionText.text = answers[answerIndex];
    }
}
@end

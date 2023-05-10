#import "PatchTableCell.h"
#import "PatchTableCellData.h"


@implementation PatchTableCell


- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    PatchTableCellData* data = [self objectValue];

    NSFont*						systemFont;
    NSMutableParagraphStyle*	leftAlign;
    NSMutableParagraphStyle*	rightAlign;
    NSMutableParagraphStyle*	centerAlign;
    
    NSRect						inputNameFrame;
    NSDictionary*				inputNameAttributes;
    NSRect						outputNameFrame;
    NSDictionary*				outputNameAttributes;
    NSPoint						arrowCenter;
    NSBezierPath*				arrow;
    
    systemFont = [NSFont systemFontOfSize:[NSFont systemFontSize]];
    leftAlign = [[NSMutableParagraphStyle alloc] init];
    [leftAlign setAlignment:NSTextAlignmentLeft];
    [leftAlign setLineBreakMode:NSLineBreakByTruncatingTail];
    
    rightAlign = [[NSMutableParagraphStyle alloc] init];
    [rightAlign setAlignment:NSTextAlignmentRight];
    [rightAlign setLineBreakMode:NSLineBreakByTruncatingTail];
    
    centerAlign = [[NSMutableParagraphStyle alloc] init];
    [centerAlign setAlignment:NSTextAlignmentCenter];
    [centerAlign setLineBreakMode:NSLineBreakByTruncatingTail];
    
    
    inputNameFrame = NSMakeRect (
        cellFrame.origin.x + 10, cellFrame.origin.y + 10,
        cellFrame.size.width / 2 - 30, 20
    );
    
    inputNameAttributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:
        systemFont,			  NSFontAttributeName,
        leftAlign,			  NSParagraphStyleAttributeName,
        [NSColor labelColor], NSForegroundColorAttributeName,
        nil
    ];
    
    if (self.isHighlighted) {
        [inputNameAttributes setValue:[NSColor alternateSelectedControlTextColor] forKey:NSForegroundColorAttributeName];
    }
    
    [[data inputName] drawInRect:inputNameFrame withAttributes:inputNameAttributes];
    
    
    outputNameFrame = NSMakeRect (
        cellFrame.origin.x + cellFrame.size.width / 2 + 20, cellFrame.origin.y + 10,
        cellFrame.size.width / 2 - 30, 20
    );

    outputNameAttributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:
        systemFont,			  NSFontAttributeName,
        rightAlign,			  NSParagraphStyleAttributeName,
        [NSColor labelColor], NSForegroundColorAttributeName,
        nil
    ];

    if (self.isHighlighted) {
        [outputNameAttributes setValue:[NSColor alternateSelectedControlTextColor] forKey:NSForegroundColorAttributeName];
    }
    
    [[data outputName] drawInRect:outputNameFrame withAttributes:outputNameAttributes];
    
    
    arrowCenter = NSMakePoint (cellFrame.origin.x + cellFrame.size.width / 2, cellFrame.origin.y + 20);
    arrow = [NSBezierPath bezierPath];
    [arrow moveToPoint:NSMakePoint (arrowCenter.x - 15, arrowCenter.y + 1)];
    [arrow lineToPoint:NSMakePoint (arrowCenter.x, arrowCenter.y + 1)];
    [arrow lineToPoint:NSMakePoint (arrowCenter.x, arrowCenter.y + 5)];
    [arrow lineToPoint:NSMakePoint (arrowCenter.x + 15, arrowCenter.y)];
    [arrow lineToPoint:NSMakePoint (arrowCenter.x, arrowCenter.y - 5)];
    [arrow lineToPoint:NSMakePoint (arrowCenter.x, arrowCenter.y - 1)];
    [arrow lineToPoint:NSMakePoint (arrowCenter.x - 15, arrowCenter.y - 1)];
    [arrow closePath];

    if (self.isHighlighted) {
        [[NSColor alternateSelectedControlTextColor] set];
    } else {
        [[NSColor labelColor] set];
    }
    
    [arrow fill];
}


@end

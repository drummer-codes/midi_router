#import <Cocoa/Cocoa.h>

@class Patch;
@class RouterDocument;


@interface PatchTableDataSource : NSObject<NSTableViewDataSource> {
    RouterDocument*	document;
    NSMutableArray*		patchArray;
}

- (PatchTableDataSource*)initWithDocument:(RouterDocument*)newDocument patchArray:(NSMutableArray*)newPatchArray;
- (void)dealloc;

- (void)setPatchArray:(NSMutableArray*)newPatchArray;

- (NSUInteger)numberOfRowsInTableView:(NSTableView*)tableView;
- (id)tableView:(NSTableView*)tableView objectValueForTableColumn:(NSTableColumn*)column row:(NSUInteger)rowIndex;
- (void)tableView:(NSTableView*)tableView setObjectValue:(id)value forTableColumn:(NSTableColumn*)column row:(int)rowIndex;
- (void)deleteSelection:(NSTableView*)tableView;

@end

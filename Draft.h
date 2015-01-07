//
//  Draft.h
//  CintasMats
//
//  Created by Jami Sue Becker on 12/12/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Draft :  NSManagedObject{
    
    //@private
}


@property (nonatomic, retain) NSString * draftName;
@property (nonatomic, retain) NSString * fullImageURL;

@end

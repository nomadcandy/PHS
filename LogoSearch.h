//
//  LogoSearch.h
//  Millenium
//
//  Created by Jami Sue Becker on 4/29/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface LogoSearch : NSManagedObject{
    
  //@private
}


@property (nonatomic,retain) NSString* artworkName;
@property (nonatomic,retain) NSString* artworkSize;
@property (nonatomic,retain) NSString* artworkStyle;
@property (nonatomic,retain) NSString* artworkErrorMessage;
@property (nonatomic,retain) NSString* artworkFormat;
@property (nonatomic,retain) NSString* artworkFullImageURL;
@property (nonatomic,retain) NSString* artworkGroupCode;
@property (nonatomic,retain) NSString* artworkIconURL;
@property (nonatomic,retain) NSString* artworkKeyword;
@property (nonatomic,retain) NSString* artworkOrderBy;
@property (nonatomic,retain) NSString* artworkProductID;
@property (nonatomic,retain) NSString* artworkProductRelease;
@property (nonatomic,retain) NSString* artworkSearch;
@property (nonatomic,retain) NSString* artworkSold;


@end

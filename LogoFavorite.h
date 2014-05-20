//
//  LogoSearch.h
//  Millenium
//
//  Created by Jami Sue Becker on 4/29/14.
//  Copyright (c) 2014 Jami Sue Becker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface LogoFavorite : NSManagedObject{
    
  //@private
}


@property (nonatomic,retain) NSString* artworkName;
@property (nonatomic,retain) NSString* artworkSize;
@property (nonatomic,retain) NSString* artworkStyle;
@property (nonatomic,retain) NSString* company;
@property (nonatomic,retain) NSString* errorMessage;
@property (nonatomic,retain) NSString* format;
@property (nonatomic,retain) NSString* fullImageURL;
@property (nonatomic,retain) NSString* artworkGroupCode;
@property (nonatomic,retain) NSString* iconURL;
@property (nonatomic,retain) NSString* keyword;
@property (nonatomic,retain) NSString* orderBy;
@property (nonatomic,retain) NSString* productID;
@property (nonatomic,retain) NSString* productInfoPDF;
@property (nonatomic,retain) NSString* productReleaseDate;
@property (nonatomic,retain) NSString* searchString;
@property (nonatomic,retain) NSString* seller;
@property (nonatomic,retain) NSString* sold;
@property (nonatomic,retain) NSString* color;

@end

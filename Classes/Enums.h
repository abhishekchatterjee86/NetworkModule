//
//  Enums.h
//  API_Testing
//
//  Created by abhishek chatterjee on 19/10/11.
//  Copyright 2011 a. All rights reserved.
//



typedef enum  
{
	egetLocationsQuery			=2026,	
	eUnFollowBusinessIdquery	=2021,
	eFollowBusinessIdquery		=2020,
	eGetfavoritesList			=2019,
	eLoginQuery					=2000,
	eSignUpquery				=2001,
	eLogoutQuery				=2002,
	eReviewQuery				=2003,
    eMerchantInfoQuery          =2004,
	eUnFollowBuyerIdquery	    =2005,
	eFollowBuyerIdquery		    =2006,
	eAddReviewQuery				=2007,
	eAddLocationsQuery			=2008,
	eUserProfileInfoQuery		=2009,
	eGetFavouritePlaces			=2010,
	eGetUserSettingsInfo        =2011,
	eUpdateUserSettings         =2012,
	eGetInventoryMoviesList		=2013,
	eGetInventoryTheatersList	=2014,
	eGetDemandInfo              =2015,
	eValidateDemandInfo         =2016,
	egetAllMydealsQuery			=2017,
	esendDemandBidQuery			=2018,
	egetPaymentInfo				=2019,
	eUpdatePaymentInfo          =2020,
	eGetDealRequestStaus		=2027,
	eRebidRequest				=2028,
	eGetAllDealsQuery			=2029,
	eGetFaceBookQuery			=2030,
	ePostFacebookPhotoUpload    =2031,
	eDisconnectFacebookQuery	=2032,
	eForgotPasswordQuery		=2033,
	eGetdetailedReviewQuery		=2034,


	
}eHOWebRequestType;

typedef enum  
{
	eMethodNotSupported			=10001,
	eLoginrequired				=10003,
	eUserAlreadyLoggedIn		=10005,
	eInValidUser				=10007,
	eCustomerHasInValidId	    =10009,
	eBusinessIDmissing			=20001,
	eBusinessdoesntexists		=30001,
	eBusinessProfileDoesNotExist=30002,
	eFavoritesAlreadyexists		=40001,
	eFavoritesdoesntexists		=30003,
	eSignUpFirstNameMissing		=20008,
	eSignUpLastNameMissing		=20009,
	eSignUpEmailParamMissing	=20010,
	eSignUpPasswordParamMissing	=20011,
	eSignUpEmailNotValid		=50003,
	eSignUpUserTypeNotValid		=50004,
	eSignUpUserAlreadyExist		=40000,
	eSignUpUserNotActive		=10006,
	eSignUpErrorUserCreation	=50005,
	eFollowUserParamMissing     =20007,
	eFollowrSameUser            =50001,
	eFollowerAlreadyExists      =40002,
	eFollowUserNotExists        =30004,
	eReviewParamMissing         =20003,
	eRatingParamMissing         =20004,
	eLocationNotExist           =30006,
	eInvalidrating				=50009,
	eNotAuthorizedToAccess      =50006, 
	eFirstNamePropertyError     =50007,
	eLastNamePropertyError      =50008, 
	eNotAuthorisedtoaccess		=50006,
	eNumberofpersonisMissing	=20012,
	eTimerangeisMissing			=20013,
	eTimerangeInvalid			=50010,
	eFromtimegreaterthancurrenttime=50037,
	eDemanddoenotExists			=30007,
	eServerDatabaseError		=10008,
	eShowtimeinvalid			=50012,
	eBid_orValueInvalid			=50011,
	ePaymentInfodoesntexsits	=30010,
	eAlredayBided				=40003,
	eBidMissing					=20014,
	eDemandMissing				=20018,
	eCannotBid					=50031,
	eBiddingTooearly			=50032,
	eShowtimenotAvilableforBid	=50033,
	eBiddoesnotexsits			=30008,
	
	eInvalidNumber              =50016, 
	eIncorrectNumber            =50017, 
	eInvalidExpiryYear          =50019, 
	eInvalidExpirtyMonth        =50018, 
	eInvalidCVC                 =50020, 
	eInvalidZip                 =50028, 
	eInvaliStateName            =50029, 
	eInvalidCardName            =50026, 
	eInvalidCardAddress         =50027, 
	eUnAuthorizedPayee          =50002, 
	eShowTimeMissing			=20016,
	eDeviceUdidMissing			=20017,
	
	
	eFBIdMissing				=20020,
	eFBTokenMissing				=20021,
	eLoginCredentialsInvalid    =10004,
	eNotAuthorizedToLoginWithFBAccount = 50034,
	eInvalidImage				=20023,
	eInvalidImageType			=50035,
	eImageSizeTooLarge			=50036

}eHOWebResponseErrorCodeType;


typedef enum
{
	eHTTPResoponseOK = 200,
	eHTTPResoponseCreated = 201,
	eHTTPResoponseEmpty	= 204,
	eHTTPResoponseMovedTemporarily = 302,
	eHTTPResoponseBadRequest = 400,
	eHTTPResoponseUnAuthorized = 401,
	eHTTPResoponseForbidden = 403,
	eHTTPResoponseNotFound = 404,
	eHTTPResoponseConflictOrDuplicate = 409,
	eHTTPResoponseGone = 410,
	eHTTPResoponseInternalError = 500,
	eHTTPResoponseInvalidParameter = 501,
	eHTTPResoponseInvalidSession = 503,
	eHTTPResponseInvalidChannel = 504,
	eHTTPResponseInvalidLocation = 505,
	eHTTPResponseNoDataFound = 506,
	
	eHTTPResponseDeviceAlreadyRegistered = 510,
	eHTTPResponseUserAlreadyRegistered = 511,
	eHTTPResponseInvalidUsernameOrPassword = 512,
	eHTTPResponseInvalidUser = 513,
	eHTTPResponseTransactionID = 514,
	eHTTPResponseInvalidFileType = 515,
	eHTTPResponseFileSizeExceeded = 516,
	eHTTPResponseTextIsTooLong = 517,
	eHTTPResponseInvalidPostID = 518,
	eHTTPResponseUserAlreadyFollowing = 519,
	eHTTPResponseInvalidBlogger = 520,
	eHTTPResponseUserNotFollowingBlogger = 522,
	eHTTPResponseInvalidMSISDN = 523,
	eHTTPResponseInvalidPassword = 524,
	eHTTPResponseYouAreNotAllowedToFollowThisBlogger = 525,
	eHTTPResponseWrongAuthenticationDetails = 532
}eHTTPResponseStatusCode;
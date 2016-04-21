// Generated by Apple Swift version 2.1.1 (swiftlang-700.1.101.15 clang-700.1.81)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import ObjectiveC;
@import Foundation;
@import UIKit;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSURL;
@class NSDictionary;


/// The DeepLink of application object.
SWIFT_CLASS("_TtC15CardDeepLinkKit10CDDeepLink")
@interface CDDeepLink : NSObject

/// The serialized URL representation of the deep link.
@property (nonatomic, strong) NSURL * __nullable URL;

/// The query parameters parsed from the incoming URL. @note If the URL conforms to the App Link standard, this will be the query parameters found on `target_url'.
@property (nonatomic, strong) NSDictionary * __nullable queryParameters;

/// A dictionary of values keyed by their parameterized route component matched in the deep link URL path. @note Given a route alert/:title/:message' and a pathxxxx://alert/hello/world', the route parameters dictionary would be `@{ @"title": @"hello", @"message": @"world" }'.
@property (nonatomic, strong) NSDictionary * __nullable routeParameters;
@property (nonatomic, strong) NSURL * __nullable targetURL;
@property (nonatomic, strong) NSDictionary * __nullable extras;
@property (nonatomic, copy) NSString * __nullable version;
@property (nonatomic, copy) NSString * __nullable userAgent;
@property (nonatomic, strong) NSDictionary * __nullable appLinkData;
@property (nonatomic, strong) NSURL * __nullable referrerTargetURL;
@property (nonatomic, strong) NSURL * __nullable referrerURL;
@property (nonatomic, copy) NSString * __nullable referrerAppName;

/// A deep link URL for linking back to the source application.
@property (nonatomic, readonly, strong) NSURL * __nullable callbackURL;
- (nonnull instancetype)initWithUrl:(NSURL * __nonnull)url OBJC_DESIGNATED_INITIALIZER;
- (NSInteger)hashValue;
@end


SWIFT_CLASS("_TtC15CardDeepLinkKit16CDDeepLinkRouter")
@interface CDDeepLinkRouter : NSObject
@end


SWIFT_CLASS("_TtC15CardDeepLinkKit13CDMatchResult")
@interface CDMatchResult : NSObject
@property (nonatomic, strong) NSDictionary * __nullable namedProperties;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSCoder;

SWIFT_CLASS("_TtC15CardDeepLinkKit19CDRegularExpression")
@interface CDRegularExpression : NSRegularExpression
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (CDMatchResult * __nonnull)matchResultForString:(NSString * __nonnull)str;
+ (NSString * __nonnull)stringByRemovingNamedGroupsFromString:(NSString * __nonnull)str;
+ (NSArray * __nonnull)namedGroupTokensForString:(NSString * __nonnull)str;
+ (NSArray * __nonnull)namedGroupsForString:(NSString * __nonnull)str;
@end

@class CDViewController;
@class UIViewController;


/// A base class for handling routes.
SWIFT_CLASS("_TtC15CardDeepLinkKit14CDRouteHandler")
@interface CDRouteHandler : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// Indicates whether the deep link should be handled.
- (BOOL)shouldHandleDeepLink:(CDDeepLink * __nonnull)deeplink;
- (BOOL)preferModalPresentation;
- (CDViewController * __nullable)targetViewController;
- (UIViewController * __nullable)viewControllerForPresentingDeepLink:(CDDeepLink * __nonnull)deepLink;
- (void)presentTargetViewController:(CDViewController * __nonnull)targetViewController presentingViewController:(UIViewController * __nonnull)presentingViewController;
@end



/// Matcher
SWIFT_CLASS("_TtC15CardDeepLinkKit14CDRouteMatcher")
@interface CDRouteMatcher : NSObject
@end

@class NSBundle;

SWIFT_CLASS("_TtC15CardDeepLinkKit16CDViewController")
@interface CDViewController : UIViewController
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSError;
@class UIView;

SWIFT_CLASS("_TtC15CardDeepLinkKit4Card")
@interface Card : NSObject

/// swift_once_block_invoke -> Thread Safe and from apple document function.
+ (Card * __nonnull)sharedInstance;

/// Init config
///
/// Card.sharedInstance.configureWithApplicationServiceId("") { (complate, error) -> Void in
/// //.....
/// }
///
/// \param token app token: Vh7giFfqA1JnJ3BYQLhWxXW1D63H5CcvkaIZa_B7
- (void)configureWithApplicationServiceToken:(NSString * __nullable)token comfigError:(void (^ __nonnull)(BOOL, NSError * __nonnull))comfigError;

/// Allow alertView to be closed/renamed in a chainable manner
///
/// \param view super view
///
/// \param serviceId ID
- (void)showInView:(UIView * __nonnull)view serviceId:(NSString * __nonnull)serviceId;
- (void)showInView:(UIView * __nonnull)view serviceId:(NSString * __nonnull)serviceId userInfo:(NSDictionary<NSString *, NSString *> * __nullable)userInfo;
@end


SWIFT_CLASS("_TtC15CardDeepLinkKit8CardView")
@interface CardView : UIView
+ (CardView * __nonnull)createInstance;
@property (nonatomic, copy) NSString * __nonnull serviceId;

/// Animation springEaseIn
+ (void)springEaseIn:(NSTimeInterval)duration animations:(void (^ __null_unspecified)(void))animations;
+ (void)springEaseOut:(NSTimeInterval)duration animations:(void (^ __null_unspecified)(void))animations completion:(void (^ __null_unspecified)(void))completion;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface UIColor (SWIFT_EXTENSION(CardDeepLinkKit))
- (nonnull instancetype)initWithHex:(NSString * __nonnull)hex;
@end

#pragma clang diagnostic pop
//
//  Tools.m
//  ttruus
//
//  Created by liu yuhai on 8/7/14.
//  Copyright (c) 2014 4helper. All rights reserved.
//

#import "Tools.h"
#import <AddressBook/AddressBook.h>



@implementation Tools

+(NSString *)clearPhoneNumber : (NSString * )phoneNumber
{
    NSString *result=@"";
    for (int i=0; i<phoneNumber.length; i++) {
        NSString *s=[phoneNumber substringWithRange:NSMakeRange(i, 1)];
        const char *ch=[s UTF8String];
        if (*ch>='0'&&*ch<='9') {
            result=[result stringByAppendingString:s];
        }
    }
    return result;
}

//+(Helper *)createHelperByPhoneNumber:(NSString *)phoneNumb
//{
//    NSLog(@"zhangsan%@",phoneNumb);
//    CFErrorRef error = NULL;
//    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
//    NSArray* listContacts = CFBridgingRelease(ABAddressBookCopyArrayOfAllPeople(addressBook));
//    Helper *helper = [[Helper alloc]init];
//    ABAddressBookRef myAddressBook =ABAddressBookCreateWithOptions(NULL,&error); //ABAddressBookCreate();
//    CFArrayRef results = ABAddressBookCopyArrayOfAllPeople(myAddressBook);
//    CFMutableArrayRef mresults=CFArrayCreateMutableCopy(kCFAllocatorDefault,
//                                                        CFArrayGetCount(results),
//                                                        results);
//    //将结果按照拼音排序，将结果放入mresults数组中
//    CFArraySortValues(mresults,
//                      CFRangeMake(0, CFArrayGetCount(results)),
//                      (CFComparatorFunction) ABPersonComparePeopleByName,
//                      (void*) ABPersonGetSortOrdering());
//    //遍历所有联系人
//    for (int k=0;k<CFArrayGetCount(mresults);k++) {
//        ABRecordRef record=CFArrayGetValueAtIndex(mresults,k);
//        ABMultiValueRef phone = ABRecordCopyValue(record, kABPersonPhoneProperty);
//        for (int k = 0; k<ABMultiValueGetCount(phone); k++)
//        {
//            
//            NSString * personPhone = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phone, k);
//                    personPhone = [Tools clearPhoneNumber:personPhone];
//            helper.mobilePhone = personPhone;
//            if ([helper.mobilePhone isEqualToString:phoneNumb]) {
//                NSString* name = CFBridgingRelease(ABRecordCopyCompositeName(record));
//                ABRecordID personID = ABRecordGetRecordID(record);
//                NSNumber *personIDAsNumber = [NSNumber numberWithInt:personID];
//                helper.name = name ? name : @"";
//                helper.personIDAsNumber = personIDAsNumber;
//                NSLog(@"aaaaa%@",personIDAsNumber);
//                helper.isMember = @"NO";
//                CFRelease(phone);
//                CFRelease(record);
//                return helper;
//            }
//        }
//            CFRelease(phone);
//            CFRelease(record);
//        }
//        CFRelease(addressBook);
//        if (helper.personIDAsNumber) {
//            return helper;
//        }else{
//            return nil;
//        }
//}
@end
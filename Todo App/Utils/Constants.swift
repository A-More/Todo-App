//
//  Constants.swift
//  Exrup
//
//  Created by Kustard on 04/05/17.
//  Copyright © 2017 Kustard. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    public enum SortFilterSelectionConstant: Int {
        case RECENTLY_ADDED
        case FIRST_NAME
        case LAST_NAME
        case COMPANY_NAME
    }
    
    public enum ContactUserSelectionConstant: Int {
        case CALL_USER
        case MESSAGE_USER
        case EMAIL_USER1
    }
    
    public enum NotificationTypeConstant: String {
        case DESIGNATION_CHANGE = "1"
        case CONNECTION = "2"
        case RESIGNATION = "3"
        case NEW_COMPANY_JOINED = "4"
        case INTRODUCE_CONNECTION = "5"
        case COMPANY_WIDE_NOTIFICATION = "6"
        case WELCOME_NOTIFICATION = "7"
    }
    
    static let APP_NAME = "Exrup"
    static let API_KEY = "jdnajdnasndasodnsaodadnsaodasmkdsmdokasmdsoadmsaodmsaoiuhwueh8y1741746174617!@!^%$@!^%$!%"
    
    // URLs
    static let URL_BASE: String = "http://exrup.com/prod/api/v1/"
    static let URL_AUTH: String = URL_BASE + "auth/"
    static let URL_SEND_OTP: String = URL_BASE + "send_otp/"
    static let URL_VERIFY_OTP: String = URL_BASE + "verify_otp/"
    static let URL_GET_USER: String = URL_BASE + "user/"
    static let URL_UPDATE_NOTIFICATION_TOKEN = "/notification_details/"
    static let URL_REGISTER_USER: String = "register/"
    static let URL_FETCH_CONNECTIONS: String = URL_BASE + "fetch_connection/"
    static let URL_FETCH_COLLEAGUES: String = URL_BASE + "fetch_colleagues/"
    static let URL_UPLOAD_PROFILE_PIC: String = URL_BASE + "profile_photo/"
    static let URL_QR_SCAN_CONNECTION: String = URL_BASE + "qr_scan_connection/"
    static let URL_QR_SCAN_EVENT: String = URL_BASE + "event_scan_connection/"
    static let URL_PHONE_NUMBER_CONNECTION: String = URL_BASE + "phone_number_connection/"
    static let URL_INTRODUCE_CONNECTION: String = URL_BASE + "introduce_connection/"
    static let URL_CARD_PHOTO_UPLOAD: String = URL_BASE + "card_photo_upload/"
    static let URL_CARD_PHOTO_TAGS: String = URL_BASE + "card_photo_tags/"
    static let URL_CARD_SCAN_CONNECTION: String = URL_BASE + "card_scan_connection/"
    static let URL_COUNTRY_CODE: String = URL_BASE + "country/"
    static let URL_INDUSTRY: String = URL_BASE + "industry/"
    static let URL_SYNC_DATA: String = URL_BASE + "sync_data/"
    static let URL_CHANGE_THEME: String = "theme/"
    static let URL_CHANGE_PHONE_NUMBER_VERIFY_OTP: String = URL_BASE + "change_phone_number/verify_otp/"
    static let URL_CHANGE_PHONE_NUMBER: String = "change_phone_number/"
    static let URL_FETCH_NOTIFICATIONS: String = URL_BASE + "fetch_notifications/"
    
    static let FILE_PATH_FOR_IMAGE: String = NSHomeDirectory() + "/Documents/Exrup/"
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    static let statusBarHeight = UIApplication.shared.statusBarFrame.height
    static let cardAspectRatio = 2.39 as CGFloat
    static let STATUS_SUCCESS = "success"
    static let STATUS_ERROR = "error"
    static let QR_CODE_SEPARATOR = "-"
    
    static let NO_INTERNET = "Not connected to Internet"
    
    static let SYNC_LIMIT = 20
    
    static let IMAGE_UPLOAD_REFRESH_RATE = 10
    static let FETCH_TAGS_REFRESH_RATE = 20
    static let SYNC_DATA_REFRESH_RATE = 10
    static let RESEND_OTP_REFRESH_RATE = 1
    static let SYNC_DATE_FORMAT = "dd/MM/yyyy HH:mm:ss"
    static let SYNC_DEFAULT_DATE = "01/01/1970 00:00:00"
    
    // Colors
    struct Colors {
        static let COLOR_HEADER: UIColor = UIColor(rgb: 0x232526)
        static let COLOR_CARD: UIColor = UIColor(rgb: 0x414345)
//        static let COLOR_CARD: UIColor = UIColor(rgb: 0xF5F5F5)
        static let CLOT_GRADIENT = [UIColor(rgb:0x070000), UIColor(rgb:0x4C0001)]
        static let JOOMLA_GRADIENT = [UIColor(rgb:0x1E3C72), UIColor(rgb:0x2A5298)]
        static let MIDNIGHT_GRADIENT = [UIColor(rgb: 0x232526), UIColor(rgb:0x414345)]
    }
    
    // Opacities for UILabel, UIViews, etc.
    struct Opacities {
        static let FULL: CGFloat = 1.0
        static let MEDIUM: CGFloat = 0.7
        static let LIGHT: CGFloat = 0.42
        static let ZERO: CGFloat = 0.0
    }
    
    // Standard sizes for UILabel
    struct TextSizes {
        static var EXTRA_SMALL: CGFloat = 10.0
        static var SMALL: CGFloat = 12.0
        static var REGULAR: CGFloat = 14.0
        static var MEDIUM: CGFloat = 16.0
        static var LARGE: CGFloat = 18.0
        static var HUGE: CGFloat = 20.0
        static var HUMONGOUS: CGFloat = 24.0
        static var EXTRA_HUMONGOUS: CGFloat = 32.0
        static var EXTRA_TINY_HUMONGOUS: CGFloat = 40.0
        static var EXTRA_LARGE_HUMONGOUS: CGFloat = 42.0
        
        static var PLACEHOLDER_SIZE: CGFloat = 36.0
        
        init() {
            let screenWidth = UIScreen.main.bounds.width
            TextSizes.EXTRA_SMALL = 10.0 * screenWidth / 360.0
            TextSizes.SMALL = 12.0 * screenWidth / 360.0
            TextSizes.REGULAR = 14.0 * screenWidth / 360.0
            TextSizes.MEDIUM = 16.0 * screenWidth / 360.0
            TextSizes.LARGE = 18.0 * screenWidth / 360.0
            TextSizes.HUGE = 20.0 * screenWidth / 360.0
            TextSizes.HUMONGOUS = 24.0 * screenWidth / 360.0
            TextSizes.EXTRA_HUMONGOUS = 32.0 * screenWidth / 360.0
            TextSizes.EXTRA_TINY_HUMONGOUS = 40.0 * screenWidth / 360.0
            TextSizes.EXTRA_LARGE_HUMONGOUS = 42.0 * screenWidth / 360.0
            
            TextSizes.PLACEHOLDER_SIZE = 36.0 * screenWidth / 360.0
        }
    }
    
    // Standard margins
    struct Sizes {
        static var NO_SPACING: CGFloat = 0.0
        static var EXTRA_TINY: CGFloat = 2.0 * screenWidth / 360.0
        static var TINY: CGFloat = 4.0 * screenWidth / 360.0
        static var EXTRA_SMALL: CGFloat = 6.0 * (screenWidth / 360.0)
        static var SMALL: CGFloat = 8.0 * screenWidth / 360.0
        static var MEDIUM: CGFloat = 12.0 * screenWidth / 360.0
        static var NORMAL: CGFloat = 16.0 * screenWidth / 360.0
        static var EXTRA_NORMAL: CGFloat = 20.0 * screenWidth / 360.0
        static var LARGE: CGFloat = 24.0 * screenWidth / 360.0
        static var HUGE: CGFloat = 32.0 * screenWidth / 360.0
        static var EXTRA_SMALL_HUGE: CGFloat = 40.0 * screenWidth / 360.0
        static var EXTRA_HUGE: CGFloat = 60.0 * screenWidth / 360.0
        static var EXTRA_LARGE_HUGE: CGFloat = 72.0 * screenWidth / 360.0
        
        static var ACTION_BAR_SIZE = 56.0 * screenWidth / 360.0
        static var ONBOARDING_TOP_HEIGHT = screenHeight * 0.58
        static var ONBOARDING_BOTTOM_HEIGHT = screenHeight * 0.42
        static var ONBOARDING_TRIANGLE_HEIGHT = Sizes.MEDIUM
        static var ONBOARDING_TRIANGLE_WIDTH = Sizes.LARGE
        static var PROFILE_PIC_SIZE = 112.0 * screenWidth / 360.0
        static var USER_PROFILE_PIC_SIZE = 100.0 * screenWidth / 360.0
        static var PROFILE_MARGIN = 56.0 * screenWidth / 360.0
        static var LETS_DO_IT_MARGIN = 36.0 * screenWidth / 360.0
        static var BUILD_PROFILE_MARGIN = 40.0 * screenWidth / 360.0
        static var SELECT_CARD_TEMPLATE_WIDTH = 306.0 * screenWidth / 360.0
        static var SELECT_CARD_TEMPLATE_HEIGHT = 132.0 * screenWidth / 360.0
        static var SCAN_CONTROLS_HEIGHT = 136.0 * screenWidth / 360.0
        static var CAPTURE_BUTTON_SIZE = 64.0 * screenWidth / 360.0
        static var PROFILE_IMAGE_SIZE = 96.0 * screenWidth / 360.0
        static var DIVIDER_HEIGHT = 0.5 * screenWidth / 360.0
        static var CONNECTED_USER_DETAILS_HEIGHT = 48.0 * screenWidth / 360.0
        static var CONNECTED_USER_PROFILE_IMAGE_SIZE = 36.0 * screenWidth / 360.0
        static var CONNECTION_LIST_MARGIN = 6.0 * screenWidth / 360.0
        static var CARD_DETAILS_BUTTON_SIZE = 96.0 * screenWidth / 360.0
        static var BORDER_WIDTH = 1.0 * screenWidth / 360.0
        static var SEARCH_LIST_ITEM_HEIGHT = 96.0 * screenWidth / 360.0
        static var SCAN_COMPLETE_HEIGHT = 40.0 * screenWidth / 360.0
        static var IMAGE_CONTAINER_HEIGHT = 192.0 * screenWidth / 360.0
        static var LOGO_SIZE = 144.0 * screenWidth / 360.0
        static var LOGO_MARGIN = 192.0 * screenWidth / 360.0
        static var NOTIFICATION_CONTAINER_HEIGHT = 120.0 * screenWidth / 360.0
        static var DEFAULT_NOTIFICATION_CONTAINER_HEIGHT = 88.0 * screenWidth / 360.0
        
        init(){}
    }
    
    // Date Format
    static let FORMAT_ISO: String = "yyyy-MM-dd'T'HH:mmXXX"
    
    // Static string used in the app
    struct Strings {
        static let TEXT_QUESTION_PHONE_NUMBER: String = "Your mobile number?"
        static let TEXT_MY_PHONE_NUMBER: String = "My number is --"
        static let PLACEHOLDER_COUNTRY_CODE: String = "+91 "
        static let PLACEHOLDER_PHONE_NUMBER: String = "8123456789"
        static let TEXT_QUESTION_EMAIL: String = "Your email?"
        static let TEXT_MY_EMAIL: String = "My email is --"
        static let PLACEHOLDER_EMAIL: String = "jack.smile@example.com"
        static let TEXT_QUESTION_NAME: String = "Your name?"
        static let TEXT_MY_NAME: String = "My name is --"
        static let PLACEHOLDER_NAME: String = "Jack Smile"
        static let TEXT_QUESTION_OTP: String = "We've sent you OTP. Please check."
        static let TEXT_MY_OTP: String = "OTP sent to "
        static let PLACEHOLDER_OTP: String = "• • • •"
        static let RESEND_OTP: String = "Resend OTP"
        static let TEXT_OKAY: String = "Okay"
        static let TEXT_GET_EXCITED: String = "get excited!"
        static let TEXT_BUILDING_PROFILE: String = "We're building you an exrup profile"
        static let TEXT_LETS_DO_IT: String = "Let's Do It"
        static let TEXT_SELECT_CARD_TEMEPLATE = "Pick your favourite design"
        static let TEXT_TITLE_CARD_TEMPLATE = "Simple Personal Card"
        static let TEXT_LETS_GET_STARTED = "Let's get started"
        static let PLACEHOLDER_DESIGNATION = "Chief Executive Officer"
        static let TEXT_NAME = "Name"
        static let TEXT_MOBILE = "Mobile"
        static let TEXT_MOBILE_NUMBER = "Mobile Number"
        static let TEXT_LANDLINE = "Landline"
        static let TEXT_EXTENSION = "Extension"
        static let TEXT_EMAIL = "Email"
        static let TEXT_GENDER = "Gender"
        static let TEXT_DATE_OF_BIRTH = "Date of Birth"
        static let TEXT_EXPERIENCE = "Experience"
        static let TEXT_INDUSTRY = "Industry"
        static let TEXT_WEBSITE = "Website"
        static let TEXT_ADDRESS = "Address"
        static let TEXT_SKILLS = "Skills"
        static let TEXT_INSTITUTE = "Institute/University"
        static let TEXT_DEGREE = "Degree"
        static let TEXT_FACEBOOK = "Facebook"
        static let TEXT_LINKEDIN = "LinkedIn"
        static let TEXT_TWITTER = "Twitter"
        static let TEXT_CONNECTED_ON = "Connected On"
        static let TEXT_REFER = "Refer"
        static let TEXT_SHARE = "Share"
        static let TEXT_VIEW_BUSINESS_CARD = "View Scanned Business Card"
        static let TITLE_UPLOAD_IMAGE = "Upload Image From"
        static let TEXT_CAMERA = "Camera"
        static let TEXT_GALLERY = "Gallery"
        static let TITLE_INTRODUCE_USER = "Introduce User"
        static let TEXT_SHARE_PHONE_NUMBER = "Share your card with mobile number"
        static let TEXT_EXCHANGE_CARD_WITH_PHONE_NUMBER = "Exchange your card via mobile number"
        static let TEXT_SHARE_BUSINESS_CARD = "Share your card"
        static let PLACEHOLDER_SEARCH = "Search connections, colleagues…"
        static let TEXT_YOUR_COLLEAGUES = "Your colleagues"
        static let TEXT_YOUR_CONNECTIONS = "Your connections"
        static let TEXT_SEARCH_RESULTS = "Search results"
        static let TEXT_SORT_BY = "Sort connections by"
        static let TEXT_RECENTLY_ADDED = "Recently added"
        static let TEXT_FIRST_NAME = "First name"
        static let TEXT_LAST_NAME = "Last name"
        static let TEXT_COMPANY_NAME = "Company Name"
        static let TEXT_SCANNED_CARDS = "Scanned Cards"
        static let TEXT_MY_COUNTRY = "My country is --"
        static let PLACEHOLDER_MY_COUNTRY = "India"
        static let PLACEHOLDER_SEARCH_COUNTRY = "Search country"
        static let TEXT_QUESTION_COUNTRY: String = "Your country?"
        static let TEXT_MY_INDUSTRY = "My industry is --"
        static let PLACEHOLDER_MY_INDUSTRY = "Computer Software"
        static let PLACEHOLDER_SEARCH_INDUSTRY = "Search industry"
        static let TEXT_QUESTION_INDUSTRY: String = "Your current industry?"
        static let TEXT_ABOUT_YOU: String = "About You"
        static let TEXT_COMPANY: String = "Company"
        static let TEXT_EDUCATION_SKILLS: String = "Skills and Education"
        static let TEXT_SOCIAL: String = "Social"
        static let TEXT_CHANGE_TEMPLATE: String = "Change Template"
        static let TEXT_CHANGE_PHONE_NUMBER: String = "Change Phone Number"
        static let TEXT_LOGOUT: String = "Logout"
        static let TEXT_EXRUP_PIN: String = "Your exrup pin"
        static let API_ERROR: String = "Something went wrong"
        static let START_SCAN: String = "Start scanning"
        static let EMPTY_SCANNED_IMAGES: String = "Hey! Scanning paper business cards is a premium feature. For more information and access to premium features kindly visit\n www.exrup.com"
        static let NO_SCANNED_IMAGES = "No more scanned cards in the queue"
        static let TEXT_NOTIFICATIONS = "Notifications"
        static let TEXT_DEFAULT_NOTIFICATION_MESSAGE = "Hi, welcome to exrup "
        static let TEXT_DEFAULT_NOTIFICATION_MSG = ". Completed profile creates more impact than incompleted one"
        static let TEXT_COMPLETE_PROFILE = "Complete My Profile"
        
    }
}

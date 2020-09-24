//
//  Modal.swift
//  DemoProject
//
//  Created by Brainwork Technologies on 17/07/2020.
//  Copyright © 2020 Advatix Inc. All rights reserved.
//

import Foundation

// MARK: - APIResponse
struct APIResponse: Codable {
    let home: AppURL
    let mulakat: Mulakat
    let appURL: AppURL
    let banner: [Banner]
    let profile: Profile
    let events: [Event]
    let news: [News]
    let videoGallery: [VideoGallery]
    let imageGallery: [ImageGallery]

    enum CodingKeys: String, CodingKey {
        case home, mulakat
        case appURL = "app_url"
        case banner, profile, events, news
        case videoGallery = "video_gallery"
        case imageGallery = "image_gallery"
    }
}

// MARK: - AppURL
struct AppURL: Codable {
    let url: String
}

// MARK: - Banner
struct Banner: Codable {
    let id: Int
    let url: String
    let imageType, bannerDescription, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case imageType = "image_type"
        case bannerDescription = "description"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Event
struct Event: Codable {
    let id: Int
    let eventsTitle, eventStartTime, eventEndTime: String
    let orderNumber: Int?
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case eventsTitle = "events_title"
        case eventStartTime = "event_start_time"
        case eventEndTime = "event_end_time"
        case orderNumber
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - ImageGallery
struct ImageGallery: Codable {
    let galleryName, galleryDescription, location, albumDate: String
    let galleryImages: [GalleryImage]?

    enum CodingKeys: String, CodingKey {
        case galleryName = "gallery_name"
        case galleryDescription = "gallery_description"
        case location, albumDate
        case galleryImages = "gallery_images"
    }
}

// MARK: - GalleryImage
struct GalleryImage: Codable {
    let imageURL: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case createdAt = "created_at"
    }
}

// MARK: - Mulakat
struct Mulakat: Codable {
    let url: String
    let mulakatDescription: String

    enum CodingKeys: String, CodingKey {
        case url
        case mulakatDescription = "description"
    }
}

// MARK: - News
struct News: Codable {
    let id: Int
    let imageURL: String
    let newsTitle, newsDescription, createdAt, updatedAt: String
    let orderNumber: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case newsTitle = "news_title"
        case newsDescription = "news_description"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case orderNumber
    }
}

// MARK: - Profile
struct Profile: Codable {
    let image: String
    let profileDescription, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case image
        case profileDescription = "description"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - VideoGallery
struct VideoGallery: Codable {
    let id: Int
    let videoURL: String
    let videoDescription: String
    let videoImage: String
    let createdAt, updatedAt: String
    let orderNumber: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case videoURL = "video_url"
        case videoDescription = "video_description"
        case videoImage = "video_image"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case orderNumber
    }
}


struct NewsList
{
    
    var imageURL:String?
    var newsTitle:String
    var updatedAt:String
    var newsDescription:String
    let iD: UUID
}

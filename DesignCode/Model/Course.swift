//
//  Course.swift
//  DesignCode
//
//  Created by 王佩豪 on 2024/4/22.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let title : String
    let subtitle : String
    let text : String
    let image : String
    let logo : String
}

let courses = [
    Course(title: "Swift for iOS 15", subtitle: "20 section -3 hours", text: "Build an app for iOS 15 with custom layouts,animation and ...", image: "Illustration 5", logo: "Logo 2"),
    Course(title: "UI Design for iOS 15", subtitle: "30 section -5 hours", text: "Build an app for iOS 15 with custom layouts,animation and ...", image: "Illustration 3", logo: "Logo 4"),
    Course(title: "Flutter for designers", subtitle: "20 section -3 hours", text: "Build an app for iOS 15 with custom layouts,animation and ...", image: "Illustration 1", logo: "Logo 1"),
    Course(title: "React hook Advanced", subtitle: "20 section -3 hours", text: "Learn how to build a website with TypeScript ,hook, contentful and Gatsby Cloud", image: "Illustration 2", logo: "Logo 3"),
]

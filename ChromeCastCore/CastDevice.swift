//
//  CastDevice.swift
//  ChromeCastCore
//
//  Created by Guilherme Rambo on 19/10/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

import Foundation


public struct DeviceCapabilities : OptionSet
{
  public let rawValue: Int
  public init(rawValue: Int) { self.rawValue = rawValue }
  
  static let none = DeviceCapabilities(rawValue: 0)
  static let videoOut = DeviceCapabilities(rawValue: 1 << 0)
  static let videoIn = DeviceCapabilities(rawValue: 1 << 1)
  static let audioOut = DeviceCapabilities(rawValue: 1 << 2)
  static let audioIn = DeviceCapabilities(rawValue: 1 << 3)
  static let multizoneGroup = DeviceCapabilities(rawValue: 1 << 5)
  static let masterVolume = DeviceCapabilities(rawValue: 1 << 11)
  static let attenuationVolume = DeviceCapabilities(rawValue: 1 << 12)
}

public final class CastDevice: NSObject, NSCopying {
  
  public private(set) var id: String
  public private(set) var name: String
  public private(set) var modelName: String
  public private(set) var hostName: String
  public private(set) var address: Data
  public private(set) var port: Int
  public private(set) var capabilities: DeviceCapabilities
  public private(set) var status: String
  public private(set) var iconPath: String
  
  init(id: String, name: String, modelName: String, hostName: String, address: Data, port: Int, capabilitiesMask: Int, status: String, iconPath: String) {
    self.id = id
    self.name = name
    self.modelName = modelName
    self.hostName = hostName
    self.address = address
    self.port = port
    capabilities = DeviceCapabilities(rawValue: capabilitiesMask)
    self.status = status
    self.iconPath = iconPath

    super.init()
  }
  
  public func copy(with zone: NSZone? = nil) -> Any {
    return CastDevice(id: self.id,
                      name: self.name,
                      modelName: self.modelName,
                      hostName: self.hostName,
                      address: self.address,
                      port: self.port,
                      capabilitiesMask: capabilities.rawValue,
                      status: self.status,
                      iconPath: iconPath)
  }
  
  public override var description: String {
    return "CastDevice(id: \(id), name: \(name), hostName:\(hostName), address:\(address), port:\(port))"
  }
  
}

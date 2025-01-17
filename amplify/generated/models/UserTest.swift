// swiftlint:disable all
import Amplify
import Foundation

public struct UserTest: Model {
  public let id: String
  public var userName: String?
  public var userId: String?
  public var userImage: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      userName: String? = nil,
      userId: String? = nil,
      userImage: String? = nil) {
    self.init(id: id,
      userName: userName,
      userId: userId,
      userImage: userImage,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      userName: String? = nil,
      userId: String? = nil,
      userImage: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.userName = userName
      self.userId = userId
      self.userImage = userImage
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
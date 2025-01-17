// swiftlint:disable all
import Amplify
import Foundation

extension UserTest {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case userName
    case userId
    case userImage
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let userTest = UserTest.keys
    
    model.authRules = [
      rule(allow: .private, operations: [.create, .update, .delete, .read]),
      rule(allow: .owner, ownerField: "owner", identityClaim: "cognito:username", provider: .userPools, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "UserTests"
    
    model.attributes(
      .primaryKey(fields: [userTest.id])
    )
    
    model.fields(
      .field(userTest.id, is: .required, ofType: .string),
      .field(userTest.userName, is: .optional, ofType: .string),
      .field(userTest.userId, is: .optional, ofType: .string),
      .field(userTest.userImage, is: .optional, ofType: .string),
      .field(userTest.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(userTest.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension UserTest: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}
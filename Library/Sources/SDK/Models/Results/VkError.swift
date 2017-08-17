import Foundation

public enum VkError: Error {
    // MARK: - Any error wrapper
    case unknown(Error)
    
    // MARK: - Errors from VK API
    case api(ApiError)
    
    // MARK: - Session errors
    case tokenNotSavedInStorage
    case vkDelegateNotFound
    case cantParseTokenInfo(String)
    case cantDestroyDefaultSession
    case sessionAlreadyDestroyed(Session)
    case sessionAlreadyAuthorized(Session)
    
    // MARK: - Request errors
    case unexpectedResponse
    case jsonNotParsed(Error)
    case urlRequestError(Error)
    case maximumAttemptsExceeded
    case wrongAttemptType
    case wrongTaskType
    case captchaResultIsNil
    case wrongUrl
    
    // MARK: - UI Errors
    case cantBuildWebViewUrl(String)
    case cantBuildVkAppUrl(String)
    case cantMakeWebController
    case cantMakeCaptchaController
    case captchaPresenterTimedOut
    case cantMakeCapthaImageUrl(String)
    case cantLoadCaptchaImage(Error)
    case cantLoadCaptchaImageWithUnknownReason
    case webPresenterTimedOut
    case webPresenterResultIsNil
    case webControllerError(Error)
    case authorizationUrlIsNil
    case authorizationDenied
    case authorizationCancelled
    case authorizationFailed
    
    func toApi() -> ApiError? {
        switch self {
        case let .api(error):
            return error
        default:
            return nil
        }
    }
}

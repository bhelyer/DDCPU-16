// D import file generated from 'derelict\sfml\ntypes.d'
module derelict.sfml.ntypes;
private import derelict.sfml.config;

alias int sfFtpTransferMode;
enum 
{
sfFtpBinary,
sfFtpAscii,
sfFtpEbcdic,
}
alias int sfFtpStatus;
enum 
{
sfFtpRestartMarkerReply = 110,
sfFtpServiceReadOnlySoon = 120,
sfFtpDataConnectionAlreadyOpened = 125,
sfFtpOpeningDataConnection = 150,
sfFtpOk = 200,
sfFtpPointlessCommand = 202,
sfFtpSystemStatus = 211,
sfFtpDirectoryStatus = 212,
sfFtpFileStatus = 213,
sfFtpHelpMessage = 214,
sfFtpSystemType = 215,
sfFtpServiceReady = 220,
sfFtpClosingConnection = 221,
sfFtpDataConnectionOpened = 225,
sfFtpClosingDataConnection = 226,
sfFtpEnteringPassiveMode = 227,
sfFtpLoggedIn = 230,
sfFtpFileActionOk = 250,
sfFtpDirectoryOk = 257,
sfFtpNeedPassword = 331,
sfFtpNeedAccountToLogIn = 332,
sfFtpNeedInformation = 350,
sfFtpServiceUnavailable = 421,
sfFtpDataConnectionUnavailable = 425,
sfFtpTransferAborted = 426,
sfFtpFileActionAborted = 450,
sfFtpLocalError = 451,
sfFtpInsufficientStorageSpace = 452,
sfFtpCommandUnknown = 500,
sfFtpParametersUnknown = 501,
sfFtpCommandNotImplemented = 502,
sfFtpBadCommandSequence = 503,
sfFtpParameterNotImplemented = 504,
sfFtpNotLoggedIn = 530,
sfFtpNeedAccountToStore = 532,
sfFtpFileUnavailable = 550,
sfFtpPageTypeUnknown = 551,
sfFtpNotEnoughMemory = 552,
sfFtpFilenameNotAllowed = 553,
sfFtpInvalidResponse = 1000,
sfFtpConnectionFailed = 1001,
sfFtpConnectionClosed = 1002,
sfFtpInavalidFile = 1003,
}
alias int sfHttpMethod;
enum 
{
sfHttpGet,
sfHttpPost,
sfHttpHead,
}
alias int sfHttpStatus;
enum 
{
sfHttpOk = 200,
sfHttpCreated = 201,
sfHttpAccepted = 202,
sfHttpNoContent = 204,
sfHttpMultipleChoices = 300,
sfHttpMovedPermanently = 301,
sfHttpMovedTemporarily = 302,
sfHttpNotModified = 304,
sfHttpBadRequest = 400,
sfHttpUnauthorized = 401,
sfHttpForbidden = 403,
sfHttpNotFound = 404,
sfHttpInternalServerError = 500,
sfHttpNotImplemented = 501,
sfHttpBadGateway = 502,
sfHttpServiceNotAvailable = 503,
sfHttpInvalidResponse = 1000,
sfHttpConnectionFailed = 1001,
}
struct sfIPAddress
{
    byte[16] Address;
}
alias int sfSocketStatus;
enum 
{
sfSocketDone,
sfSocketNotReady,
sfSocketDisconnected,
sfSocketError,
}
struct sfFtpDirectoryResponse;
struct sfFtpListingResponse;
struct sfFtpResponse;
struct sfFtp;
struct sfHttpRequest;
struct sfHttpResponse;
struct sfHttp;
struct sfPacket;
struct sfSelectorTCP;
struct sfSelectorUDP;
struct sfSocketTCP;
struct sfSocketUDP;

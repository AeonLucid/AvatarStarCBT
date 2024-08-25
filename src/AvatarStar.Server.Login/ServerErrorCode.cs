namespace AvatarStar.Server.Login;

public enum ServerErrorCode
{
    Success = 0,
    SystemError = 1001,
    PasswordError = 1103,
    InvalidUserId = 1105,
    AccountFrozen = 1107,
    InvalidCommand = 2001,
    /// <summary>
    ///     Valid failed.
    /// </summary>
    ValidFailed = 2002,
    /// <summary>
    ///     Net delay.
    /// </summary>
    NetDelay = 2003,
    /// <summary>
    ///     The user account isn't activated.
    /// </summary>
    UserNotActivated = 3000,
    /// <summary>
    ///     You don't have the qualifications to login.
    /// </summary>
    AccountNotQualified = 3001,
    AuthenticationFailed = 8000,
    /// <summary>
    ///     Account Locked.
    /// </summary>
    AccountLocked = 8001,
    /// <summary>
    ///     Account suspended.
    /// </summary>
    AccountSuspended = 8002,
    /// <summary>
    ///     Account not activated.
    /// </summary>
    AccountNotActivated = 8003,
    /// <summary>
    ///     Invalid CBT account.
    /// </summary>
    AccountInvalidCBT = 8004,
    /// <summary>
    ///     MAC address blacklisted.
    /// </summary>
    MacAddressBlacklisted = 8005,
    /// <summary>
    ///     ?
    /// </summary>
    Unknown40000 = 40000,
    /// <summary>
    ///     Cannot connect to server.
    /// </summary>
    ServerConnectionFailed = 40001,
    /// <summary>
    ///     Re-connecting to server.
    /// </summary>
    ServerReconnecting = 40002,
    /// <summary>
    ///     Server list overflow.
    /// </summary>
    ServerListOverflow = 40003,
}
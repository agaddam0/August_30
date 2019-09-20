public class TC_Lastlogindatetime 
{
@Auraenabled
    public static Datetime getlogindetails()
{
    Datetime lastlogin;
    User u = [SELECT LastLoginDate FROM User WHERE Id =:UserInfo.getUserId()];
    lastlogin = u.LastLoginDate;
    system.debug('The time is'+lastlogin);
    return lastlogin;
   
}
}
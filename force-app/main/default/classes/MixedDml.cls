// when we perform dml on setup and non setup objects in one transaction, in that mixed dml exception occured
// to overcome with mixed dml we use future method 
public class MixedDml {
    Public static void mixedDmlOperation(){
        // Dml on non setup object(non setup object = standard and custom object)
        Account acc = new Account();
        acc.Name = 'MixedDmlAccount';
        insert acc;
        System.debug(acc); 
        setupObjectDmlOperstion();
    }
     // Dml onsetup object(setup object = profile, user, groups, queues, permission  set)   
    @Future
    public static void setupObjectDmlOperstion(){
        try{
         profile userProfile = [Select Id From Profile Where Name = 'System Administrator'];
        UserRole roleOfUser = [Select Id From UserRole Where Name = 'Speaker'];
        // Create user
        User createUser = new User();
        createUser.Alias= 'u11';
        createUser.Email = 'virat@kohli.com';
        createUser.EmailEncodingKey = 'UTF-8';
        createUser.LastName = 'kholi';
        createUser.LanguageLocaleKey = 'en_US';
        createUser.LocaleSidKey = 'en_US';
        createUser.ProfileId = userProfile.Id;
        createUser.UserRoleId = roleOfUser.Id;
        createUser.TimeZoneSidKey = 'America/Los_Angeles';
        createUser.Username = 'virat11@kohli.com';
        insert createUser;
        System.debug(createUser);   
        }
        catch(Exception e){
            System.debug(e.getMessage());
        } 
    }
}
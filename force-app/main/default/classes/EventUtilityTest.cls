@isTest
public class EventUtilityTest {
    @isTest 
    private static void testEventStatusLength(){
        String res = EventUtility.eventPriority('IND');
        System.assertEquals(null, res);
    }
    @isTest
    private static void testHighPri(){
        String res = EventUtility.eventPriority('CA');
        System.assertEquals('High', res);
    }
    @isTest
    private static void testMediumPri(){
        String res = EventUtility.eventPriority('Na');
        System.assertEquals('Medium', res);
    }
    
}
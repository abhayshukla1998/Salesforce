@isTest
public class TemperatureTest {
    
    @isTest
    private static void warmTempTest(){
        Decimal res = Temperature.FtoC(70);
        System.assertEquals(21.11, res);
    }
        
}
import java.util.Scanner;
import java.util.InputMismatchException;
import java.util.EnumSet;

public class OSTypeEnum
{
    enum OS { ANDROID, IOS, MACOSX, WINDOWS8, WP8, VXWORKS }
    
    enum OSType { DESKTOP, EMBEDDED, MOBILE }
    
    private static <E extends Enum<E>> E getEnumElement(String elementTypeName, Class<E> elementType)
    {
        boolean haveResult = false;
        E result = null;
        Scanner stdin = new Scanner(System.in);
        
        while ( ! haveResult )
        {
            System.out.print("Input " + elementTypeName + ": ");
            try
            {
                result = Enum.valueOf(elementType, stdin.next().toUpperCase());
                haveResult = true;
            }
            catch (IllegalArgumentException e)
            {
                System.out.println("Not a valid " + elementTypeName + ".");
                stdin.nextLine(); // skip the invalid input
            }
        }
        
        return result;
    }
  
    private static OS os2OSType(OSType device)
    {
        OS example = null;
        
        switch (device)
        {
        case MOBILE:
            example = OS.IOS;
            break;
        case DESKTOP:
            example = OS.MACOSX;
            break;
        case EMBEDDED:
            example = OS.VXWORKS;
            break;
        }
        
        return example;
    }

    public static void main(String[] args)
    {
        System.out.print("Known Devices = ");
        for (OSType t : EnumSet.allOf(OSType.class)) 
        {
            System.out.print(t + " ");
        }
        System.out.println();
        
        OSType device = getEnumElement("device", OSType.class);
        System.out.println(device + " example is: " + os2OSType(device));
    }
}
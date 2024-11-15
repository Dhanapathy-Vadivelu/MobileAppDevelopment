namespace Library.Services;

public class TestService
{
    public const string constMonth = "October";
    private const string _constMonth = "November";

    private string _DayOfMonth = "Wednesday";
    private int dayCount = 25;
    public int MonthCount = 12;

    public void Run()
    {
        Console.Write("Service Run method executed!..");
        Console.Write(constMonth);
        Console.WriteLine("Month Count:"+MonthCount);
        PrintWelcomeText();
    }

    private void PrintWelcomeText()
    {
        Console.Write("Service PrintWelcomeText method executed!..");
        Console.Write(StringData.WelcomeText);
    }
}


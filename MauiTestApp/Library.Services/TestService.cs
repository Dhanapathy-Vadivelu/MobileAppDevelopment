namespace Library.Services;

public class TestService
{
    public const string constMonth = "October";

    public void Run()
    {
        Console.Write("Service Run method executed!..");
        Console.Write(constMonth);
        PrintWelcomeText();
    }

    private void PrintWelcomeText()
    {
        Console.Write("Service PrintWelcomeText method executed!..");
        Console.Write(StringData.WelcomeText);
    }
}


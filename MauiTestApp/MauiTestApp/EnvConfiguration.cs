namespace MauiTestApp
{
    public class EnvConfiguration
    {
        private readonly string _apiURL, _apiKey;
        public EnvConfiguration(string apiUrl, string apiKey)
        {
            _apiURL = apiUrl;
            _apiKey = apiKey;
        }
    }

    public class ConfigHelper
    {
        public ConfigHelper()
        {
            var envConfig = new EnvConfiguration("TEX45NJSIS", "XNCBDHEJE09333JSK");
            Console.Write("Service PrintWelcomeText method executed!..");
        }
    }
}

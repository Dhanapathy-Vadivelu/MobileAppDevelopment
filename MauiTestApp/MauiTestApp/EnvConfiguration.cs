namespace MauiTestApp
{
    public class EnvConfiguration
    {
        internal readonly string _apiURL, _apiKey;
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
            var envConfig = new EnvConfiguration("http://localhost:5000", "XNCBDHEJE09333JSK");
            Console.Write("Service PrintWelcomeText method executed!..");
            Console.WriteLine("Api Url:"+envConfig._apiURL);
            Console.WriteLine("Api Key:"+envConfig._apiKey);
        }
    }
}

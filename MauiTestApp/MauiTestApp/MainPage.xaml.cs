using Library.Services;

namespace MauiTestApp;

public partial class MainPage : ContentPage
{
	int count = 0;

	public MainPage()
	{
		InitializeComponent();
	}

	private void OnCounterClicked(object sender, EventArgs e)
	{
		count++;
		var service = new TestService();
		service.Run();

        if (count == 1)
			CounterBtn.Text = $"Clicked {count} time";
		else
			CounterBtn.Text = $"Clicked {count} times";

		SemanticScreenReader.Announce(CounterBtn.Text);
	}

    private void OnRootClicked(object sender, EventArgs e)
	{
		RootBtn.Text = $"Root Check Triggered";
        SemanticScreenReader.Announce(RootBtn.Text);
    }
    private void OnTamperClicked(object sender, EventArgs e)
    {
        TamperBtn.Text = $"Tamper Check Triggered";
        SemanticScreenReader.Announce(TamperBtn.Text);
    }
}



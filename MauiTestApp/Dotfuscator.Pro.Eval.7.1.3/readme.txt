========================================
|Dotfuscator Professional NuGet package|
========================================

While you may be familiar with using NuGet (https://docs.microsoft.com/en-us/nuget/what-is-nuget) to add third-party libraries from nuget.org (https://www.nuget.org/) to your projects, the Dotfuscator NuGet package works quite differently:

The package does not expose libraries for general programming use. Instead, the package contains Dotfuscator's various components which can be used as independent tools during a build.

You do not add a reference to the Dotfuscator NuGet package in your project. Instead, you explicitly install the package to a directory and have your builds use the extracted components in that directory.

The package is not available on the public nuget.org feed. Instead, the package is distributed privately from PreEmptive, and must be hosted on a private feed within your organization.

The package's ID is PreEmptive.Protection.Dotfuscator.Pro.

Please go to the User Guide for more information: https://www.preemptive.com/dotfuscator/pro/userguide/en/installation_nuget.html

That page discusses the private NuGet package which contains Dotfuscator itself. There is also a more traditional NuGet package available on nuget.org which contains Check Attributes (https://www.preemptive.com/dotfuscator/pro/userguide/en/references_attributes_checks.html). Your project can reference this NuGet package and use the provided attributes to annotate your code. When Dotfuscator runs, it recognizes these attributes in your compiled code and injects Checks accordingly.

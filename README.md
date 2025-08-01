# BurntToast

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/5c96b736ff1b45d98666160ab37dcad5)](https://www.codacy.com/manual/Windos/BurntToast?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Windos/BurntToast&amp;utm_campaign=Badge_Grade)
[![Build Status](https://dev.azure.com/windosnz/BurntToast/_apis/build/status/Windos.BurntToast-Build?branchName=main)](https://dev.azure.com/windosnz/BurntToast/_build/latest?definitionId=2&branchName=main)
[![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/BurntToast.svg)](https://www.powershellgallery.com/packages/BurntToast)
[![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/BurntToast.svg)](https://www.powershellgallery.com/packages/BurntToast)
[![Open Issues](https://img.shields.io/github/issues-raw/Windos/BurntToast.svg)](https://github.com/Windos/BurntToast/issues)

![BurntToast Logo Banner](/images/BurntToast-Wide.png)

PowerShell Module for displaying Toast Notifications on **Windows 10** and **Windows Server 2019** and above.

## Install

### PowerShell Gallery Install

```powershell
Install-Module -Name BurntToast
```

See the [PowerShell Gallery](http://www.powershellgallery.com/packages/BurntToast/) for the complete details and
instructions.

### Chocolatey

```powershell
choco install burnttoast-psmodule
```

See the [Chocolatey community package](https://chocolatey.org/packages/burnttoast-psmodule) for more details. Thanks
[Bill Curran](https://github.com/bcurran3) for maintaining the package.

## Releases

### [v1.0.1](https://github.com/Windos/BurntToast/releases/download/v1.0.1/BurntToast.zip)

#### Bug Fixes

- OnActivated events are "sticky"

  - See #256 by [Windos](https://github.com/Windos)

### [v1.0.0](https://github.com/Windos/BurntToast/releases/download/v1.0.0/BurntToast.zip)

#### Breaking Changes

- Custom Audio Path Removed: Support for custom audio file sources has been eliminated.

- AppId Customization Removed: The ability to specify a custom AppId has been removed.

- Shoulder Tap Notifications Removed: Support for "shoulder tap" toast types is no longer available.

#### Features and Improvements

- Shortcut Support: Introduced capability to create Windows shortcuts with proper AppUserModelID—enables full toast branding when launching PowerShell.

- Event Data Improvements: Event data handling and options improved for notification actions.

- Enable "Activation" events on all supported versions of PowerShell, including Windows PowerShell.

- Enable "Dismissed" and "Failed" events on PowerShell 7.1+.

- Improve support for attribution text.

#### Libraries

- Microsoft.Windows.SDK.NET.Ref library bumped to 10.0.22621.28.

- Microsoft.Toolkit.Uwp.Notifications library bumped to 7.1.3.

### See previous releases in the [Full Change Log](CHANGES.md)

## We're Looking for Maintainers!

To ensure the long-term health of this project and prevent maintainer burnout, I'm looking for some additional helping hands. All contributions are of great value, from code and documentation to issue triage and testing.

If you are interested in helping guide the future of this project, please let me know by filling out our [Maintainer Request Form](https://github.com/Windos/BurntToast/issues/new?template=Maintainer_Request.yaml). Look forward to hearing from you!

## Contributors

- [Windos](https://github.com/Windos)
- [jeremytbrun](https://github.com/jeremytbrun)
- [KelvinTegelaar](https://github.com/KelvinTegelaar)
- [steviecoaster](https://github.com/steviecoaster)
- [glennsarti](https://github.com/glennsarti)
- [UniverseCitiz3n](https://github.com/UniverseCitiz3n)
- [cedarbaum](https://github.com/cedarbaum)

## License

- see [LICENSE](LICENSE) file

## Image Credit

The [default image](/images/BurntToast.png) for BurntToast Notifications is a photo taken by
[Craig Sunter](https://www.flickr.com/photos/16210667@N02/17230428864)

## Contact

- Bluesky: [@toastit.dev](https://bsky.app/profile/toastit.dev)
- Mastodon: [@windos@mastodon.nz](https://mastodon.nz/@windos)
- Twitter: [@WindosNZ](https://twitter.com/windosnz)
- Blog: [ToastIT.dev](https://toastit.dev/)

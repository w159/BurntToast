Import-Module "$PSScriptRoot/../BurntToast/BurntToast.psd1" -Force

Describe 'New-BTAction' {
    Context 'running without arguments' {
        Start-Transcript tmp.log
        try {
            New-BTAction -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAction" on target "returning: [ToastActionsCustom] with 0 Inputs, 0 Buttons, and 0 ContextMenuItems".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
    Context 'snooze and dismiss modal' {
        Start-Transcript tmp.log
        try {
            New-BTAction -SnoozeAndDismiss -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAction" on target "returning: [ToastActionsSnoozeAndDismiss] with 0 Inputs, 0 Buttons, and 0 ContextMenuItems".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
    Context 'single clickable button' {
        Start-Transcript tmp.log
        try {
            New-BTAction -Buttons (New-BTButton -Content 'Google' -Arguments 'https://google.com') -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAction" on target "returning: [ToastActionsCustom] with 0 Inputs, 1 Buttons, and 0 ContextMenuItems".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
    Context 'mixed content: button & context menu' {
        $Button = New-BTButton -Content 'Google' -Arguments 'https://google.com'
        $ContextMenuItem = New-BTContextMenuItem -Content 'Bing' -Arguments 'https://bing.com'

        Start-Transcript tmp.log
        try {
            New-BTAction -Buttons $Button -ContextMenuItems $ContextMenuItem -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAction" on target "returning: [ToastActionsCustom] with 0 Inputs, 1 Buttons, and 1 ContextMenuItems".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
}

Describe 'New-BTAppId' {
    Context 'running without arguments' {
        Start-Transcript tmp.log
        try {
            New-BTAppId -DryFire -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAppId" on target "creating: ''HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'' with property ''ShowInActionCenter'' set to ''1'' (DWORD)".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
    Context 'running with custom AppId' {
        Start-Transcript tmp.log
        try {
            New-BTAppId -AppId 'Script Checker' -DryFire -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAppId" on target "creating: ''HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Script Checker'' with property ''ShowInActionCenter'' set to ''1'' (DWORD)".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
}

Describe 'New-BTAudio' {
    Context 'built in audio source' {
        Start-Transcript tmp.log
        try {
            New-BTAudio -Source ms-winsoundevent:Notification.SMS -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAudio" on target "returning: [ToastAudio]:Src=ms-winsoundevent:Notification.SMS:Loop=False:Silent=False".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
    Context 'custom audio source' {
        Start-Transcript tmp.log
        try {
            New-BTAudio -Path 'C:\Windows\media\tada.wav' -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAudio" on target "returning: [ToastAudio]:Src=file:///C:/Windows/media/tada.wav:Loop=False:Silent=False".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
    Context 'Silent switch' {
        Start-Transcript tmp.log
        try {
            New-BTAudio -Silent -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTAudio" on target "returning: [ToastAudio]:Src=:Loop=False:Silent=True".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
}








Describe 'New-BTBinding' {
    Context 'loaded with children' {
        $Text1 = New-BTText -Content 'This is a test'
        $Text2 = New-BTText
        $Text3 = New-BTText -Content 'This more testing'
        $Progress = New-BTProgressBar -Title 'Things are happening' -Status 'Working on it' -Value 0.01
        $Image1 = New-BTImage -Source '$PSScriptRoot\Media\BurntToast.png'
        $Image2 = New-BTImage -Source '$PSScriptRoot\Media\BurntToast.png' -AppLogoOverride -Crop Circle
        $Image3 = New-BTImage -Source '$PSScriptRoot\Media\BurntToast.png' -HeroImage

        Start-Transcript tmp.log
        try {
            New-BTBinding -Children $Text1, $Text2, $Text3, $Image1, $Progress -AppLogoOverride $Image2 -HeroImage $Image3 -WhatIf
        }
        finally {
            Stop-Transcript
            $Log = (Get-Content tmp.log).Where({ $_ -match "What if: " })
            Remove-Item tmp.log
        }
        It 'has consitent WhatIf response' {
            $Expected = 'What if: Performing the operation "New-BTBinding" on target "returning: [ToastBindingGeneric]:Children=5:AddImageQuery=0:AppLogoOverride=1:Attribution=0:BaseUri=0:HeroImage=1:Language=0".'
            $Log -join [System.Environment]::NewLine | should Be $Expected
        }
    }
}



Describe 'New-BurntToastNotification' {
    Context 'running without arguments' {
        It 'runs without errors' {
            { New-BurntToastNotification } | should Not Throw
        }

        It 'does not return anything' {
            New-BurntToastNotification | should BeNullOrEmpty
        }
    }
    Context 'running with arguments (Image)' {
        It 'runs without errors' {
            { New-BurntToastNotification -AppLogo 'https://raw.githubusercontent.com/Windos/BurntToast/master/Media/BurntToast-Logo.png' } | should Not Throw
        }

        It 'does not return anything' {
            New-BurntToastNotification -AppLogo 'https://raw.githubusercontent.com/Windos/BurntToast/master/Media/BurntToast-Logo.png' | should BeNullOrEmpty
        }
    }
}

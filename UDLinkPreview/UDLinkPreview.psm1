$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterAsset($IndexJs.FullName)

function New-UDLinkPreview {
       <#
    .SYNOPSIS
    Creates a link preview of the supplied hyperlink
    
    .DESCRIPTION
    Allows you to display a link preview of the URL you have provided to a given website. This is very similar to what you see on social-media sites when posting a hyperlink. 
    
    .PARAMETER Id
    The ID of this editor

    .PARAMETER URL
    A full URL address of a website. This is a mandatory parameter

    .PARAMETER TextLoading
    Text to be displayed whilst the component is loading. Defaulted to Please wait...

    .PARAMETER TextNotFound
    Text to be displayed if the supplied URL cannot be found or the information cannot be retrieved. Defaulted to URL Not Found

    .EXAMPLE
    New-UDLinkPreview -URL "https://adam-bacon.netlify.app/powershell-universal/udtestimonial/"
    #>
    
    
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter(Mandatory)]
        [string]$URL,
        [Parameter()]
        [string]$TextLoading = "Please wait...",
        [Parameter()]
        [string]$TextNotFound = "URL Not Found"

    )

    End {
        @{
            assetId = $AssetId 
            isPlugin = $true 
            type = "udlinkpreview"
            id = $Id

            url = $URL
            loadingText = $TextLoading
            notFound = $TextNotFound
        }
    }
}
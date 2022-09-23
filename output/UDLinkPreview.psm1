$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterAsset($IndexJs.FullName)

function New-UDLinkPreview {
    <#
    .SYNOPSIS
    Creates a new component
    
    .DESCRIPTION
    Creates a new component
    
    .PARAMETER Id
    The ID of this editor

    .PARAMETER Text
    Text for the component

    .EXAMPLE
    New-UDLinkPreview -Text 'Hello, world!'
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
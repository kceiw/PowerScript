Param(
    [Parameter(Mandatory=$True,Position=1)]
    [String[]] $Pattern,
    [String[]] $Path = ".",
    [string[]] $Exclude,
    [string[]] $Include,
    [switch]$Recurse=$True
)

$allChildItems = ""

if ($Recurse)
{
    $allChildItems = Get-ChildItem -Recurse -Path $Path -Include $Include -Exclude $Exclude
}
else
{
    $allChildItems = Get-ChildItem -Path $Path -Include $Include -Exclude $Exclude
}

$allChildItems | Select-String -Pattern $Pattern
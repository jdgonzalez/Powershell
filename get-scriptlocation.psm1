function get-scriptlocation
{
    # get the current location of the script it is being run from
    $location = Split-Path $MyInvocation.MyCommand.Path -Parent
    return $location
}
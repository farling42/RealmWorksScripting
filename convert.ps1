# Power Shell script

# Invoke this script with "cat ./convert.ps1 | powershell.exe -noprofile -"
# (Or right-click this file in Windows Explorer and select "Run with Powershell"

# Step 1 - Download Obsidian Portal backup file
# Step 1.1 - go to the web page of your obsidian portal
# Step 1.2 - select "Settings" in the left column
# Step 1.3 - select "Advanced" in the page's menu
# Step 1.4 - select "Download Backup"
# Step 2 - Run this script...
# Step 2.1 - Extracts the XML from the downloaded .zip file.
# Step 2.2 - Converts the XML into a realmworks .rwexport file.
# Step 3 - import the predefined obsidian_portal.rwstructure file into your destination realm.
# Step 4 - import the generated .rwexport file into your destination realm.

param ($infile,$outfile)
if (!($infile))
{
    # Ask for the file
    [Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.title  = "Choose the Obsidian Portal Backup ZIP file"
    $OpenFileDialog.filter = "ZIP (*.zip)| *.zip"
    $OpenFileDialog.ShowDialog() | Out-Null
    $zipfilename = $OpenFileDialog.filename
}
else
{
    $zipfilename = (get-item $infile).FullName
}
$basename=(get-item $zipfilename).BaseName

if (!($outfile))
{
    $outfile=$basename+".rwexport"
}

# Find the XML in the downloaded zip file, and create a stream to that file
[Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem') | Out-Null
$zipfile=[IO.Compression.ZipFile]::OpenRead($zipfilename)
$reader=[System.Xml.XmlReader]::Create($zipfile.GetEntry($basename+"/"+$basename+".xml").open())

# Create a stream to write out the final file
$writer=[System.Xml.XmlTextWriter]::Create($outfile)

# Translate the XML file (only understands XSLT 1.0)
$xslt = New-Object System.Xml.Xsl.XslCompiledTransform
$xslt.Load("ob2rw-xsl1.xslt")
$xslt.Transform($reader,$writer)
echo "Generated $outfile"
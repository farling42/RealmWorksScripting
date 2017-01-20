I've managed to put together something which will take your existing Obsidian Portal information and migrate the data into Realm Works.

The process is:

1) Go to Obsidian Portal and download a backup of your campaign.
2) Run my converter.
3) Import the generated .rwexport file into your RW realm.

----------
More Detail

Step 1 - Obsidian Portal
1 - go the web page for your obsidian portal campaign.
2 - select "settings" in the left panel.
3 - select "Advanced" in the page's menu.
4 - select "download backup"

Step 2 - Run my converter
1 - Download the convert.ps1 (a powershells script)
2 - Download the ob2rw-xsl1.xslt file (a XSL version 1.0 specification)
3 - Put these two files in the same folder (I use "Documents\Realm Works\Scripting".
3 - Right click on the convert.ps1 and select "Run with PowerShell"
4 - select the .ZIP file that was downloaded from obsidian portal

Step 3 - import into realm works
1 - open an existing realm
2 - select import and choose the ".rwexport" file which was created using my converter
3 - tidy up the information inside Realm Works

----------
Extra Information

1 - The conversion process creates 5 new topic categories to handle the imported information
2 - Pictures are not exported as part of the Obsidian Portal backup file, so they are not imported into RealmWorks
3 - the current version of the scripts will NOT work to re-import updates later (this is a future evolution).

----------
Access to the files 
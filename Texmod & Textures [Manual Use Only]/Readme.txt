TexMod Beta Version
-------------------

TexMod is an utility to find, save and modify textures in Direct3D 9 (!)applications. In order to share and distribute texture modifications, packages can be created, which are both compressed and prevent a further modification.

Benefits are hat you don't have to modify any files of your application's installation and you don't need any game specific modding tools.




The application interface offers three modes:

1) Package mode: add package files to a list and load them into the selected application.
Packages on top of the list are loaded first. Change the package order to remove prioritize a package if it changes the same texture as another one.

2) Logging mode: choose between several options and start the selected application in logging mode. You can browse through all loaded textures of the application and save the selected one in the output folder.
For every saved texture a line will be appended to the texmod.log file in the output folder in the format the Package Builder expects it.

3) Build mode: create a package by selecting a definition file (e.g. an automatically created log file) and entering your name and a comment, which both will be shown when opening the package in the package mode.





NOTES
-----
This is an early beta version and does not offer application specific fixes. Don't be suprised if your application crashes or shows other strange behaviour and expect a slight performance drop, especially when you use the logging features.



Definition File Syntax
----------------------
The definition file, which contains a checksum and a path to a texture file has to look like this:
<checksum>|<texture file path>
If the checksum is in hex format, it hast to start with '0x', e.g. 0x00ABCDEF.
The file path can be absolute or relative to definition file.




Controls in Logging mode
------------------------
All controls are located on your numpad.

Key		Function

+		select next texture	
-		select previous texture
*		filter drawn textures. Only filtered will be selectable.
/		reset filter mode (show all textures again)
,		reload the replacement definition file (reload modified 
		textures without restarting your application)



-------------
RS 19.04.2006
rstoff@gmail.com



# AHK-Scripts

I keep a collection of my favorite AHK scripts that I made to automate some of the annoyances of my life and make weird UX things better. 

All of the scripts require you to download AutoHotKey(AHK) on a windows machine to work. You can find the latest release at the [official AHK Site](https://www.autohotkey.com/).

- URL_to_PDF simply takes a URL and makes it into a PDF. Requires [Percollate](https://github.com/danburzo/percollate). 
- MegaClip lets you create a temporary array of your clipboard so you can copy a lot of items from one location and then repaste them to another location without having to hop back and forth.
- FigmaSaver allows you to use your native file system to create folders for your Figma Files. Purpose of this was to avoid paying for premium Figma but still be able to organize my files into folders. 



## URL_to_PDF
All you have to do for this to work is change your download location and your path to the stylesheet from percollate. From there, you simply copy the link to your clipboard, press your hotkey (default is Alt + P), and the URL is converted to a PDF. 

## MegaClip
Using MegaClip is simple. By default, there are three main hotkeys: CapsLock + C which clears the MegaClip memory, Ctrl + Alt + C which store an item to the MegaClip memory, and Ctrl + Alt + V which pastes from the MegaClip keyboard. When you add an item to the clipboard, it gets placed at the end and a popover shows the text copied and the number it is placed in the MegaClip. 

![image](https://user-images.githubusercontent.com/57516026/178159203-3ae380e5-247e-4223-825c-786f7397f9c1.png) 

When you paste from the MegaClip using Ctrl + Alt + V, you paste from the beginning to the end and a popover tells you what item in memory you are in. 

![image](https://user-images.githubusercontent.com/57516026/178159237-084ffbf3-c349-4bc2-bcd3-e1eed34d4c3a.png)

Once you have hit the end of the MegaClip, it cycles back to the start and runs through the whole clip again. 

One of the coolest things you can do with this is have it alter the text in memory before it is pasted and it just takes a little bit of code. 


https://user-images.githubusercontent.com/57516026/178159642-f753c4a7-351c-4bd9-b1a6-aad3bf823b97.mp4



## FigmaSaver
WIP



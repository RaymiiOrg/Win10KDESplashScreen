# Windows 10 KDE Splash Screen

![preview](Win10Splash/contents/previews/splash.png)

## Installation Instructions:

* Download [ZIP via GitHub](https://github.com/RaymiiOrg/Win10KDESplashScreen/archive/refs/heads/master.zip) or clone this repository
* Extract ZIP file
* Move `Win10Splash` folder to:

    $HOME/.local/share/plasma/look-and-feel/

If the folder does not exist, create the it. The contents should look like:

```
$ tree ~/.local/share/plasma/look-and-feel/ 
/home/user/.local/share/plasma/look-and-feel/
|-- Win10Splash
|   |-- contents
|   |   |-- previews
|   |   |   `-- splash.png
|   |   `-- splash
|   |       |-- Splash.qml
|   |       `-- images
|   |           `-- spinner.gif
|   `-- metadata.desktop

```

Note that all of your other splash screens are in that folder as well.

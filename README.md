# Streamdeck UI Plugins

This repository contains some script and configuration I developed to set my Elgato Stream Deck for a development use (expecially with Laravel) but also for Spotify management and possibly something else in the future. The scripts and configurations works with [streamdeck-ui](https://timothycrosley.github.io/streamdeck-ui/) from Timothy Crosley. Consider them more as an inspiration for what you could do to set your streamdeck to your needs than as standalone plugins.

## Installation

### Requirements

The following software is required:

- [streamdeck-ui](https://timothycrosley.github.io/streamd)

#### For application launch/focus toggle:

- [xdotool](https://github.com/jordansissel/xdotool)

#### For Laravel snippets:

- [xclip](https://github.com/astrand/xclip)

#### For Spotify management

- [spotify-tui](https://github.com/Rigellute/spotify-tui)

Be sure to have the above installed and working.

### install.sh

After you've installed the requirements you can install these plugins:

```bash
$ git clone https://github.com/sk4t0/streamdeck-ui-plugins.git && cd streamdeck-ui-plugins && chmod u+x install.sh && ./install.sh
```

This will:

- Install [BeautyLine icons](https://github.com/gvolpe/BeautyLine) on `/usr/share/icons`.
- Create a `streamdeck` folder in your home containing files needed.
- Replace the script locations called in the `.streamdeck_ui.json` file given as example that you'll find on the project folder that you cloned.
- Replace, again in `.streamdeck_ui.json`, the hostname used to identify your device on the Spotify commands

## .streamdeck_ui.json

This is the file used by `streamdeck-ui` to configure all the buttons and pages on your streamdeck. 

After you ran `install.sh` you'll find this file ready on the cloned root folder. You can use it to see how to call the scripts and in general how I configured my streamdeck. You could also paste it on your home folder as it is, but consider that there could be application launchers for applications that you could not have. 

The first page is my home, in the second you can find the 'work' page, with the scripts called to launch my work environment or to insert the Laravel snippets. In the second one you can find my 'relax' page with the script launching my relax environment. The last one instead, page 9, is the page for Spotify management.

## launcher.sh

This is a little screen I wrote because, on a button to launch an application, you would like, if the application is already running, to set focus on its window instead of launching a new instance. This script accepts only one argument: the application that you want to launch.

## snippet.sh

This script accepts one argument: the name of the file inside `~/streamdeck/snippets` that you want to use as snippet. Basically it takes the content of the file and will paste it. The snippets you will find by default are the ones for:

- Laravel Model
- Laravel Controller
- Laravel Observer
- Laravel Command
- [Spatie Laravel Queueable Acttion](https://github.com/spatie/laravel-queueable-action)
- [Laravel Nova Resource](https://nova.laravel.com/docs/4.0/resources/)

But you can create every kind of stub/template that you want. Just place it in the `~/streamdeck/snippets` folder and use `snippet.sh` with your file name as argument to copy and paste its content.

## startwork.sh

This is the script I use to launch my work environment. 

One of the first things it does is to switch KDE activity to the one called 'work'. it does it with this command:

```bash
qdbus org.kde.ActivityManager /ActivityManager/Activities SetCurrentActivity $( grep -Po '.*?(?=\=work)' ~/.config/kactivitymanagerdrc | awk "NR==1")
```

You can replace 'work' with the activity name you want to switch to. If you don't use KDE or just activities you can obviously remove this line.

At the beginning, before switching the activity, it closes the applications that it want to open. This because, if you have them already opened on other activities, it would mess up with the applications between the 2 activities. As above, if you don't use KDE or just activities you can remove these lines as well.

I have a 2 FHD screens setting and I want to open applications on specific screens. By default I've set the applications to open on the screen I've the mouse on, so I switch screens just moving the mouse in this way:

- `xdotool mousemove 0 y` for the left screen
- `xdotool mousemove 1930 y` for the right screen

You can remove these lines if you use only 1 screen, or edit if you have a different resolution or more screens.

Then I launch some application in one, and then the other, screen.

About `konsole`, I launch it with a specific layout as you can see from the file. Use your own layout or remove the the option. After that I run:

```bash
xdotool type --delay=5 "cd $HOME/Lavoro/Homestead && vagrant up && vagrant ssh"
```

This is to launch my `vagrant` environment. Everything else should be clear enough.

## startrelax.sh

Similar to the above, but it switch to a different KDE activity and it just launch firefox and spotify.

## Spotify Management

For the Spotify management I used, as said before, [spotify-tui](https://github.com/Rigellute/spotify-tui). If you take the .streamdeck_ui.json file last page (that I set to open when launching spotify), you'll find the commands I used.

As you can see I used `dbus mpris` for play/pause, previous and next commands. This because `spotify-tui` use api, having a little delay. Delay unnecessary when you can just send the events directly on your system. I used `spotify-tui`, intead, for the like and the shuffle buttons, as well as for launching specific playlists. The `--device` argument must specify your computer device, the one playing spotify.


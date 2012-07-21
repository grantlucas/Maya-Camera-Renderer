# Maya Camera Renderer

Provides a way to quickly render out specific frames from cameras in a Maya scene file.

This script was initially created as the version of Maya at the time, 2011, didn't have a "hands off" way of rendering out multiple camers and frames. It was a manua process of selecting and rendering in the Maya interface. This meant you couldn't leave it running without intervention.

Had this script sitting around on my computer so figured I'd throw it up online incase it's useful for anyone else.

**Disclaimer:** This script was created a few years ago so it may need some tweaking to work with the latest versions of Maya. For all I know, it may not even be needed anymore. I've stopped doing much 3D work so haven't been able to use it in a while. If you do decide to try it out, make sure you **back everything up first.** If you have issues, don't hesitate to contact me and I can try to help get it working again if broken.

This has mainly been uploaded for archiving and the off chance someone may find it useful. Use at your own risk.

## Instructions

### cameras.txt

This is the main file where you list out, one per line, your shots to render. Format is CameraName:StartFrame:EndFrame. The sript will loop through all shots and dump the rendered frames in a folder named after the camera name.

### setting.conf

Here, various settings are stored for the script such as where to look for the Maya commandline executable, path to your .mb file and also where you want to dump files to. I recommend copying your scene to your desktop just to be safe. Run the script on that scene instead of your original.

The options allows you to set which render to use such as Mental Ray. Look at the help settings for the Maya command line tool to see what other options can be set.

### Usage

Ensure that the script can be executed with

    chmod +x mata_render_cam.sh

Run script passing in the cameras file. This allows you to set up multiple camera files and just pass in the one you want.

    ./maya_render_cam.sh cameras.txt

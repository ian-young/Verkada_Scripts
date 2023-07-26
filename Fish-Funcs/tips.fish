function tips --description 'Prints tips for vToolbox'
	clear
	echo " .              +   .                .   . .     .  .
                   .                    .       .     *
  .       *                        . . . .  .   .  + .
            \"You Are Here\"            .   .  +  . . .
.                 |             .  .   .    .    . .
                  |           .     .     . +.    +  .
                 \|/            .       .   . .
        . .       V          .    * . . .  .  +   .
           +      .           .   .      +
                            .       . +  .+. .
  .                      .     . + .  . .     .      .
           .      .    .     . .   . . .        ! /
      *             .    . .  +    .  .       - O -
          .     .    .  +   . .  *  .       . / |
               . + .  .  .  .. +  .
.      .  .  .  *   .  *  . +..  .            *
 .      .   . .   .   .   . .  +   .    .            +
"
	echo "--------------------------------------------------------"
	echo ""
	echo "$(set_color normal)vtoolbox camera.set-framerate -a $(set_color cyan)<token>$(set_color normal) -f $(set_color cyan)<new frame rate Integer>$(set_color normal) -s $(set_color cyan)<serial>$(set_color yellow) Change a camera's framerate.$(set_color normal)"
	echo "vtoolbox device.set-device-config -d $(set_color cyan)<deviceID> $(set_color normal)-u $(set_color cyan)<auth Token>$(set_color normal) -p \"image-processing.night-max-shutter-time-hyperzoom-hz\" -a $(set_color cyan)<value> $(set_color yellow) LPR shutter speed.$(set_color normal)"
	echo "--------------------------------------------------------"
	echo ""
	echo "When running a fish function for vToolbox, \$auth <support token>, \$org <org ID>, \$serial <serial number>, and \$device <device ID> will need to be set."
        echo "--------------------------------------------------------"
end

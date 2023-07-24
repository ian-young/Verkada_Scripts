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
	echo "vtoolbox device.set-device-config -u $(set_color cyan)<TOKEN> $(set_color normal)-d $(set_color cyan)<camID> $(set_color normal)-p 'camera-config.ldc-enable' 'true' $(set_color yellow)Enable LDC (Reboot after this)$(set_color normal)"
	echo "vtoolbox device.set-device-config -u $(set_color cyan)<TOKEN> $(set_color normal)-d $(set_color cyan)<camID> $(set_color normal)-p 'camera-config.ldc-enable' 'false' $(set_color yellow)Disable LDC to increase FOV.$(set_color normal)"


        echo "--------------------------------------------------------"
end

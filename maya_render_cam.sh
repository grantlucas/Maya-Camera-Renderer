#!/bin/bash

die()
{
  echo "$*"
  exit 1
}
#check for file name input

[ -z $1 ] && die "Provide file name of camera shots."

CONF=setting.conf
. ${CONF}
cat ${CONF}
echo ${OPTIONS}
echo ${SCENE_PATH}
echo "";

RENDER="${MAYA_PATH}Render"

#loop through the cameras file and render to target directory with sub directory

while read LINE; do
  echo $LINE
  camera=`echo $LINE | cut -d: -f1`
  startFrame=`echo $LINE | cut -d: -f2`
  endFrame=`echo $LINE | cut -d: -f3`
  echo "Camera: $camera"
  echo "Start Frame: $startFrame"
  echo "End Frame: $endFrame"

  #check if target directory exists, if not create it

  finalTarget=${TARGET_DIR}/${camera}

  if [ ! -d $finalTarget ]; then
    `mkdir -p ${finalTarget}`
    echo "Created target directory ${camera}"
  fi

  ${RENDER} -s ${startFrame} -e ${endFrame} -cam ${camera} -rd ${finalTarget} ${OPTIONS} ${SCENE_PATH}

  echo "-------------"
done < $1

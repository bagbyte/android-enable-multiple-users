#!/sbin/sh

bp="/system/build.prop"

SECTION_NAME="Multiple users account"

if [ -z "$(cat $bp | grep "$SECTION_NAME")" ]; then
  echo "" >> $bp;
  echo "#" >> $bp;
  echo "# $SECTION_NAME" >> $bp;
  echo "#" >> $bp;
fi;

MAX_USERS_CONFIG="fw.max_users=3"
MAX_USERS_CONFIG_CURRENT=$(cat $bp | grep "fw.max_users")

if [ -z "$MAX_USERS_CONFIG_CURRENT"]; then
  echo "$MAX_USERS_CONFIG" >> $bp;
else
  sed -i "s/$MAX_USERS_CONFIG_CURRENT/$MAX_USERS_CONFIG/g" $bp;
fi

SHOW_MULTIUSERUI_CONFIG="fw.show_multiuserui=1"
SHOW_MULTIUSERUI_CONFIG_CURRENT=$(cat $bp | grep "fw.show_multiuserui")

if [ -z "$SHOW_MULTIUSERUI_CONFIG_CURRENT"]; then
  echo "$SHOW_MULTIUSERUI_CONFIG" >> $bp;
else
  sed -i "s/$SHOW_MULTIUSERUI_CONFIG_CURRENT/$SHOW_MULTIUSERUI_CONFIG/g" $bp;
fi

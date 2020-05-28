#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

# Bibata Default
RAWSVGS_Bibata_Ghost="src/Bibata_Ghost/svgs"
INDEX_Bibata_Ghost="src/Bibata_Ghost/cursor.theme"
INDEX1_Bibata_Ghost="src/Bibata_Ghost/index.theme"

# Bibata Spirit

RAWSVGS_Bibata_Spirit="src/Bibata_Spirit/svgs"
INDEX_Bibata_Spirit="src/Bibata_Spirit/cursor.theme"
INDEX1_Bibata_Spirit="src/Bibata_Spirit/index.theme"

# Bibata Tinted

RAWSVGS_Bibata_Tinted="src/Bibata_Tinted/svgs"
INDEX_Bibata_Tinted="src/Bibata_Tinted/cursor.theme"
INDEX1_Bibata_Tinted="src/Bibata_Tinted/index.theme"

ALIASES="src/cursorList"


echo -ne "Checking Requirements...\\r"

if  ! type "inkscape" > /dev/null ; then
    echo -e "\\nFAIL: inkscape must be installed"
    exit 1
fi

if  ! type "xcursorgen" > /dev/null ; then
    echo -e "\\nFAIL: xcursorgen must be installed"
    exit 1
fi
echo -e "Checking Requirements... DONE"


echo -ne "Making Folders... $BASENAME\\r"
DIR11X_Bibata_Ghost="build/Bibata_Ghost/96x96"
DIR10X_Bibata_Ghost="build/Bibata_Ghost/88x88"
DIR9X_Bibata_Ghost="build/Bibata_Ghost/80x80"
DIR8X_Bibata_Ghost="build/Bibata_Ghost/72x72"
DIR7X_Bibata_Ghost="build/Bibata_Ghost/64x64"
DIR6X_Bibata_Ghost="build/Bibata_Ghost/56x56"
DIR5X_Bibata_Ghost="build/Bibata_Ghost/48x48"
DIR4X_Bibata_Ghost="build/Bibata_Ghost/40x40"
DIR3X_Bibata_Ghost="build/Bibata_Ghost/32x32"
DIR2X_Bibata_Ghost="build/Bibata_Ghost/28x28"
DIR1X_Bibata_Ghost="build/Bibata_Ghost/24x24"

DIR11X_Bibata_Spirit="build/Bibata_Spirit/96x96"
DIR10X_Bibata_Spirit="build/Bibata_Spirit/88x88"
DIR9X_Bibata_Spirit="build/Bibata_Spirit/80x80"
DIR8X_Bibata_Spirit="build/Bibata_Spirit/72x72"
DIR7X_Bibata_Spirit="build/Bibata_Spirit/64x64"
DIR6X_Bibata_Spirit="build/Bibata_Spirit/56x56"
DIR5X_Bibata_Spirit="build/Bibata_Spirit/48x48"
DIR4X_Bibata_Spirit="build/Bibata_Spirit/40x40"
DIR3X_Bibata_Spirit="build/Bibata_Spirit/32x32"
DIR2X_Bibata_Spirit="build/Bibata_Spirit/28x28"
DIR1X_Bibata_Spirit="build/Bibata_Spirit/24x24"


DIR11X_Bibata_Tinted="build/Bibata_Tinted/96x96"
DIR10X_Bibata_Tinted="build/Bibata_Tinted/88x88"
DIR9X_Bibata_Tinted="build/Bibata_Tinted/80x80"
DIR8X_Bibata_Tinted="build/Bibata_Tinted/72x72"
DIR7X_Bibata_Tinted="build/Bibata_Tinted/64x64"
DIR6X_Bibata_Tinted="build/Bibata_Tinted/56x56"
DIR5X_Bibata_Tinted="build/Bibata_Tinted/48x48"
DIR4X_Bibata_Tinted="build/Bibata_Tinted/40x40"
DIR3X_Bibata_Tinted="build/Bibata_Tinted/32x32"
DIR2X_Bibata_Tinted="build/Bibata_Tinted/28x28"
DIR1X_Bibata_Tinted="build/Bibata_Tinted/24x24"


OUTPUT_Bibata_Ghost="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Ghost)"
OUTPUT_Bibata_Ghost=${OUTPUT_Bibata_Ghost// /_}
OUTPUT_Bibata_Spirit="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Spirit)"
OUTPUT_Bibata_Spirit=${OUTPUT_Bibata_Spirit// /_}
OUTPUT_Bibata_Tinted="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Tinted)"
OUTPUT_Bibata_Tinted=${OUTPUT_Bibata_Tinted// /_}


mkdir -p "$DIR11X_Bibata_Ghost" "$DIR10X_Bibata_Ghost" "$DIR9X_Bibata_Ghost" "$DIR8X_Bibata_Ghost" "$DIR7X_Bibata_Ghost" "$DIR6X_Bibata_Ghost" "$DIR5X_Bibata_Ghost" "$DIR4X_Bibata_Ghost" "$DIR3X_Bibata_Ghost" "$DIR2X_Bibata_Ghost" "$DIR1X_Bibata_Ghost"

mkdir -p "$DIR11X_Bibata_Spirit" "$DIR10X_Bibata_Spirit" "$DIR9X_Bibata_Spirit" "$DIR8X_Bibata_Spirit" "$DIR7X_Bibata_Spirit" "$DIR6X_Bibata_Spirit" "$DIR5X_Bibata_Spirit" "$DIR4X_Bibata_Spirit" "$DIR3X_Bibata_Spirit" "$DIR2X_Bibata_Spirit" "$DIR1X_Bibata_Spirit"

mkdir -p "$DIR11X_Bibata_Tinted" "$DIR10X_Bibata_Tinted" "$DIR9X_Bibata_Tinted" "$DIR8X_Bibata_Tinted" "$DIR7X_Bibata_Tinted" "$DIR6X_Bibata_Tinted" "$DIR5X_Bibata_Tinted" "$DIR4X_Bibata_Tinted" "$DIR3X_Bibata_Tinted" "$DIR2X_Bibata_Tinted" "$DIR1X_Bibata_Tinted"


mkdir -p "$OUTPUT_Bibata_Ghost/cursors"
mkdir -p "$OUTPUT_Bibata_Spirit/cursors"
mkdir -p "$OUTPUT_Bibata_Tinted/cursors"
echo 'Making Folders... DONE';

rm -f cmd.txt
touch cmd.txt

for FOLDER in 'Bibata_Ghost' 'Bibata_Spirit' 'Bibata_Tinted'; do
	for FILE in src/$FOLDER/svgs/*.svg; do
		[ -e $FILE ] || continue
		FILENAME=${FILE##*/}
		FILENAME=${FILENAME%.*}
		echo "file-open:src/$FOLDER/svgs/$FILENAME.svg;" >> cmd.txt
		for RES in 24 28 32 40 48 56 64 72 80 88 96; do
			echo "export-height:$RES;export-width:$RES;export-filename:build/$FOLDER/""$RES""x$RES/$FILENAME.png;export-do;" >> cmd.txt
		done
	done
done

inkscape --shell < cmd.txt

echo -ne "Generating cursor theme...\\r"
for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    ERR="$( xcursorgen -p build/Bibata_Ghost "$CUR" "$OUTPUT_Bibata_Ghost/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
        echo "FAIL: $CUR $ERR"
    fi

    ERR="$( xcursorgen -p build/Bibata_Spirit "$CUR" "$OUTPUT_Bibata_Spirit/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
        echo "FAIL: $CUR $ERR"
    fi

    ERR="$( xcursorgen -p build/Bibata_Tinted "$CUR" "$OUTPUT_Bibata_Tinted/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
        echo "FAIL: $CUR $ERR"
    fi

done
echo -e "Generating cursor theme... DONE"


echo -ne "Generating shortcuts...\\r"
while read -r ALIAS ; do
    FROM=${ALIAS% *}
    TO=${ALIAS#* }

    if [ -e "$OUTPUT_Bibata_Ghost/cursors/$FROM" ] ; then
        continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Ghost/cursors/$FROM"

    if [ -e "$OUTPUT_Bibata_Spirit/cursors/$FROM" ] ; then
        continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Spirit/cursors/$FROM"

    if [ -e "$OUTPUT_Bibata_Tinted/cursors/$FROM" ] ; then
        continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Tinted/cursors/$FROM"

done < $ALIASES
echo -e "\033[0KGenerating shortcuts... DONE"


echo -ne "Copying Theme Index...\\r"

    if ! [ -e "$OUTPUT_Bibata_Ghost/$INDEX_Bibata_Ghost" ] ; then
        cp $INDEX_Bibata_Ghost "$OUTPUT_Bibata_Ghost/cursor.theme"
        cp $INDEX1_Bibata_Ghost "$OUTPUT_Bibata_Ghost/index.theme"
    fi

    if ! [ -e "$OUTPUT_Bibata_Spirit/$INDEX_Bibata_Spirit" ] ; then
        cp $INDEX_Bibata_Spirit "$OUTPUT_Bibata_Spirit/cursor.theme"
        cp $INDEX1_Bibata_Spirit "$OUTPUT_Bibata_Spirit/index.theme"
    fi
    if ! [ -e "$OUTPUT_Bibata_Tinted/$INDEX_Bibata_Tinted" ] ; then
        cp $INDEX_Bibata_Tinted "$OUTPUT_Bibata_Tinted/cursor.theme"
        cp $INDEX1_Bibata_Tinted "$OUTPUT_Bibata_Tinted/index.theme"
    fi
echo -e "\033[0KCopying Theme Index... DONE"


echo -ne "Generating Installer...\\r"
    if ! [ -e "$OUTPUT_Bibata_Ghost/$INDEX_Bibata_Ghost" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        cp src/in.inst Installer_Bibata.sh
    fi
echo -e "\033[0KGenerating Installer... DONE"

echo -ne "Making Installer Executable...\\r"
    if ! [ -e "$OUTPUT_Bibata_Ghost/$INDEX_Bibata_Ghost" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        gksu chmod +x Installer_Bibata.sh
    fi

show_Msg() {
  echo -e "\033[1;34m$@\033[0m"
}
show_command() {
  echo -e "\033[1;93m$@\033[0m"
}

echo -e "\033[0KMaking Installer Executable... DONE"

show_Msg "For Installation Use Following Command:\n\n"
show_command "\t sudo ./Installer_Bibata.sh\n"
exit

echo "COMPLETE!"

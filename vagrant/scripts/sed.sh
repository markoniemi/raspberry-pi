# set_property <file> <property> <value>
# http://stackoverflow.com/questions/9368262/using-sed-to-update-a-property-in-a-java-properties-file
set_property() {
	replaceString=$3
	sed -i "s/\($2=\).*\$/\1${replaceString}/" $1
	sed -i "s/\($2 =\).*\$/\1${replaceString}/" $1
}

set_json_property() {
	#TODO replace " in findString and replace with \\"
	findString=$2
	#line=$(sed -n '2p' myfile)
	#echo "$line
	replaceString=$3
	sed -i "s/\($2:\).*\$/\1${replaceString}/" $1
	sed -i "s/\($2 :\).*\$/\1${replaceString}/" $1
	sed -i "s/\(\"$2\":\).*\$/\1${replaceString}/" $1
	sed -i "s/\(\"$2\" :\).*\$/\1${replaceString}/" $1
}
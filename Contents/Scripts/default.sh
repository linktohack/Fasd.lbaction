#!/bin/bash
export PATH=/usr/local/bin:$PATH
LIST=$(fasd -sR "$@")

echo "<items>"
echo "$LIST" | perl -ne '
	chomp;
	my ($score, $path) = split / {4,}/;
	print "<item>";
	print 	"<action>open.sh</action>";
	print 	"<actionArgument>$path</actionArgument>";
	print 	"<title>$path</title>";
	print 	"<path>$path</path>";
	print 	"<badge>$score</badge>";
	print "</item>";'
echo "</items>"

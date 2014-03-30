-- Opens the currently selected Finder files, or else the current Finder window, in Sublime Text. Also handles dropped files and folders.

-- Original (for TextMate) by Henrik Nyh <http://henrik.nyh.se>
-- Adapted to BBEdit by Dr. Drang <http://leancrew.com>
-- Based loosely on http://snippets.dzone.com/posts/show/1037
-- Adapted once again by Pirijan Ketheswaran <http://pketh.org>

-- script was clicked
on run
	activate application "System Events"
	activate application "Finder"
	tell application "Finder"
		if selection is {} then
			set finderSelection to folder of the front window as string
		else
			set finderSelection to selection as alias list
		end if
	end tell
	
	subl(finderSelection)
end run

-- script was drag-and-dropped onto
on open (theList)
	subl(theList)
end open

-- open in Sublime Text
on subl(listOfAliases)
	tell application "Sublime Text"
		open listOfAliases
		activate
	end tell
end subl

set hostnames to {"hostname1", "hostname2", "hostname3", "hostname4"}

-- launch "iTerm"

tell application "iTerm"
    activate

    -- ssh in split panes to my queue processor hosts
    set myterm to create window with default profile
    tell myterm

        tell application "System Events" to keystroke "D" using {command down, shift down}
        tell application "System Events" to keystroke "[" using command down

        set num_hosts to count of hostnames
        repeat with n from 1 to num_hosts
            if n - 1 is num_hosts / 2 then
                tell application "System Events" to keystroke "]" using command down
            else if n > 1 then
                tell application "System Events" to keystroke "d" using command down
            end if
            delay 0.5
            tell the current session to write text "ssh " & (item n of hostnames)
        end repeat

        tell application "System Events" to keystroke (key code 36 using command down)
        -- tell application "System Events" to keystroke "i" using {command down, option down}

    end tell

end tell

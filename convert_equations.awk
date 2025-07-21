#!/usr/bin/awk -f

{
    # Store the original line
    line = $0

    # Step 1: Temporarily replace all occurrences of '$$' with a unique placeholder
    # that does NOT contain '$' characters.
    gsub("\\$\\$", "__DISPLAY_EQ_PLACEHOLDER__", line)

    # Step 2: Process the line to replace single '$' with '\\(' and '\\)'.
    # We iterate character by character and use a flag to track if we are inside an equation.
    new_line = ""
    in_equation = 0
    for (i = 1; i <= length(line); i++) {
        char = substr(line, i, 1)
        if (char == "$") {
            if (in_equation == 0) {
                new_line = new_line "\\\\(" # Replace opening $ with \\(
                in_equation = 1
            } else {
                new_line = new_line "\\\\)" # Replace closing $ with \\)
                in_equation = 0
            }
        } else {
            new_line = new_line char # Append other characters as is
        }
    }

    # Step 3: Restore the '$$' from the unique placeholder.
    gsub("__DISPLAY_EQ_PLACEHOLDER__", "\\$\\$", new_line)

    # Print the modified line
    print new_line
}
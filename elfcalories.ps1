# Advent of Code Day 1 Puzzle 1 & Puzzle 2
# Puzzle 1, get the highest single value
# Puzzle 2, get the top 3 values and add them up
# Outputs to terminal
# VARIABLES
$elfCalories = Get-Content "<PATH_TO_INPUT>\elfcalories_input.txt"
$elfTemporaryList = [System.Collections.ArrayList]@()
$elfTotals = [System.Collections.ArrayList]@()
# BEGIN
foreach ($line in $elfCalories){
    if ($line){
        # if the line isn't blank...
        $numLine = [int]$line # convert line from string to int
        $elfTemporaryList.Add($numLine) | Out-Null # put line into a temporary arraylist object
    } else {
        # if the line is blank...
        $elfSwap = ($elfTemporaryList | Measure-Object -sum ).sum # add up the stuff in the temp list and store it in a swap variable
        $elfTotals.Add($elfSwap) | Out-Null  # add that number to $elfTotals as a single entry
        $elfTemporaryList = [System.Collections.ArrayList]@() # reset the temporarly list
        $elfSwap = $null # clear the swap variable
    }
}
$elfSwap = ($elfTemporaryList | Measure-Object -sum ).sum # catching the last line
$elfTotals.Add($elfSwap) | Out-Null # add the last line
$elfTotals = $elfTotals | Sort-Object -Descending
$elfSnacks = $elftotals[0] + $elftotals[1] + $elftotals[2]
Write-Host "Fattest Elf, Total Calories:" $elftotals[0]
Write-Host "Top 3, Total Calories:" $elfSnacks
# END
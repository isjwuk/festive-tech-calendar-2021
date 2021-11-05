# Resource Lock Automation Samples
# Used in FestiveTechCalendar 2021 presentation- Locking Around the Christmas Tree
# Chris Bradshaw
#
# See https://isjw.uk/ftc2021
#

# Let's imagine we've decided to apply a DoNotDelete Resource Lock to our Resource Groups 
# marked as production and want to schedule a weekly check to make sure locks are still present.

#First step is to check whether the resource Group Has a Lock
#We get the resource group
$ResourceGroup = Get-AzResourceGroup -Name "festive-tech-calendar-2021-rsg"
#Then we can retrieve any attached locks
$lock=Get-AZresourceLock -ResourceGroupName $ResourceGroup.ResourceGroupName | `
  Where-Object {$_.ResourceType -eq "Microsoft.Authorization/locks"}
#And then use an if statement to determine if a lock was missing, for example
if (!($lock)) {"Lock is missing, reindeer may be removed"}

#This is great, but before we just slap the lock back on, lets check if someone has recently removed the lock to do some work.
#We can do this for looking in the Activity log for this Resource Group- lets look for something in the last 3 days
$DaysAgo=3
#And we can collect the log entries using "Get-AzActivityLog", and we're looking for a lock deletion in the message.
  $LogEntry=Get-AzActivityLog -ResourceGroupName $ResourceGroup.ResourceGroupName `
      -StartTime (get-date).AddDays(-$DaysAgo)  -WarningAction SilentlyContinue |
    Where-Object {$_.Properties.Content["message"] -eq "Microsoft.Authorization/locks/delete" `
                -and !($_.ResourceType) } | 
    Sort-Object -Property EventTimestamp -Bottom 1
#This result can be used in an if statement again- we want to check that no locks were removed in the past three days
if (($LogEntry)) {"Lock has been removed in the past 3 days"}`
            else{"Lock has NOT been removed in the past 3 days"}

#Finally, lets bring this together. If the ResourceGroup is Unlocked, and a lock has not been removed in the past 3 days, 
#then let's apply a new DoNotDelete lock, along with a comment to note how it was created.

New-AzResourceLock -LockName "DoNotDelete" `
    -LockLevel CanNotDelete `
    -LockNotes "Automatically Applied to Protect Reindeer" `
    -ResourceGroupName $ResourceGroup.ResourceGroupName `
    -Force

#This PowerShell could then be used in an automation script to run scheduled checks of the Locks.
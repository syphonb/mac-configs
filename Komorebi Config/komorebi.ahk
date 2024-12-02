#Requires AutoHotkey v2.0

RAlt::LWin
LWin::RAlt

; Move the current window to a specific workspace
#^1::MoveToWorkspace(1)
#^2::MoveToWorkspace(2)
#^3::MoveToWorkspace(3)
#^4::MoveToWorkspace(4)
#^5::MoveToWorkspace(5)

MoveToWorkspace(workspaceNumber) {
    Run 'komorebic.exe focus-workspace %workspaceNumber%'
}
return
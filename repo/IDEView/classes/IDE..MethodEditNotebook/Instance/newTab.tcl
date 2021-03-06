IDE::MethodEditNotebook instproc newTab {{title {}}} {
    my instvar win methodEditTabIds methodEditObjects freeid
    set index $freeid
    incr freeid
    set meditWin $win.methodedit$index
    set currentEdit [IDE::TclModeEditTab new -childof [my info parent] $meditWin -notifyEdited 1 -masterView [my info parent]]
    if {$title eq ""} {
        set title new
    }
    $win add $meditWin -text $title
    $win select $meditWin
    set methodEditTabIds($currentEdit) $meditWin
    set methodEditObjects($meditWin) $currentEdit

    set pwin [$currentEdit popMenuWindow]
    bind $pwin <ButtonPress-3> [list [self]::@editms showPopMenu $win.epopdown %X %Y]
    return $currentEdit
}

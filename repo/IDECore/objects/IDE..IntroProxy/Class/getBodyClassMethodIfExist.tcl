IDE::IntroProxy proc getBodyClassMethodIfExist {obj p} {
    if {![Object isobject $obj] ||
         [$obj info procs $p] eq ""} return
    my getBodyClassMethod $obj $p
}

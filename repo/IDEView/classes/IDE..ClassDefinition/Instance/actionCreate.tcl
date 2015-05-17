IDE::ClassDefinition instproc actionCreate {} {
    my instvar classView mode className introProxy compObj
    if {[my checkClassView]} {
        if {$mode eq "redefine"} {
            set parameter [my getParameter]
            set superclass [my @superclass getList]
            $introProxy redefineClass $className $superclass $parameter
        } else {
            if {[set def [my getClassDefinition]] eq ""} return
            $classView editSave $def [list $className [$introProxy getMethodTypePrefix]Def [$compObj getName]]
        }
    }
    my destroy
}

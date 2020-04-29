
## Usage:
##   source dcdtopdb.tcl
##   dcdtopdb top /tmp/myworkarea

proc dcdtopdb { whichmol workdir } {
set numframes [molinfo $whichmol get numframes]
for {set i 0} {$i < $numframes} {incr i} {
  set prot [atomselect top "all" frame $i]	
  set filename [format "%s/split%06d.pdb" $workdir $i] 
  $prot writepdb $filename
  $prot delete
  }
}

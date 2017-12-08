set projDir "C:/Users/Henry Lee/Desktop/LetsGame/work/planAhead"
set projName "LetsGame"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/mojo_top_0.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/logic_1.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/display_2.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/display_digits_3.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/reset_conditioner_4.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/button_conditioner_5.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/button_conditioner_5.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/button_conditioner_5.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/button_conditioner_5.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/button_conditioner_5.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/button_conditioner_5.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/edge_detector_11.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/edge_detector_11.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/edge_detector_11.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/edge_detector_11.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/edge_detector_11.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/edge_detector_11.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/pointonecounter_17.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/select_18.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/select_19.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/map_20.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/numbers_21.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/aluCompute_22.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/animation_23.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/counter_24.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/counter_25.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/bin_to_dec_26.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/bin_to_dec_27.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/seven_seg_28.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/seven_seg_28.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/seven_seg_28.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/pipeline_31.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/pipeline_31.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/pipeline_31.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/pipeline_31.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/pipeline_31.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/pipeline_31.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/counter_37.v" "C:/Users/Henry Lee/Desktop/LetsGame/work/verilog/counter_38.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/Henry\ Lee/Desktop/LetsGame/constraint/myconstraint.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1

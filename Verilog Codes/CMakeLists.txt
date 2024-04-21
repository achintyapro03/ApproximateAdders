cmake_minimum_required(VERSION 3.10)

project(VerilogProject)

set(AllAdderCompFiles
    exe/runAllAdder
    src/tb.v
    src/andOr.v
    src/orAnd.v
    src/gates.v
    src/FA.v
    src/HybridAdder.v
    src/nbitrca.v
    src/nBitRcpa1.v
    src/nBitRcpa2.v
    src/nBitRcpa3.v
    src/rcpfa1.v
    src/rcpfa2.v
    src/rcpfa3.v
)

set(HybridAdderFiles
    exe/runHybrid
    src/testbenchhybridfa.v
    src/andOr.v
    src/orAnd.v
    src/gates.v
    src/FA.v
    src/HybridAdder.v
    src/nbitrca.v
    src/nBitRcpa1.v
    src/nBitRcpa2.v
    src/nBitRcpa3.v
    src/rcpfa1.v
    src/rcpfa2.v
    src/rcpfa3.v
)

set(RippleCarryFiles
    exe/runrca
    src/testbenchrca.v
    src/andOr.v
    src/orAnd.v
    src/gates.v
    src/FA.v
    src/HybridAdder.v
    src/nbitrca.v
    src/nBitRcpa1.v
    src/nBitRcpa2.v
    src/nBitRcpa3.v
    src/rcpfa1.v
    src/rcpfa2.v
    src/rcpfa3.v
)

set(DCTFiles
    exe/runDct
    src/mainTb.v
    src/andOr.v
    src/orAnd.v
    src/gates.v
    src/FA.v
    src/HybridAdder.v
    src/nbitrca.v
    src/nBitRcpa1.v
    src/nBitRcpa2.v
    src/nBitRcpa3.v
    src/rcpfa1.v
    src/rcpfa2.v
    src/rcpfa3.v
    src/dct1d.v
    src/dct2d.v
    src/TrasnposeMatrix.v
)


set(DCT1dFiles
    exe/runDct1d
    src/testbenchDCT1d.v
    src/andOr.v
    src/orAnd.v
    src/gates.v
    src/FA.v
    src/HybridAdder.v
    src/nbitrca.v
    src/nBitRcpa1.v
    src/nBitRcpa2.v
    src/nBitRcpa3.v
    src/rcpfa1.v
    src/rcpfa2.v
    src/rcpfa3.v
    src/dct1d.v
)
#############################################################
 add_custom_target(
     compile_verilog1 ALL
     COMMAND iverilog -o  ${AllAdderCompFiles}
     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
     COMMENT "Compiling Verilog files 1 with Icarus Verilog"
 )

#add_custom_target(
#    run_simulation1 ALL
#    COMMAND vvp exe/runAllAdder
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    COMMENT "Running simulation 1 with VVP"
#    DEPENDS compile_verilog1
# )
# #############################################################
# add_custom_target(
#     compile_verilog2 ALL
#     COMMAND iverilog -o ${HybridAdderFiles}
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Compiling Verilog files 2 with Icarus Verilog"
# )

# add_custom_target(
#     run_simulation2 ALL
#     COMMAND vvp exe/runHybrid
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Running simulation 2 with VVP"
#     DEPENDS compile_verilog2
# )
#############################################################

# add_custom_target(
#     compile_verilog3 ALL
#     COMMAND iverilog -o ${RippleCarryFiles}
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Compiling Verilog files 3 with Icarus Verilog"
# )

# add_custom_target(
#     run_simulation3 ALL
#     COMMAND vvp exe/runrca
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Running simulation 3 with VVP"
#     DEPENDS compile_verilog3
# )
##############################################################

#add_custom_target(
#    compile_verilog4 ALL
#    COMMAND iverilog -o ${DCTFiles}
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    COMMENT "Compiling Verilog files 4 with Icarus Verilog"
#)

#add_custom_target(
#    run_simulation4 ALL
#    COMMAND vvp exe/runDct
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    COMMENT "Running simulation 4 with VVP"
#    DEPENDS compile_verilog4
#)
##############################################################

# add_custom_target(
#     compile_verilog5 ALL
#     COMMAND iverilog -o ${DCT1dFiles}
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Compiling Verilog files 5 with Icarus Verilog"
# )

# add_custom_target(
#     run_simulation5 ALL
#     COMMAND vvp exe/runDct1d
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Running simulation 5 with VVP"
#     DEPENDS compile_verilog5
# )
##############################################################
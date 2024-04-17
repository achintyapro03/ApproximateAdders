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

add_custom_target(
    compile_verilog1 ALL
    COMMAND iverilog -o  ${AllAdderCompFiles}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Compiling Verilog files 1 with Icarus Verilog"
)

add_custom_target(
    compile_verilog2 ALL
    COMMAND iverilog -o ${HybridAdderFiles}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Compiling Verilog files 2 with Icarus Verilog"
)

add_custom_target(
    compile_verilog3 ALL
    COMMAND iverilog -o ${RippleCarryFiles}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Compiling Verilog files 3 with Icarus Verilog"
)


# add_custom_target(
#     run_simulation
#     COMMAND vvp ${OUTPUT_FILE}
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Running simulation with VVP"
#     DEPENDS compile_verilog1
# )

# add_custom_target(
#     run_simulation
#     COMMAND vvp ${OUTPUT_FILE}
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Running simulation with VVP"
#     DEPENDS compile_verilog1
# )

# add_custom_target(
#     run_simulation
#     COMMAND vvp ${OUTPUT_FILE}
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     COMMENT "Running simulation with VVP"
#     DEPENDS compile_verilog1
# )

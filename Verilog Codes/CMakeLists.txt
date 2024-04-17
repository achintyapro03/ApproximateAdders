cmake_minimum_required(VERSION 3.10)

project(VerilogProject)

set(AllAdderCompFiles
    runAllAdder
    tb.v
    andOr.v
    orAnd.v
    gates.v
    FA.v
    HybridAdder.v
    nbitrca.v
    nBitRcpa1.v
    nBitRcpa2.v
    nBitRcpa3.v
    rcpfa1.v
    rcpfa2.v
    rcpfa3.v
)

set(HybridAdderFiles
    runHybrid
    testbenchhybridfa.v
    andOr.v
    orAnd.v
    gates.v
    FA.v
    HybridAdder.v
    nbitrca.v
    nBitRcpa1.v
    nBitRcpa2.v
    nBitRcpa3.v
    rcpfa1.v
    rcpfa2.v
    rcpfa3.v
)

set(RippleCarryFiles
    runrca
    testbenchrca.v
    andOr.v
    orAnd.v
    gates.v
    FA.v
    HybridAdder.v
    nbitrca.v
    nBitRcpa1.v
    nBitRcpa2.v
    nBitRcpa3.v
    rcpfa1.v
    rcpfa2.v
    rcpfa3.v
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

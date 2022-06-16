
module LCDBusDriver(
    output [3:0] busData,
    input [3:0] driveData,
    inout [3:0] bus,
    input drive);

    assign bus = drive ? driveData : {(3){1'bz}};
    assign busData = bus;
endmodule

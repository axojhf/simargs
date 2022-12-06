const std = @import("std");
const argsParser = @import("struct-args.zig");

const CliOption = struct {
    help: ?i64,
    version: ?bool,
    action: []const u8,
    age: ?f64,

    // const __shorts__ = .{
    //     .help = .h,
    //     .version = .v,
    // };

    // const __messages__ = .{
    //     .help = "show help",
    // };

};

pub const log_level: std.log.Level = .debug;

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var opt = try argsParser.parse(allocator, CliOption);
    defer opt.deinit();

    std.log.info("opt is [{s}]", .{opt.args.action});
}

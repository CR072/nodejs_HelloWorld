const std = @import("std");

pub fn main() !void {
    var stdout = std.io.getStdOut().writer();
    const target = "hello world";
    var index: usize = 0;
    var pointer: usize = 0;
    var ans = std.ArrayList(u8).init(std.heap.page_allocator);
    defer ans.deinit();
    const chars = "abcdefghijklmnopqrstuvwxyz";

    while (true) {
        const cur = chars[index];
        index += 1;

        if (target[pointer] == ' ') {
            pointer += 1;
            try ans.append(' ');
        }

        if (cur == target[pointer]) {
            try ans.append(cur);
            pointer += 1;
        }

        var to_log = try std.ArrayList(u8).init(std.heap.page_allocator);
        defer to_log.deinit();
        try to_log.appendSlice(ans.items);
        try to_log.append(cur);

        if (to_log.items.len >= 2 and to_log.items[to_log.items.len - 2] == 'd' and to_log.items[to_log.items.len - 1] == 'd') {
            _ = to_log.pop();
        }

        try stdout.print("{s}\n", .{to_log.items});

        if (std.mem.eql(u8, ans.items, target[0..ans.items.len])) {
            try stdout.print("Successfully logged Hello World!\n", .{});
            break;
        }

        if (index >= 26) index = 0;
    }
}
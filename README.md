# How to use

Add following to build.zig.zon (Hash will change, in order to get the correct hash remove the hash section and build the project, you should get the correct hash)

```zig
.dependencies = .{
    .ZigFiber = .{ .url = "https://github.com/KcanCurly/ZigFiber/archive/refs/tags/X.X.X.zip", .hash = "zigfiber-A.B.C-HASH" },
    }
```

Add following to build.zig

```zig
const fiber_dep = b.dependency("ZigFiber", .{ .target = target, .optimize = optimize }); \
const fiber_mod = fiber_dep.module("ZigFiber"); \
exe_mod.addImport("zigfiber", fiber_mod); 
```

Add following to main.zig

```zig
const fiber = @import("zigfiber");

var pAddress: ?*anyopaque = null;
... (set your payload to pAddress here)
try fiber.runFiber(pAddress.?, true);
```

# Credits
[Maldev Academy](https://maldevacademy.com/)
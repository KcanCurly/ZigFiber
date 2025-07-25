# How to use

Add following to build.zig.zon (Hash will change, in order to get the correct hash remove the hash section and build the project, you should get the correct hash)

```zig
.dependencies = .{
    .ZigFiber = .{ .url = "https://github.com/KcanCurly/zigfiber/archive/refs/tags/v0.0.1-alpha.zip", .hash = "zigfiber-0.0.1-X" },
    }
```

Add following to build.zig

```zig
const fiber_dep = b.dependency("ZigFiber", .{ .target = target, .optimize = optimize }); \
const fiber_mod = hellshall_dep.module("ZigFiber"); \
exe_mod.addImport("fiber", fiber_mod); 
```

Add following to main.zig

```zig
runFiber(pAddress, false);
```

# Credits
[Maldev Academy](https://maldevacademy.com/)
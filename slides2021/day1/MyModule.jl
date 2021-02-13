module MyModule
    export f

    g() = "Internal function"
    f() = println(g())
end

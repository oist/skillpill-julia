mutable struct Lorentz
    σ::Float64
    ρ::Float64
    β::Float64
    x::Float64
    y::Float64
    z::Float64
end

function step!(l::Lorentz, dt::Float64)
    dx = l.σ*(l.y - l.x)
    dy = l.x*(l.ρ - l.z) - l.y
    dz = l.x*l.y - l.β*l.z
    l.x += dt*dx
    l.y += dt*dy
    l.z += dt*dz
end

attractor = Lorentz(10.0,28.0,8/3,1,1,1)

using Plots

default(legendfontsize=16, dpi=150)
fig = plot3d(1,xlim=(-20.0,20.0),ylim=(-20.0,20.0),zlim=(0,50.0),
            title="Now this is the nice Lorentz",color="purple",
            marker=2,linestyle=:dot,linewidth=0.5,markerstrokewidth=0.0,
            legend=false)

@gif for i = 1:1500
    step!(attractor,0.01)
    push!(fig,attractor.x,attractor.y,attractor.z)
end every 10

Mix.install([
  {:nx, path: "../nx"},
  {:exla, path: "../exla"},
  {:torchx, path: "../torchx"},
  {:candlex, path: "../candlex" },
])

defmodule NxDebug do
  def run(backend) do
    Nx.default_backend(backend)
    t = Nx.iota({10, 20}, type: :f32)

    start = :os.system_time(:millisecond)
    IO.inspect("[#{inspect(backend)}] Starting...")

    for _i <- 0..10_000 do
      t
      |> Nx.multiply(t)
      |> Nx.sigmoid()
      |> Nx.rsqrt()
      |> Nx.atan()
      |> Nx.acos()
      |> Nx.cbrt()
      |> Nx.ceil()
      |> Nx.asin()
      |> Nx.cos()
      |> Nx.erf_inv()
      |> Nx.exp()
      |> Nx.log()
      |> Nx.log1p()
      |> Nx.negate()
      |> Nx.sin()
      |> Nx.tan()
      |> Nx.tanh()
      |> Nx.abs()
      |> Nx.sqrt()
      |> Nx.is_infinity()
      |> Nx.as_type({:s, 64})
      |> Nx.bitwise_not()
      |> Nx.floor()
      |> Nx.round()
    end


    ms = :os.system_time(:millisecond) - start
    IO.inspect("[#{inspect(backend)}] Took #{ms} ms.")
  end
end

NxDebug.run(Nx.BinaryBackend)
NxDebug.run(EXLA.Backend)
NxDebug.run(Torchx.Backend)
NxDebug.run(Candlex.Backend)

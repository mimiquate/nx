mod error;
mod tensors;

use rustler::{Env, Term};
use tensors::TensorRef;

fn load(env: Env, _info: Term) -> bool {
    rustler::resource!(TensorRef, env);
    true
}

rustler::init! {
    "Elixir.Candlex.Native",
    [
        tensors::from_binary,
        tensors::to_binary
    ],
    load = load
}

import argv
import gleam/io
import gleam/string.{uppercase}
import glint

fn caps_flag() -> glint.Flag(Bool) {
  glint.bool_flag("caps")
  |> glint.flag_default(False)
  |> glint.flag_help("Capitalize the hello message")
}

fn hello() -> glint.Command(Nil) {
  use <- glint.command_help("Prints Hello, <NAME>!")
  use caps <- glint.flag(caps_flag())
  use _, args, flags <- glint.command()
  let assert Ok(caps) = caps(flags)
  let name = case args {
    [] -> "Joe"
    [name, ..] -> name
  }
  let msg = "Hello, " <> name <> "!"
  case caps {
    True -> uppercase(msg)
    False -> msg
  }
  |> io.println
}

pub fn main() {
  glint.new()
  |> glint.with_name("glssh")
  |> glint.pretty_help(glint.default_pretty_help())
  |> glint.add(at: [], do: hello())
  |> glint.run(argv.load().arguments)
}

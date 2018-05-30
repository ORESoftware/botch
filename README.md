

# Botch

>>> Create local development environments for each NPM project on your filesystem.

### Installation

There are two different avenues.

1. Just use your own shell script in each project.

```bash
  npm install -g botch
```

then use this in .bash_profile/.bashrc:

```bash
export botch_shell_file_name="xxx.sh";
```

__**What this means:**__ _when you open a terminal, botch will attempt to source <br>
a shell script named `xxx.sh`, from the present working directory._

<p>
<p>

2. To use botch default behavior for a project. This is recommended.

Simply install it to every project you want to use it with.

```bash
  npm install -D botch
```

<p>

__**What this means:**__ _Botch will do the same thing as above, if the `$botch_shell_file_name` env is set.
But it will also pick up the `./node_modules/botch/bin.sh` file and run that for your project.
Primarily this modifies the $PATH to include the executables in ./node_modules/.bin.
This gives your local NPM executables *precendece*, since it prepends `./node_modules/.bin` to $PATH._

<p>
<p>

## Regardless of which method you use, make sure you add this to your .bash_profile/.bashrc files:

```bash
. "$HOME/.botch/shell.sh"      # always source this file
. "$HOME/.botch/overrides.sh"  # source this if you want to invoke botch when changing directories
```

The shell scripts will be available regardless of whether you install locally or globally. <br>
Just source them.




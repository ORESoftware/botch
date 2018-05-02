

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

<i> 
What this means: when you open a terminal, botch will attempt to source <br>
a shell script named `xxx.sh`, from the present working directory.
</i>


2. To use botch default behavior for a project. This is recommended.

Simply install it to every project you want to use it with.

```bash
  npm install -S botch
```

<i> 
What this means: Botch will do the same thing as above, if the $botch_shell_file_name env is set.
But it will also pick up the `./node_modules/botch/bin.sh` file and run that for your project.
Primarily this modifies (prepends) the $PATH to include the executables in ./node_modules/.bin.
This gives your local NPM executables *precendece*.
</i>


## Regardless of which method you use, make sure you add this to your .bash_profile/.bashrc files:

```bash
. "$HOME/.botch/shell.sh"      # always source this file
. "$HOME/.botch/overrides.sh"  # source this if you want to invoke botch when changing directories
```





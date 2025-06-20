# Shell Script Library
Something that has always annoyed me about programming is environment set up and dependency management.
"You need the latest version of this language",
"you have to use a dangerously outdated version of this dependency because nothing else works",
"they changed the way that function works between python 2 and 3", etc.

This repository has 3 main goals

1. Create a library of scripts that can be used just about anywhere.
One day I heard someone say "there's nothing special about a `server`. It's just a computer in another room, and it's probably running some kind of linux".
Eventually I would have the idea to pursue shell scripting as a form of "universal language" that could be run on any system with almost no configuration needed.
Even on systems that don't use bash as the default shell, scripts can be prefaced with `#!` to specify exactly what flavor of shell they should be run with.
2. Create building blocks. I think something that hurts a lot of programs these days is they try to anticipate everything you need.
To pick on SpringBoot for a moment, it's a massive pile of dependencies and functionality that probably 90% of people never use. One time I had to do vulnerability mitigation for a project, and probably 90% of the vulnerabilities were caused by SpringBoot sub dependencies.
Of those, around half of the vulnerabilities I was able to mitigate by just excluding them from the SpringBoot dependency.
At the time I kept thinking "it'd be nice if I could just have something like `spring lite` and then add what I need piecemeal."
3. Simplify shell syntax. While all programming languages have their various syntaxes and nuances that you have to learn, shell scripting has the additional complication that it came from a time
when ever little bit of space mattered. The command `mkdir` looks obtuse at first, until you learn that it's short for `make directory` (at least that's what I've always called it).
There are a vast number of things that are incredibly easy to do in shell, but the syntax takes time to learn and internalize. I want this library to be very beginner-friendly for people less experienced in shell, but
without hurting their ability to learn when they're ready. So using the example above, if someone goes "how do I make a directory", they'll be able to see "oh there's a make_directory.sh script I can run". 
Then later they can say "ok how does this actually work", and be able to see what the script does for them.

# Scripting Notes
Noting some of the small nuances that I've had to pick up learning shell syntax. This way I don't have to leave the same comments in just about every file.
- `$0` script name, `$1`, `$2`, ... `$x` command line arguments
- wrap an expression in `$( ... )` to capture the output in a variable

# Syntax Notes
Since shell scripts support about 100 different ways to do everything, I wanted to list some of the conventions that I'm trying to stick to for consistency.
- using `#!/bin/bash` for a balance between portability and user-friendly commands.
- `"${variable_name}"` when referencing variables
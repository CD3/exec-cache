# exec-cache

Cache the affects of an executable.

# Description

`exec-cache` is a script that will run an executable and cache its effects (stdout, stderr,
exit code, and any files created in the current working directory). It is useful for testing
code that depends on commands or executables that take a long time to run.

For example, say you are developing a post-processing script that will run a physics simulation
and then process its output files. If the simulation takes a significant amount of time, then
it is not practical to test the script directly. Instead, you would probably comment out
the code that runs the simulation until you were done testing the script, then uncomment
and retest the script. With `exec-cache`, you can test the post-processing script without
uncommenting the code that runs the simulation.

`exec-cache` is based on a script written by Patrick Brisbin in a blog post on how to mock
bash commands for unit testing (https://pbrisbin.com/posts/mocking_bash/). 

# Examples

## Basic Usage

To use `exec-cache`, you simply run the `exec-cache-setup` script and then use the `exec-cache-wrap` script to create wrappers for
the commands you want to cache. For example, if the `date` command is cached, it will return the same date after its first invocation.

```bash
$ cd testing
$ exec-cache-setup
To complete setup, add /home/user/project/testing/exec-cache.d/bin to your PATH.

You can either do:

    $ export PATH=/home/user/project/testing/exec-cache.d/bin:${PATH}

or just source the 'exec-cache-setup-env' file in /home/user/project/testing/exec-cache.d:

    $ source /home/user/project/testing/exec-cache.d/exec-cache-setup-env
$ ls
exec-cache.d
$ source exec-cache.d/exec-cache-setup-env
$ date
Sun Apr  2 14:50:24 CDT 2017
$ sleep 2
$ date
Sun Apr  2 14:50:29 CDT 2017
$ which date
/bin/date
$ exec-cache-wrap date
Please update your shells PATH hash table by running

    $ hash -r

$ hash -r
$ which date
/home/user/project/testing/exec-cache.d/bin/date
$ date
Sun Apr  2 14:50:39 CDT 2017
$ sleep 2
$ date
Sun Apr  2 14:50:39 CDT 2017
$ 

```

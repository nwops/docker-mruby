# docker-mruby

Docker image for mruby :whale:

## Usage

```
$ docker pull tsub/mruby

# Run mirb
$ docker run -it tsub/mruby mirb
mirb - Embeddable Interactive Ruby Shell

> puts 'Hello, world!'
Hello, world!
 => nil

# Run mruby with `.rb` file
$ cat <<EOF >> hello.rb
puts 'Hello, world'
EOF
$ docker run -it -v $PWD:$PWD -w $PWD tsub/mruby hello.rb
Hello, world
```

## Install with [Whalebrew](https://github.com/bfirsh/whalebrew)

```
$ whalebrew install tsub/mruby

# Run mirb
$ mruby mirb
mirb - Embeddable Interactive Ruby Shell

> puts 'Hello, world!'
Hello, world!
 => nil

# Run mruby with `.rb` file
$ cat <<EOF >> hello.rb
puts 'Hello, world'
EOF
$ mruby hello.rb
Hello, world
```

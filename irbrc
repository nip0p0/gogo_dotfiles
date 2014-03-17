# load libraries
require 'irb/completion'
require 'wirble'
require 'pp'
require 'readline'
Readline.vi_editing_mode


IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")

# start wirble
Wirble.init

W#ls command
def ls(arg)
system "ls #{arg}"
end

#vi command
def vi(arg)
system "vi #{arg}"
end


irble.colorize
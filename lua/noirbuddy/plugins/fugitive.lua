-- TODO: Requires testing and fine-tuning
local cb = require('colorbuddy')

local Group = cb.Group
local colors = cb.colors

Group.new("gitcommitComment", colors.gray_6)
Group.new("gitcommitOnBranch", colors.gray_6)
Group.new("gitcommitHeader", colors.gray_4)
Group.new("gitcommitOnBranch", colors.gray_5)
Group.new("gitcommitSelectedType", colors.primary)
Group.new("gitcommitSelectedFile", colors.primary)
Group.new("gitcommitDiscardedType", colors.white)
Group.new("gitcommitDiscardedFile", colors.white)
Group.new("gitcommitUntrackedFile", colors.primary)

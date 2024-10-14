local cb = require('colorbuddy')

local Group = cb.Group
local colors = cb.colors

Group.new("gitcommitComment", colors.noir_6)
Group.new("gitcommitOnBranch", colors.noir_6)
Group.new("gitcommitHeader", colors.noir_4)
Group.new("gitcommitOnBranch", colors.noir_5)
Group.new("gitcommitSelectedType", colors.primary)
Group.new("gitcommitSelectedFile", colors.primary)
Group.new("gitcommitDiscardedType", colors.noir_0)
Group.new("gitcommitDiscardedFile", colors.noir_0)
Group.new("gitcommitUntrackedFile", colors.primary)
Group.new("diffLine", colors.diff_change)
Group.new("diffSubname", colors.noir_6)
Group.new("diffAdded", colors.diff_add)
Group.new("diffRemoved", colors.diff_delete)
Group.new("fugitiveHunk", colors.noir_6)

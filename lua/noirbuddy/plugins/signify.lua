local Group = require('colorbuddy').Group
local groups = require('colorbuddy').groups

Group.link('SignifySignAdd', groups.DiffAdd)
Group.link('SignifySignChange', groups.DiffChange)
Group.link('SignifySignDelete', groups.DiffDelete)

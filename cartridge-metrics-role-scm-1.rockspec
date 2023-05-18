package = 'cartridge-metrics-role'
version = 'scm-1'

source  = {
    url    = 'git+https://github.com/tarantool/cartridge-metrics-role.git',
    branch = 'master'
}

description = {
    summary     = "A role for collecting metrics in Tarantool Cartridge",
    homepage    = '',
    license     = 'BSD',
    maintainer  = "Igor Zolotarev <yngvar.antonsson@gmail.com>";
}

dependencies = {
    'lua >= 5.1',
    'checks >= 2.0.0',
    'metrics > 0.17.0',
}

build = {
    type = 'cmake',
    variables = {
        TARANTOOL_INSTALL_LUADIR = '$(LUADIR)',
    },
}

-- vim: syntax=lua

function nvm_auto_use --on-variable PWD
  if test -f .nvmrc
    nvm use (cat .nvmrc) > /dev/null 2>&1
  end
end
# Remove Docker images and containers
def clean-docker [] {
    docker system prune -a --volumes
    let containers = (docker ps --no-trunc -aq)
    if not ($containers | is-empty) {
        docker rm $containers
    }
    let dangling = (docker images -q --filter "dangling=true")
    if not ($dangling | is-empty) {
        docker rmi $dangling
    }
}

# Clean vim plugins
def clean-vim [] {
    nvim -c "execute \"PlugClean!\" | q | q"
}

# Clear duplicates from macOS "Open With" menu
def clear-open-with-dups [] {
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
}

# Fix iOS Simulator
def fix-ios-sim [] {
    rm -rf ($env.HOME | path join "Library" "Developer" "CoreSimulator" "Caches")
}

# Pull all git repositories in current directory
def git-pull-all [] {
    do {
        for dir in (glob */) {
            let repo_path = ($dir | str replace -r '/$' '')
            if ($repo_path | path join ".git" | path exists) {
                cd $repo_path
                git pull origin main
                cd ..
            }
        }
    }
}

# Remove all git repositories
def git-rm-all [] {
    ls -d */ | each { |dir|
        let git_dir = ($dir.name | path join ".git")
        if ($git_dir | path exists) {
            rm -rf $git_dir
        }
    }
}

# Safely reset and clean git repository
def git-pristine [] {
    print $"(ansi red)Warning: This will reset all changes and remove untracked files!(ansi reset)"
    print "Current directory: ($env.PWD)"
    if (input "Are you sure you want to proceed? [y/N] ") == "y" {
        git reset --hard
        print "Removing untracked files..."
        git clean --force -dfx
    }
}

# Safely wipe git changes
def git-wipe [] {
    print $"(ansi red)Warning: This will reset all changes and remove untracked files!(ansi reset)"
    print "Current directory: ($env.PWD)"
    if (input "Are you sure you want to proceed? [y/N] ") == "y" {
        git reset --hard
        print "Removing untracked files..."
        git clean --force -df
    }
}

# Make directory and change into it
def --env mcd [dir: string] {
    mkdir $dir
    cd $dir
}

# Network scan
def netscan [] {
    ifconfig | find "broadcast"
    arp -a | find ":"
}

# Remove Python compiled files
def rmpyc [] {
    let current_dir = $env.PWD

    # Handle current directory
    glob *.pyc | each { |file| rm -f $file }

    # Get all subdirectories including hidden ones
    ls -a **/* --full-paths | where type == dir | each { |entry|
        cd $entry.name
        glob *.pyc | each { |file| rm -f $file }
        cd $current_dir
    }
}

# Remove vim undo files
def rmundo [] {
    let current_dir = $env.PWD

    # Handle current directory
    glob *.un~ | each { |file| rm -f $file }

    # Get all subdirectories including hidden ones
    ls -a **/* --full-paths | where type == dir | each { |entry|
        cd $entry.name
        glob *.un~ | each { |file| rm -f $file }
        cd $current_dir
    }
}

# Archive directories
def tardir [dir: string] {
    let target_dir = ($dir | path expand)
    if not ($target_dir | path exists) {
        print $"(ansi red)Error: Directory '($dir)' does not exist(ansi reset)"
        return
    }

    # Change to target directory first so all operations are relative
    cd $target_dir

    let dirs = (ls | where type == "dir")
    if ($dirs | is-empty) {
        print $"(ansi yellow)No directories found in '($dir)'(ansi reset)"
        return
    }

    print $"(ansi yellow)Found the following directories to archive:(ansi reset)"
    print ""
    $dirs | select name size modified | table
    print ""

    if (input $"(ansi yellow)Proceed with archiving? [y/N] (ansi reset)") == "y" {
        $dirs | each { |entry|
            let dir_name = $entry.name
            let archive_name = $"($dir_name).tar.gz"
            print $"Archiving ($dir_name) to ($archive_name)..."

            try {
                # Create archive from current directory for relative paths
                tar -cf - -C . "$dir_name" | xz -9e > "$archive_name.tar.xz"
                if ($archive_name | path exists) {
                    rm -rf $dir_name
                    print $"(ansi green)Successfully archived ($dir_name)(ansi reset)"
                }
            } catch { |err|
                print $"(ansi red)Error archiving ($dir_name): ($err.msg)(ansi reset)"
            }
        }
    } else {
        print $"(ansi yellow)Operation cancelled(ansi reset)"
    }
}

# Monitor TCP traffic
def tcpmonitor [interface: string, port: int] {
    sudo /usr/sbin/tcpdump -ln -A -s1024 -i $interface tcp port $port
}

# Update Homebrew
def update-homebrew [] {
    print $"(ansi blue)Updating the list of available Homebrew packages(ansi reset)"
    brew update

    print $"(ansi blue)Updating Homebrew packages(ansi reset)"
    brew upgrade

    print $"(ansi blue)Cleaning up old Homebrew applications(ansi reset)"
    brew cleanup
    brew autoremove
    print $"(ansi green)Updated Homebrew packages(ansi reset)"
}

# Update vim plugins
def update-vim [] {
    nvim +PlugUpdate +qall
}

# Update oh-my-zsh
def update-zsh [] {
    let original_dir = $env.PWD
    cd "($env.HOME)/.oh-my-zsh"
    git pull origin master
    cd $original_dir
}

# Update everything
def update [] {
    print $"(ansi yellow)Updating macOS packages(ansi reset)"
    update-vim
    update-zsh
    print $"(ansi yellow)Completed macOS package updates(ansi reset)"
}

# Create Git branch with worktree
def --env gwt [name: string] {
    let branch_name = $"feature/($name)"
    let worktree_path = $"~/worktrees/($name)" | path expand
    
    # Create the branch
    print $"Creating branch: ($branch_name)"
    git branch $branch_name
    
    # Add the worktree
    print $"Creating worktree at: ($worktree_path)"
    git worktree add $worktree_path $branch_name
    
    # Change to the worktree directory
    print $"Switching to worktree: ($worktree_path)"
    cd $worktree_path
}

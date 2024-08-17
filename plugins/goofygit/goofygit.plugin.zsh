


# Discard changes, i.e. git checkout -- *
# Usage: 
#   ggdd a.txt  ---- only a.txt
#   ggdd        ---- all files
function ggdd() {
    if [ -z $1 ];then
        file="."
    else
        file=$1
    fi
    git checkout -- $file
}

# Discard the added i.e. the staged files, and put it back to working directory/working tree
# Usage: 
#   ggda a.txt  ---- only a.txt
#   ggcc        ---- all files
function ggda() {
    if [ -z $1 ];then
        file="."
    else
        file=$1
    fi
    git reset HEAD $file
}


# Revoke the last commit and put the modification back to staged area, i.e. commited to staged/added
# Usage: Cannot claim specific file
function ggca() {
    git reset --soft HEAD^
}

# Revoke the last commit and meantime put changes back to working tree
# Usage: Cannot claim specific file
function ggcd() {
    git reset --mixed HEAD^
}

# Revoke the last commit and meantime discard all the changes
# Usage: Cannot claim specific file
function ggdc() {
    if [ -z $1 ];then
        file="."
    else
        file=$1
    fi
    git reset --hard HEAD
}


# Discard all untracked files, just make them disappear
# Usage: 
#   ggcn a.txt  ---- only a.txt
#   ggcn        ---- all files
function ggcn() {
    if [ -z $1 ];then
        git clean -i
    else
        git clean -i $1
    fi
}

# Add only tracked/indexed/staged files' modification, i.e. ignore untracked files
# Usage: No need to claim specific file
function ggat() {
    git add -u
}

# Show all tags
# Usage: 
#   ggtl v*  ---- only tags of pattern v*
#   ggtl     ---- all tags
function ggtl() {
    if [ -z $1 ];then
        pattern=""
    else
        pattern=$1
    fi
    git tag -l $pattern
}


# Add a new tag and push it to remote
# Usage: 
#   ggtl tagname annotation ---- a tag and its annotaion
#   ggtl tagname            ---- only a tag
function ggtp() {
    if [ -z $1];then
        echo -e "\033[31mMissing tagname, exit...\033[0m\n" && exit 1
    else
        tagname=$1
    fi
    if [ -z $2 ];then
        echo -e "\033[33mWarning: missing annotation\033[0m\n"
        git tag $tagname
    else 
        git tag $tagname -am $2
    fi
    git push --tags   
}
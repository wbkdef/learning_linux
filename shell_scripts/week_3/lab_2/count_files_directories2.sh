echo "in directory $1:"

echo "There are $(find $1 -type d | wc -l) directories in directory $1 and its subdirectories"
echo "There are $(find $1 -type f | wc -l) files in directory $1 and its subdirectories"

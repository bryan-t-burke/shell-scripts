#!/bin/bash
# generate a java poco (plain old class object) file from type and variable name inputs read from standard in

# For those asking why I bothered to write this when lombok exists, the answer is because I find lombok annoying from a dependency management perspective.
# Prior to java 16, lombok used loopholes to break encapsulation in order to generate code. In java 16 those loop holes were patched and official API methods
# were added to support lombok. This means that certain versions of java and certain versions of lombok cannot work together and that's annoying to me.
# As time goes on, this specific issue will go away as fewer and fewer applications will continue to use pre 16 java, but as we all know
# 1) there will always be hold out that need to use older versions for good, bad, and stupid reasons
# 2) just because that issue is resolved, doesn't mean a future issue won't come up.
# By contrast, this script, while lacking some of the features of lombok, doesn't depend on anything except bash.

# future enhancements ideas
# constructors, toString, equals, and hashcode, nonnull fields

# class name as argument parameter
# if $1 is null then substitute "ClassName"
if [[ -z $1 ]]
then
  class_name="ClassName"
else
  class_name=$1
fi

# to-do make configurable
indent="    "

# read from standard in
# read pairs type then name
: '
sample input
String name
int age
double score
Hamburger hamburger
'
while read -r type variable; do
  # inorder to populate different "sections" of the file without having to reread the input, we'll use temp files out outstreams and combine everything together at the end
  # update temporary properties file
  {
    echo "${indent}""private ""${type}"" ""${variable}"";"
    echo ""
  } >> properties
  # update temporary functions file
  {
    echo "${indent}""public ""${type}"" get""$(../capital_first_letter.sh "${variable}")""() {"
    echo "${indent}""${indent}""return ""${variable}"";"
    echo "${indent}""}"
    echo ""
    echo "${indent}""public void set""$(../capital_first_letter.sh "${variable}""")(""${type}"" ""${variable}"") {"
    echo "${indent}""${indent}""this.""${variable}"" = ""${variable}"";"
    echo "${indent}""}"
    echo ""
  } >> functions
done

# put it all together
{
  echo "public class ""${class_name}"" {"
  echo ""
  cat properties
  cat functions
  echo "}"
} >> "${class_name}".java

# clean up "temp streams"
rm ./properties
rm ./functions

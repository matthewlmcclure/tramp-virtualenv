import os

# Verify the Python shell is running on the remote host:
# 1. Type C-c C-z to reveal the Python shell.
# 2. Type C-x o to return to this buffer.
# 3. Type C-c C-c to evaluate this buffer.
print os.uname()

# Completion demonstration:
# 1. Type C-c C-c to evaluate this buffer in the remote Python shell. (Do
#    it twice. (?))
# 2. Uncomment the line below.
# 3. Place the point after 'os.' and type M-TAB.
#os.

# Verify you can debug using python on the remote host:
# 1. Uncomment the lines below.
# 2. M-x pdb RET
# 3. Edit the command line so that it has demo.py as its only file argument.
#import pdb
#pdb.set_trace()
#print("The debugger on %s should stop on this line." % os.uname()[1])

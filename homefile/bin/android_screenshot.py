# Imports the monkeyrunner modules used by this program
from com.android.monkeyrunner import MonkeyRunner, MonkeyDevice
# Connects to the current device, returning a MonkeyDevice object
device = MonkeyRunner.waitForConnection()
# Takes a screenshot
result = device.takeSnapshot()

# Writes the screenshot to a file
result.writeToFile('/temp/shot1.png','png')

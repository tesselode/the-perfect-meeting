import os
import urllib.request
import subprocess
import shutil
import zipfile

class cd:
    """Context manager for changing the current working directory"""
    def __init__(self, newPath):
        self.newPath = os.path.expanduser(newPath)

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)

input('Press enter to start the build process...')

# clear previous build
print()
print('Deleting old binaries...')
if os.path.isdir('binaries'):
    shutil.rmtree('binaries')

# run moonscript
print()
print('Compiling game...')
subprocess.call('moonc source')

# create the love file
print()
print('Creating .love file...')
shutil.make_archive('binaries/the-perfect-meeting', 'zip', 'source')
os.rename('binaries/the-perfect-meeting.zip', 'binaries/the-perfect-meeting.love')

# make win32 build
print()
print('Creating win32 build...')
urllib.request.urlretrieve('https://bitbucket.org/rude/love/downloads/love-0.10.2-win32.zip', 'binaries/love-win32.zip')
with zipfile.ZipFile('binaries/love-win32.zip', 'r') as z:
    z.extractall('binaries')
os.remove('binaries/love-win32.zip')
shutil.copyfile('binaries/the-perfect-meeting.love', 'binaries/love-0.10.2-win32/the-perfect-meeting.love')
with cd('binaries/love-0.10.2-win32'):
    subprocess.call('copy /b love.exe+the-perfect-meeting.love "The Perfect Meeting.exe"', shell=True)
os.remove('binaries/love-0.10.2-win32/changes.txt')
os.remove('binaries/love-0.10.2-win32/game.ico')
os.remove('binaries/love-0.10.2-win32/the-perfect-meeting.love')
os.remove('binaries/love-0.10.2-win32/love.exe')
os.remove('binaries/love-0.10.2-win32/lovec.exe')
os.remove('binaries/love-0.10.2-win32/love.ico')
os.remove('binaries/love-0.10.2-win32/readme.txt')
shutil.copyfile('credits.txt', 'binaries/love-0.10.2-win32/credits.txt')
os.rename('binaries/love-0.10.2-win32', 'binaries/the-perfect-meeting-win32')

# make win64 build
print()
print('Creating win64 build...')
urllib.request.urlretrieve('https://bitbucket.org/rude/love/downloads/love-0.10.2-win64.zip', 'binaries/love-win64.zip')
with zipfile.ZipFile('binaries/love-win64.zip', 'r') as z:
    z.extractall('binaries')
os.remove('binaries/love-win64.zip')
shutil.copyfile('binaries/the-perfect-meeting.love', 'binaries/love-0.10.2-win64/the-perfect-meeting.love')
with cd('binaries/love-0.10.2-win64'):
    subprocess.call('copy /b love.exe+the-perfect-meeting.love "The Perfect Meeting.exe"', shell=True)
os.remove('binaries/love-0.10.2-win64/changes.txt')
os.remove('binaries/love-0.10.2-win64/game.ico')
os.remove('binaries/love-0.10.2-win64/the-perfect-meeting.love')
os.remove('binaries/love-0.10.2-win64/love.exe')
os.remove('binaries/love-0.10.2-win64/lovec.exe')
os.remove('binaries/love-0.10.2-win64/love.ico')
os.remove('binaries/love-0.10.2-win64/readme.txt')
shutil.copyfile('credits.txt', 'binaries/love-0.10.2-win64/credits.txt')
os.rename('binaries/love-0.10.2-win64', 'binaries/the-perfect-meeting-win64')

# upload to itch
print()
print('Pushing to Itch...')
os.makedirs('binaries/the-perfect-meeting-love')
os.rename('binaries/the-perfect-meeting.love', 'binaries/the-perfect-meeting-love/the-perfect-meeting.love')
with cd('binaries'):
    subprocess.call('butler push the-perfect-meeting-win32 tesselode/the-perfect-meeting:win32', shell=True)
    subprocess.call('butler push the-perfect-meeting-win64 tesselode/the-perfect-meeting:win64', shell=True)
    subprocess.call('butler push the-perfect-meeting-love tesselode/the-perfect-meeting:love', shell=True)

print()
input('Build successful! Press enter to exit...')

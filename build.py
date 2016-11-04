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
shutil.make_archive('binaries/logo-bounce', 'zip', 'source')
os.rename('binaries/logo-bounce.zip', 'binaries/logo-bounce.love')

# make win32 build
print()
print('Creating win32 build...')
urllib.request.urlretrieve('https://bitbucket.org/rude/love/downloads/love-0.10.2-win32.zip', 'binaries/love-win32.zip')
with zipfile.ZipFile('binaries/love-win32.zip', 'r') as z:
    z.extractall('binaries')
os.remove('binaries/love-win32.zip')
shutil.copyfile('binaries/logo-bounce.love', 'binaries/love-0.10.2-win32/logo-bounce.love')
with cd('binaries/love-0.10.2-win32'):
    subprocess.call('copy /b love.exe+logo-bounce.love logo-bounce.exe', shell=True)
os.remove('binaries/love-0.10.2-win32/changes.txt')
os.remove('binaries/love-0.10.2-win32/game.ico')
os.remove('binaries/love-0.10.2-win32/logo-bounce.love')
os.remove('binaries/love-0.10.2-win32/love.exe')
os.remove('binaries/love-0.10.2-win32/love.ico')
os.remove('binaries/love-0.10.2-win32/readme.txt')
os.rename('binaries/love-0.10.2-win32', 'binaries/logo-bounce-win32')

# make win64 build
print()
print('Creating win64 build...')
urllib.request.urlretrieve('https://bitbucket.org/rude/love/downloads/love-0.10.2-win64.zip', 'binaries/love-win64.zip')
with zipfile.ZipFile('binaries/love-win64.zip', 'r') as z:
    z.extractall('binaries')
os.remove('binaries/love-win64.zip')
shutil.copyfile('binaries/logo-bounce.love', 'binaries/love-0.10.2-win64/logo-bounce.love')
with cd('binaries/love-0.10.2-win64'):
    subprocess.call('copy /b love.exe+logo-bounce.love logo-bounce.exe', shell=True)
os.remove('binaries/love-0.10.2-win64/changes.txt')
os.remove('binaries/love-0.10.2-win64/game.ico')
os.remove('binaries/love-0.10.2-win64/logo-bounce.love')
os.remove('binaries/love-0.10.2-win64/love.exe')
os.remove('binaries/love-0.10.2-win64/love.ico')
os.remove('binaries/love-0.10.2-win64/readme.txt')
os.rename('binaries/love-0.10.2-win64', 'binaries/logo-bounce-win64')

# upload to itch
print()
print('Pushing to Itch...')
os.makedirs('binaries/logo-bounce-love')
os.rename('binaries/logo-bounce.love', 'binaries/logo-bounce-love/logo-bounce.love')
with cd('binaries'):
    subprocess.call('butler push logo-bounce-win32 tesselode/logo-bounce:win32', shell=True)
    subprocess.call('butler push logo-bounce-win64 tesselode/logo-bounce:win64', shell=True)
    subprocess.call('butler push logo-bounce-love tesselode/logo-bounce:love', shell=True)

print()
input('Build successful! Press enter to exit...')

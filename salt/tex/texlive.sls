#!py

from __future__ import print_function
import sys
import os
import os.path as p
import shutil
import glob
import subprocess
import shutil
import tarfile


LIVETEX_INSTALL_LOC = "/usr/local/texlive/2016"
LIVETEX_BIN_PATH = p.join(LIVETEX_INSTALL_LOC, "bin/x86_64-linux/") 
TLMGR_LOC = p.join(LIVETEX_BIN_PATH, "tlmgr")
DOWNLOAD_DIR = p.expanduser("~/Downloads/")
TEXMF_DIR = p.expanduser("~/.texmf")


def symlink_texlive_install_to_bin():
    texlive_binaries = glob.glob(p.join(LIVETEX_BIN_PATH, "*"))
    for binary in texlive_binaries:
        new_bin_loc = p.join("/usr/local/bin", os.path.basename(binary))
        if not p.exists(new_bin_loc):
            os.symlink(binary, new_bin_loc)


def install_texlive_manually():
    """
    Download texlive and install manually, but only if we can't find tlmgr.
    """
    # Get the profile file's location relative to this file
    curr_loc = p.dirname(os.path.realpath(__file__))
    prof_file_path = p.join(curr_loc, "files/texlive.profile")

    if not p.exists(LIVETEX_INSTALL_LOC):
        subprocess.call(['wget', '-P', DOWNLOAD_DIR, 'mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz'], shell=True)

        garbage = []

        tarfile = p.join(DOWNLOAD_DIR, 'install-tl-unx.tar.gz')
        garbage.append(tarfile)
        tarobj = tarfile.open(tarfile)
        tarobj.extractall(DOWNLOAD_DIR)

        texlive_install_dir = glob.glob(p.join(DOWNLOAD_DIR, "install-tl") + "*")
        if not texlive_install_dir:
            raise ValueError("Download of texlive not where expected.")
        garbage.extend(texlive_install_dir)

        texlive_install_dir.sort()
        subprocess.call(['exec',  p.join(texlive_install_dir[-1], 'install-tl'),
                         '-profile', prof_file_path], shell=True)

        shutil.rmtree(texlive_install_dir)


def tlmgr_initialize():
    """
    Initialize the texlive package manager's directory structure.
    """
    if not os.path.exists(TEXMF_DIR):
        subprocess.call(TLMGR_LOC + " init-usertree", shell=True)


def install_tlmgr_packages():
    """
    Install any base latex packages that are always expected to be there.
    """
    for pkg in __pillar__['latex']['tlmgr_pkgs']:
        proc = subprocess.Popen(TLMGR_LOC + ' install ' + pkg, shell=True, stdout=subprocess.PIPE)

        # Only report output if it failed
        if proc.returncode != 0:
            output = proc.stdout.read()

            # AND it was not because you already have the package
            if output.find(" package already present: ") == -1:
                print(output)

def run():
    install_texlive_manually()
    symlink_texlive_install_to_bin()
    tlmgr_initialize()
    install_tlmgr_packages()
    return {}

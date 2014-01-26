From: "Terje J. Hanssen" <terje-2yIPwdmwSce/d7phXA6hpxdYX54VHubl@public.gmane.org>
Subject: xrandr HDMI-1 and DVI-D-1 disconnected - External monitor
	not detected
Date: Sun, 26 Jan 2014 15:47:29 +0100
Message-ID: <52E52001.1080903@nordland-teknikk.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi List,

I'm stuck how to get a dual head monitor solution to work with Nouveau, 
running openSUSE 13.1 on my hp8710w mobile workstation equipped with a 
Nvidia graphical card. Beyond the built-in WUXGA display, an external 
WQHD monitor is connected to the HDMI port on the graphical card and/or 
to the dual link DVI-D on a hp docking station.

To compare with SLED11/Nvidia driver running in dualboot with openSUSE 
13.1/Nouveau on the same workstation, the external monitor works up to 
1920x1080 over HDMI and at 2560x1440 resolution over the docking dual 
link DVI-D.


Here follows the query output using openSUSE 13.1/Nouveau/xrandr:


# lspci -nnk | grep VGA -A2
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G92GLM 
[Quadro FX 3600M] [10de:061c] (rev a2)
     Subsystem: NVIDIA Corporation Device [10de:0518]
     Kernel driver in use: nouveau


Software versions installed:

# zypper se -is nouveau
Loading repository data...
Reading installed packages...

S | Name                          | Type    | Version      | Arch   | 
Repository
--+-------------------------------+---------+--------------+--------+------------------
i | libdrm_nouveau2               | package | 2.4.46-3.2.2 | x86_64 | 
openSUSE-13.1-Oss
i | xorg-x11-driver-video-nouveau | package | 1.0.9-3.1.2  | x86_64 | 
openSUSE-13.1-Oss


# zypper se -is xrandr
Loading repository data...
Reading installed packages...

S | Name       | Type    | Version     | Arch   | Repository
--+------------+---------+-------------+--------+------------------
i | libXrandr2 | package | 1.4.2-2.1.2 | x86_64 | openSUSE-13.1-Oss
i | xrandr     | package | 1.4.1-2.2.1 | x86_64 | openSUSE-13.1-Oss


Beyond LVDS for the builtin display, all other graphical ports are 
reported as disconnected by xrandr:

# xrandr -q
Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 8192 x 8192
LVDS-1 connected primary 1920x1200+0+0 (normal left inverted right x 
axis y axis) 367mm x 229mm
    1920x1200      60.0*+   59.9
    1920x1080      60.0
    1600x1200      59.9
    1680x1050      60.0
    1400x1050      60.0
    1280x1024      59.9
    1280x960       59.9
    1152x864       60.0
    1024x768       59.9
    800x600        59.9
    640x480        59.4
    720x400        59.6
    640x400        60.0
    640x350        59.8
VGA-1 disconnected (normal left inverted right x axis y axis)
DVI-D-1 disconnected (normal left inverted right x axis y axis)
HDMI-1 disconnected (normal left inverted right x axis y axis)


I've tried a solution that has been suggested to add output to an 
external monitor, but it failed as shown:

# xrandr --addmode HDMI-1 1920x1080
# xrandr --output HDMI-1 --mode 1920x1080 --left-of LVDS-1
xrandr: Configure crtc 1 failed


I would be very thankful to get help here that can solve this confusing 
problem.

Terje

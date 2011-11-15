From: Bill Moss <bill.moss-H+0wwilmMs3R7s880joybQ@public.gmane.org>
Subject: screen flicker
Date: Tue, 15 Nov 2011 09:16:15 -0500
Message-ID: <4EC2742F.2040504@verizon.net>
Reply-To: bill.moss-H+0wwilmMs3R7s880joybQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=------------060401090906030803080602
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------060401090906030803080602
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I recently moved my openSUSE 11.4 system from the
proprietary drivers to nouveau. After much grief due to the
sometimes conflicting instruction on the Internet and
applications that placed out of date shared objects
(libraries) in /usr/local/lib which is searched first by
ld.so, I have it working on a 19" wide screen LCD monitor at
1440x900.

However, there is a distinct and periodic flicker that was
not present with the NVIDIA drivers and the font rendering
is not as crisp. I'm using the nouveau as supplied by the
standard repositories of openSUSE (zypper repos).

Attached is a file that contains the information relevant to
the installation.

Note that the change was made to get rid of the proprietary
software and since openSUSE 12.1 defaults to nouveau. I
intend to customize (make xconfig) compile the current
stable 3.x kernel to see if this fixes the problem. Other
suggestions would be welcome.

-- 
William (Bill) Moss
billmoss-HInyCGIudOg@public.gmane.org
NY (USA)
  Those who will not reason, are bigots,
  those who cannot, are fools,
  and those who dare not, are slaves.
by Lord Byron
  Justice will not be served until those who are
  unaffected are as outraged as those who are.
by Benjamin Franklin
  Honor, justice and humanity forbid us tamely to
  surrender that freedom which we received from 
  our gallant ancestors and which our innocent 
  posterity have a right to receive from us. We 
  cannot endure the infamy and guilt of resigning 
  succeeding generations to that wretchedness which 
  inevitably awaits them if we basely entail 
  hereditary bondage on them.
by Thomas Jefferson
Declaration of the Causes and Necessities of Taking up Arms
6 July 1775


--------------060401090906030803080602
Content-Type: text/plain;
 name="sysconfig.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="sysconfig.txt"

!!lsmod | grep -i nouv
----------------------
nouveau               561878  2 
ttm                    63307  1 nouveau
drm_kms_helper         32719  1 nouveau
drm                   189610  4 nouveau,ttm,drm_kms_helper
i2c_algo_bit            5402  1 nouveau
i2c_core               27418  6 videodev,i2c_nforce2,nouveau,drm_kms_helper,drm,i2c_algo_bit
video                  14370  1 nouveau
button                  5465  1 nouveau

!!lsmod | grep -i -envid -emesa
-------------------------------

zypper se mesa
--------------
S | Name                     | Summary                                                         | Type      
--+--------------------------+-----------------------------------------------------------------+-----------
i | DirectFB-Mesa            | Mesa backend of Graphics Library for Framebuffer Devices        | package   
  | DirectFB-Mesa-debuginfo  | Debug information for package DirectFB-Mesa                     | package   
i | Mesa                     | System for rendering interactive 3-D graphics                   | package   
  | Mesa                     | System for rendering interactive 3-D graphics                   | srcpackage
i | Mesa                     | xorg-x11-server: This update  fixes a radeon/radeonhda          | patch
  |                          | [R3xx-R5xx screen distortion                                    |
  | Mesa-debuginfo           | Debug information for package Mesa                              | package   
  | Mesa-debugsource         | Debug sources for package Mesa                                  | package   
i | Mesa-devel               | Libraries, includes and more to develop Mesa applications       | package   
i | Mesa-nouveau3d           | Experimental 3D driver for nouveau driver                       | package   
  | Mesa-nouveau3d-debuginfo | Debug information for package Mesa-nouveau3d                    | package   
  | MesaGLw                  | Mesa Widget library                                             | package   
  | MesaGLw                  | Mesa Widget library                                             | srcpackage
  | MesaGLw-debuginfo        | Debug information for package MesaGLw                           | package   
  | MesaGLw-debugsource      | Debug sources for package MesaGLw                               | package   
  | MesaGLw-devel            | Libraries, includes and more to develop MesaGLw applications    | package   

!!zypper se nouv
-----------------
S | Name                                      | Summary                                        | Type      
--+-------------------------------------------+------------------------------------------------+-----------
i | Mesa-nouveau3d                            | Experimental 3D driver for nouveau driver      | package   
  | Mesa-nouveau3d-debuginfo                  | Debug information for package Mesa-nouveau3d   | package   
i | xorg-x11-driver-video-nouveau             | Accelerated Open Source driver for nVidia cards| package   
  | xorg-x11-driver-video-nouveau             | Accelerated Open Source driver for nVidia cards| srcpackage
  | xorg-x11-driver-video-nouveau-debuginfo   | Debug information for package                  | package
  |                                           | xorg-x11-driver-video-nouveau                  |
  | xorg-x11-driver-video-nouveau-debugsource | Debug sources for package                      | package
  |                                           | xorg-x11-driver-video-nouveau                  |

---------------------------------------------------------------------------------------
Relevant portions of the /etc/X11/xorg.conf and /etc/X11/xorg.conf/50-?????.conf files.
---------------------------------------------------------------------------------------

Section "ServerFlags"
    Option	"DefaultServerLayout"	"layoutWMM0"	# geforce noveau acer 1916w gtf

    Option	"AllowMouseOpenFail"	"on"
    Option	"ZapWarning"		"on"
    Option	"DontZoom"		"off"
EndSection

Section "ServerLayout"
    Identifier     "LayoutWMM0"
    Screen      0  "ScreenWMM0"
    InputDevice    "Keyboard0"	"CoreKeyboard"
    InputDevice    "Mouse0"	"CorePointer"
EndSection


Section "Screen"
    Identifier	    "ScreenWMM0"
    Device	    "geforce_nouveau"
    Monitor	    "acer_al1916w"
    DefaultDepth    24
    #Option	    "metamodes" "1440x900 +0+0; 1152x864 +0+0; 640x480 +0+0"
    #Option	    "TwinView" "0"

    SubSection "Display"
	Viewport   0 0
	Depth     1
    EndSubSection
    SubSection "Display"
	Viewport   0 0
	Depth     4
    EndSubSection
    SubSection     "Display"
	Depth	    8
	Viewport    0 0
    EndSubSection
    SubSection     "Display"
	Viewport    0 0
	Depth	    15
    EndSubSection
    SubSection     "Display"
	Viewport    0 0
	Depth	    16
    EndSubSection
    SubSection "Display"
	Viewport   0 0
	Depth     24
    EndSubSection
EndSection

Section "Device"
    Identifier	"geforce_nouveau"
    Driver      "nouveau"
    BusID       "PCI:2:0:0"
    Screen	0

    VendorName	"NOUVEAU.ORG"
    BoardName	"GeForce 210 GT218 GForce 8400GS"

    Option	"UseFBDev"	"yes"
    Option	"FlatPanel"	"yes"

    Option  "ModeDebug"		"yes"
    Option  "Monitor-VGA"	"acer_al1916w"
    Option  "Monitor-VGA-1"	"acer_al1916w"
    Option  "Monitor-HDMI"	"acer_al1916w"
    Option  "Monitor-HDMI-1"	"acer_al1916w"
    Option  "Monitor-DVI"	"acer_al1916w"
    Option  "Monitor-DVI-1"	"acer_al1916w"
    Option  "Monitor-DVI-I-1"	"acer_al1916w"
EndSection


	#	ACER MANUAL:	max resolution	: 1440x900
	#			syc frequency	: 30kHz - 82kHz H
	#					: 56 Hz - 76 Hz V
	#			max pixel clock : 135 MHz
	#			actual display	: 410.4mm H x 256.5mm V
	#			diagonal	: 483.6mm
	#	Modes are from the Acer manual. The odd frequencies are taken
	#	from the manual, the 60Hz is set as a common default. For
	#	1024x768, the value from the console as reported by the
	#	monitor, is used in addition to the others.
	#
	#	All generated values use 60Hz.
	#	gtf(1) was also tried for the modlines but the ones here seemed
	#	to work better. Also tried some other utilities on the Internet
	#	as well as interactive sites on the Internet. None worked any
	#	better than the values that follow.
Section "Monitor"
    Identifier	    "acer_al1916w"
    VendorName      "ACER LCD"
    ModelName       "AL1916W"

    DisplaySize     410    257
    HorizSync       30.0 - 82.0
    VertRefresh     56.0 - 76.0
    Option          "DPMS"
    Option	    "Primary"	    "yes"
    Option	    "CalcAlgorithm" "XServerPool"

    Option	    "PreferredMode" "1440x900"

    #	Generated by cvt 60Hz
    Modeline "1440x900"  106.50 1440 1528 1672 1904  900  903  909  934 -hsync +vsync
    Modeline "1152x1024"  97.75 1152 1224 1344 1536 1024 1027 1037 1063 -hsync +vsync
    Modeline "1280x1024" 109.00 1280 1368 1496 1712 1024 1027 1034 1063 -hsync +vsync
    Modeline "1280x768"   79.50 1280 1344 1472 1664  768  771  781  798 -hsync +vsync
    Modeline "1024x768"   63.50 1024 1072 1176 1328  768  771  775  798 -hsync +vsync
    Modeline "800x600"    38.25  800  832 912  1024  600  603  607  624 -hsync +vsync

EndSection

!!lshw -class display
---------------------
  *-display
       description: VGA compatible controller
       product: GT218 [GeForce 210]
       vendor: nVidia Corporation
       physical id: 0
       bus info: pci@0000:02:00.0
       version: a2
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress vga_controller bus_master cap_list rom
       configuration: driver=nouveau latency=0
       resources:   irq:17 memory:fd000000-fdffffff memory:d0000000-dfffffff 
		    memory:ce000000-cfffffff ioport:ec00(size=128) memory:fcf80000-fcffffff

--------------060401090906030803080602
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------060401090906030803080602--

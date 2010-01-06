From: Craig Lang <craig-26hVlxoXjdmZFXHMiJVqBHS5uNuOjpZe@public.gmane.org>
Subject: Mouse cursor rotated on all screens when rotating a
	single screen.
Date: Wed, 6 Jan 2010 15:34:44 +0000
Message-ID: <ce14ebad1001060734n1232d62cq775b7fb57875b0fa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1647755705=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1647755705==
Content-Type: multipart/alternative; boundary=00163641798fa21792047c80b161

--00163641798fa21792047c80b161
Content-Type: text/plain; charset=ISO-8859-1

I have two monitors, one landscape and the other portrait. When I rotate the
portrait monitor using xrandr (or the xorg.conf option) the mouse cursor on
the landscape monitor is also rotated and the "click point" is no longer
below the cursor (this makes the mouse practically unusable). The cursor is
correct on the rotated monitor. Setting NoAccel "False" and HWCursor "False"
in xorg.conf results in a corrupted screen and lockup.

I am running an up-to-date i686 Arch Linux with the latest git version of
xf86-video-nouveau (I used the AUR package). xorg-server is from the arch
core repositories. My card is the GeForce9500GT (two DVI ports on the card).

The xrandr command I'm using:
xrandr --output DVI-I-2 --rotate left

Is this an issue with nouveau? Any help/pointers would be much appreciated.

Thanks.

xorg.conf for reference:

Section "ServerLayout"
    Identifier     "Tfellover"
    Screen         "Screen0"
    InputDevice    "Mouse0" "CorePointer"
    InputDevice    "Keyboard0" "CoreKeyboard"
EndSection

Section "Files"
    ModulePath      "/usr/lib/xorg/modules"
    FontPath        "/usr/share/fonts/misc"
    FontPath        "/usr/share/fonts/100dpi:unscaled"
    FontPath        "/usr/share/fonts/75dpi:unscaled"
    FontPath        "/usr/share/fonts/TTF"
    FontPath        "/usr/share/fonts/Type1"
EndSection

Section "Module"
    Load           "dbe"
    Load           "dri2"
    Load           "glx"
    Load           "extmod"
EndSection

Section "ServerFlags"
    Option         "AllowEmptyInput" "False"
    Option         "AutoAddDevices" "False"
    Option         "AutoEnableDevices" "False"
    Option         "DontZap" "False"
EndSection
Section "InputDevice"
    Identifier     "Keyboard0"
    Driver         "kbd"
    Option         "XkbLayout" "gb"
EndSection

Section "InputDevice"
    Identifier     "Mouse0"
    Driver         "mouse"
    Option         "Protocol" "auto"
    Option         "Device" "/dev/input/mice"
    Option         "ZAxisMapping" "4 5 6 7"
EndSection

Section "Monitor"
    Identifier     "horizontal"
    VendorName     "Samsung"
    ModelName      "Samsung SyncMaster P2050"
    Option         "PreferredMode" "1600x900_60.00"
EndSection

Section "Monitor"
    Identifier     "vertical"
    VendorName     "Unknown"
    ModelName      "Samsung SyncMaster"
    Option         "PreferredMode" "1600x900_60.00"
    Option         "LeftOf" "horizontal"
EndSection

Section "Device"
    Identifier     "GF9"
    Driver         "nouveau"
    VendorName     "NVIDIA Corporation"
    BoardName      "GeForce 9500 GT"
    BusID          "PCI:1:0:0"
    Option         "Monitor-DVI-I-1" "horizontal"
    Option         "Monitor-DVI-I-2" "vertical"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "GF9"
    Monitor        "horizontal"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    EndSubSection
    Option         "AIGLX" "false"
EndSection

--00163641798fa21792047c80b161
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have two monitors, one landscape and the other portrait. When I rotate th=
e portrait monitor using xrandr (or the xorg.conf option) the mouse cursor =
on the landscape monitor is also rotated and the &quot;click point&quot; is=
 no longer below the cursor (this makes the mouse practically unusable). Th=
e cursor is correct on the rotated monitor. Setting NoAccel &quot;False&quo=
t; and HWCursor &quot;False&quot; in xorg.conf results in a corrupted scree=
n and lockup. <br>
<br>I am running an up-to-date i686 Arch Linux with the latest git version
of xf86-video-nouveau (I used the AUR package). xorg-server is from the
arch core repositories. My card is the GeForce9500GT (two DVI ports on the =
card).<br><br>The xrandr command I&#39;m using:<br>xrandr --output DVI-I-2 =
--rotate left<br><br>Is this an issue with nouveau? Any help/pointers would=
 be much appreciated. <br>
<br>Thanks.<br><br>xorg.conf for reference:<br><br>Section &quot;ServerLayo=
ut&quot;<br>=A0=A0=A0 Identifier=A0=A0=A0=A0 &quot;Tfellover&quot;<br>=A0=
=A0=A0 Screen=A0=A0=A0=A0=A0=A0=A0=A0 &quot;Screen0&quot;<br>=A0=A0=A0 Inpu=
tDevice=A0=A0=A0 &quot;Mouse0&quot; &quot;CorePointer&quot;<br>
=A0=A0=A0 InputDevice=A0=A0=A0 &quot;Keyboard0&quot; &quot;CoreKeyboard&quo=
t;<br>EndSection<br><br>Section &quot;Files&quot;<br>=A0=A0=A0 ModulePath=
=A0=A0=A0=A0=A0 &quot;/usr/lib/xorg/modules&quot;<br>=A0=A0=A0 FontPath=A0=
=A0=A0=A0=A0=A0=A0 &quot;/usr/share/fonts/misc&quot;<br>
=A0=A0=A0 FontPath=A0=A0=A0=A0=A0=A0=A0 &quot;/usr/share/fonts/100dpi:unsca=
led&quot;<br>=A0=A0=A0 FontPath=A0=A0=A0=A0=A0=A0=A0 &quot;/usr/share/fonts=
/75dpi:unscaled&quot;<br>=A0=A0=A0 FontPath=A0=A0=A0=A0=A0=A0=A0 &quot;/usr=
/share/fonts/TTF&quot;<br>=A0=A0=A0 FontPath=A0=A0=A0=A0=A0=A0=A0 &quot;/us=
r/share/fonts/Type1&quot;<br>
EndSection<br><br>Section &quot;Module&quot;<br>=A0=A0=A0 Load=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 &quot;dbe&quot;<br>=A0=A0=A0 Load=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 &quot;dri2&quot;<br>=A0=A0=A0 Load=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
&quot;glx&quot;<br>=A0=A0=A0 Load=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &quot;extmo=
d&quot;<br>EndSection<br><br>
Section &quot;ServerFlags&quot;<br>=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0=
 &quot;AllowEmptyInput&quot; &quot;False&quot;<br>=A0=A0=A0 Option=A0=A0=A0=
=A0=A0=A0=A0=A0 &quot;AutoAddDevices&quot; &quot;False&quot;<br>=A0=A0=A0 O=
ption=A0=A0=A0=A0=A0=A0=A0=A0 &quot;AutoEnableDevices&quot; &quot;False&quo=
t;<br>
=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;DontZap&quot; &quot;False&qu=
ot;<br>EndSection<br>Section &quot;InputDevice&quot;<br>=A0=A0=A0 Identifie=
r=A0=A0=A0=A0 &quot;Keyboard0&quot;<br>=A0=A0=A0 Driver=A0=A0=A0=A0=A0=A0=
=A0=A0 &quot;kbd&quot;<br>=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;Xk=
bLayout&quot; &quot;gb&quot;<br>
EndSection<br><br>Section &quot;InputDevice&quot;<br>=A0=A0=A0 Identifier=
=A0=A0=A0=A0 &quot;Mouse0&quot;<br>=A0=A0=A0 Driver=A0=A0=A0=A0=A0=A0=A0=A0=
 &quot;mouse&quot;<br>=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;Protoc=
ol&quot; &quot;auto&quot;<br>=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot=
;Device&quot; &quot;/dev/input/mice&quot;<br>
=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;ZAxisMapping&quot; &quot;4 5=
 6 7&quot;<br>EndSection<br><br>Section &quot;Monitor&quot;<br>=A0=A0=A0 Id=
entifier=A0=A0=A0=A0 &quot;horizontal&quot;<br>=A0=A0=A0 VendorName=A0=A0=
=A0=A0 &quot;Samsung&quot;<br>=A0=A0=A0 ModelName=A0=A0=A0=A0=A0 &quot;Sams=
ung SyncMaster P2050&quot;<br>
=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;PreferredMode&quot; &quot;16=
00x900_60.00&quot;<br>EndSection<br><br>Section &quot;Monitor&quot;<br>=A0=
=A0=A0 Identifier=A0=A0=A0=A0 &quot;vertical&quot;<br>=A0=A0=A0 VendorName=
=A0=A0=A0=A0 &quot;Unknown&quot;<br>=A0=A0=A0 ModelName=A0=A0=A0=A0=A0 &quo=
t;Samsung SyncMaster&quot;<br>
=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;PreferredMode&quot; &quot;16=
00x900_60.00&quot;<br>=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;LeftOf=
&quot; &quot;horizontal&quot;<br>EndSection<br><br>Section &quot;Device&quo=
t;<br>=A0=A0=A0 Identifier=A0=A0=A0=A0 &quot;GF9&quot;<br>
=A0=A0=A0 Driver=A0=A0=A0=A0=A0=A0=A0=A0 &quot;nouveau&quot;<br>=A0=A0=A0 V=
endorName=A0=A0=A0=A0 &quot;NVIDIA Corporation&quot;<br>=A0=A0=A0 BoardName=
=A0=A0=A0=A0=A0 &quot;GeForce 9500 GT&quot;<br>=A0=A0=A0 BusID=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 &quot;PCI:1:0:0&quot;<br>=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=
=A0=A0 &quot;Monitor-DVI-I-1&quot; &quot;horizontal&quot;<br>
=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;Monitor-DVI-I-2&quot; &quot;=
vertical&quot;<br>EndSection<br><br>Section &quot;Screen&quot;<br>=A0=A0=A0=
 Identifier=A0=A0=A0=A0 &quot;Screen0&quot;<br>=A0=A0=A0 Device=A0=A0=A0=A0=
=A0=A0=A0=A0 &quot;GF9&quot;<br>=A0=A0=A0 Monitor=A0=A0=A0=A0=A0=A0=A0 &quo=
t;horizontal&quot;<br>
=A0=A0=A0 DefaultDepth=A0=A0=A0 24<br>=A0=A0=A0 SubSection=A0=A0=A0=A0 &quo=
t;Display&quot;<br>=A0=A0=A0=A0=A0=A0=A0 Depth=A0=A0=A0=A0=A0=A0 24<br>=A0=
=A0=A0 EndSubSection<br>=A0=A0=A0 Option=A0=A0=A0=A0=A0=A0=A0=A0 &quot;AIGL=
X&quot; &quot;false&quot;<br>EndSection<br>

--00163641798fa21792047c80b161--

--===============1647755705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1647755705==--

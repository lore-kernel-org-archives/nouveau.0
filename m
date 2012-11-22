From: Tyler Durden <tylerdu-8Y23ZgqdBYRBDLzU/O5InQ@public.gmane.org>
Subject: Re: Display not refreshing when not moving mouse
Date: Thu, 22 Nov 2012 01:22:51 +0100
Message-ID: <50AD705B.4030809@bounced.me>
References: <50AAAB83.10301@bounced.me>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020702010603070007090309"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <50AAAB83.10301-8Y23ZgqdBYRBDLzU/O5InQ@public.gmane.org>
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
--------------020702010603070007090309
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 19.11.2012 22:58, Tyler Durden wrote:
> Dear nouveau developers and users!
>
> After many years of dealing with the blob in my kernel, I decided it was time to move to an open source solution. With one of my machines, equipped with 9500GT it went almost flawlessly. I had to patch kernel to get GLXVBlank option working (only because I used the latest and greatest 3.7-rc6), but that is all, and I'm very happy with the result. Nouveau on that particular machine runs really great!
>
> But, after many hours of fighting I must ask for help with another machine, which has 9600GT in it. I'm stuck on a very strange problem, where display doesn't refresh (everything stops) until I move the mouse. Terminal with vmstat 1 in it stops refreshing, video stops, glxgears stops, everything. If I drag mouse around frantically, screen refreshes normally.
>

Update:

- tried various kernel boot params (nohz=off, noacpi...) - didn't help
- tried putting known good 9500GT in - now that one won't work correctly
- tried booting older kernels to see if bug was introduced recently - nope
- tried upgrading libdrm & xserver-xorg-video-nouveau userspace parts - 
didn't help (with mixed results, I also got some new errors :()

Finally, I concentrated on the specific X11 configuration I'm using 
(should've done that earlier). I adapted it from the official 
http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop page, just 
slightly simplified it, so I wasn't suspecting it until today.

I have two LCD's connected to the video card, one to DVI and the other 
one to HDMI connector. They're configured as two X screens (:0.0 & :0.1) 
one beside another (horizontally). And that part is what is causing 
trouble. Having two screens! As soon as I comment out Screen 1 
declaration in ServerLayout section, X becomes usable. But of course, 
now I have only one screen and both monitors are displaying same content 
which is not what I want.

I also noticed that I have /sys/class/drm/card0-HDMI-A-1, but I have to 
use HDMI-1 (not HDMI-A-1) in the configuration, otherwise X segfaults. I 
don't know if that's important.

Can anybody reproduce the bug? I'm attaching my full xorg.conf.

-- 
Tyler

--------------020702010603070007090309
Content-Type: text/plain; charset=UTF-8;
 name="xorg.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="xorg.conf"

Section "ServerLayout"
	Identifier	"Layout0"
	Screen	0	"Screen0"
	Screen	1	"Screen1"		RightOf		"Screen0"
	InputDevice	"Keyboard0"
	InputDevice	"Mouse0"
EndSection

Section "ServerFlags"
	Option		"AutoAddDevices"	"false"
	Option		"AllowEmptyInput"	"false"
EndSection

Section "Screen"
	Identifier	"Screen0"
	Device		"Device0"
	DefaultDepth	24
	SubSection "Display"
		Depth	24
		Modes	"1920x1080"
	EndSubSection
EndSection

Section "Screen"
	Identifier	"Screen1"
	Device		"Device1"
	DefaultDepth	24
	SubSection "Display"
		Depth	24
		Modes	"1920x1080"
	EndSubSection
EndSection

Section "Device"
	Identifier	"Device0"
	Driver		"nouveau"
	Option		"ZaphodHeads"		"DVI-I-1"
	Option		"GLXVBlank"		"true"
	Screen		0
EndSection

Section "Device"
	Identifier	"Device1"
	Driver		"nouveau"
	Option		"ZaphodHeads"		"HDMI-1"
	Option		"GLXVBlank"		"true"
	Screen		1
EndSection

Section "InputDevice"
	Identifier	"Keyboard0"
	Driver		"kbd"
	Option		"CoreKeyboard"
	Option		"AutoRepeat"		"250 30"
	Option		"XkbLayout"		"hr"
	Option		"XkbVariant"		"us"
	Option		"XkbOptions"	"terminate:ctrl_alt_bksp,compose:menu"
EndSection

Section "InputDevice"
	Identifier	"Mouse0"
	Driver		"mouse"
	Option		"CorePointer"
	Option		"SendCoreEvents"	"true"
	Option		"Device"		"/dev/input/mice"
	Option		"Protocol"		"ImPS/2"
	Option		"Emulate3Buttons"	"false"
	Option		"ZAxisMapping"		"4 5"
EndSection

--------------020702010603070007090309
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------020702010603070007090309--

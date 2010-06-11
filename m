From: Adrian Popa <adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org>
Subject: Re: Enabling TV-out with the nouveau driver
Date: Fri, 11 Jun 2010 17:42:18 +0300
Message-ID: <4C124B4A.5040407@romtelecom.ro>
References: <4C10A1F8.4010107@romtelecom.ro>
	<87k4q7mavl.fsf@riseup.net>	<4C11CC42.3000705@romtelecom.ro>
	<878w6lnbuz.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <878w6lnbuz.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello Francisco,

You were right - the monitor name was wrong in that section. I replaced 
Monitor0 with VGA-1 and it worked just fine. Thank you a lot for your help!

Regards,
Adrian

On 06/11/2010 12:43 PM, Francisco Jerez wrote:
> Hi,
>
> Adrian Popa<adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org>  writes:
>
>    
>> Hello,
>>
>> I've checked and i have a GeForce 4 MX 440, and i do see a TV-1 in xrandr but I didn't manage to configure it
>> with xrandr.
>>
>> I've looked over [2] and by using xrandr --output TV-1 --right-of VGA-1 i managed to extend my desktop to my
>> TV. Also, i see the window transparency effect keeps working ;)
>>
>> The problem is  - I tried to configure xorg.conf but I didn't manage to add the displays side by side (the TV
>> overlaps with the monitor from the top-left corner), even if they have different resolutions. I have attached
>> my xorg.conf for reference. I realize I must be missing something trivial in the configuration. Anyone care to
>> point it out?
>>
>> Thanks,
>> Adrian
>>
>> Section "ServerLayout"
>> 	Identifier     "X.org Configured"
>> 	Screen      0  "Screen0" 0 0
>> 	InputDevice    "Mouse0" "CorePointer"
>> 	InputDevice    "Keyboard0" "CoreKeyboard"
>> EndSection
>>
>> Section "Files"
>> 	ModulePath   "/usr/lib/xorg/modules"
>> 	FontPath     "/usr/share/fonts/X11/misc"
>> 	FontPath     "/usr/share/fonts/X11/cyrillic"
>> 	FontPath     "/usr/share/fonts/X11/100dpi/:unscaled"
>> 	FontPath     "/usr/share/fonts/X11/75dpi/:unscaled"
>> 	FontPath     "/usr/share/fonts/X11/Type1"
>> 	FontPath     "/usr/share/fonts/X11/100dpi"
>> 	FontPath     "/usr/share/fonts/X11/75dpi"
>> 	FontPath     "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType"
>> 	FontPath     "built-ins"
>> EndSection
>>
>> Section "Module"
>> 	Load  "record"
>> 	Load  "dri2"
>> 	Load  "dri"
>> 	Load  "glx"
>> 	Load  "extmod"
>> 	Load  "dbe"
>> EndSection
>>
>>      
> You probably don't need any of the last two sections.
>
>    
>> Section "InputDevice"
>> 	Identifier  "Keyboard0"
>> 	Driver      "kbd"
>> EndSection
>>
>> Section "InputDevice"
>> 	Identifier  "Mouse0"
>> 	Driver      "mouse"
>> 	Option	    "Protocol" "auto"
>> 	Option	    "Device" "/dev/input/mice"
>> 	Option	    "ZAxisMapping" "4 5 6 7"
>> EndSection
>>
>> Section "Monitor"
>> 	Identifier   "VGA-1"
>>      
>    
>> 	DisplaySize	  340   270	# mm
>> 	VendorName   "NEC"
>> 	ModelName    "LCD72VM"
>> 	HorizSync    31.0 - 81.0
>> 	VertRefresh  56.0 - 75.0
>> 	Option	    "DPMS"
>>      
> You shouldn't need any of the options above.
>
>    
>> EndSection
>>
>> Section "Monitor"
>> 	Identifier   "TV-1"
>> 	Option "RightOf" "Monitor0"
>>      
> The "Monitor0" identifier is wrong, I guess you meant "VGA-1".
>
>    
>>          HorizSync    30-50
>> 	VertRefresh  60
>> 	# 720x576 @ 50Hz, 31.25kHz, itu-r bt.1358 625/50/p/1:1, RGB, YPbPr, HDMI
>> 	ModeLine "720x576@50"  27     720 732 795 864  576 581 586 625 -hsync -vsync
>> 	# nonstandard PAL (Works with BOB deinterlace) It is 60Hz but works well with nVIDIA PAL-B TV-OUT
>> 	# Nvidia option: Option "TVStandard" "PAL-B"
>> 	ModeLine "720x576@60" 32.7  720 744 816 912  576 577 580 597
>>
>> 	# This modeline is 50Hz interlaced and works well with kerneldeint:
>> 	ModeLine "720x576i" 13.875  720 744 808 888  576 581 586 625 -hsync -vsync interlace
>> 	
>>      
> You shouldn't need to set any timings manually.
>
>    
>> EndSection	
>> Section "Device"
>>          ### Available Driver options are:-
>>          ### Values:<i>: integer,<f>: float,<bool>: "True"/"False",
>>          ###<string>: "String",<freq>: "<f>  Hz/kHz/MHz"
>>          ### [arg]: arg optional
>>          #Option     "SWcursor"           	# [<bool>]
>>          #Option     "HWcursor"           	# [<bool>]
>>          #Option     "NoAccel"            	# [<bool>]
>>          #Option     "ShadowFB"           	# [<bool>]
>>          #Option     "UseFBDev"           	# [<bool>]
>>          #Option     "Rotate"             	# [<str>]
>>          #Option     "VideoKey"           	#<i>
>>          #Option     "FlatPanel"          	# [<bool>]
>>          #Option     "FPDither"           	# [<bool>]
>>          #Option     "CrtcNumber"         	#<i>
>>          #Option     "FPScale"            	# [<bool>]
>>          #Option     "FPTweak"            	#<i>
>>          #Option     "DualHead"   "True"        	# [<bool>]
>> 	Identifier  "Card0"
>> 	Driver      "nouveau"
>> 	VendorName  "nVidia Corporation"
>> 	BoardName   "NV18 [GeForce4 MX 440 AGP 8x]"
>> 	BusID       "PCI:2:0:0"
>> 	Option	    "Monitor-VGA-1" "VGA-1"
>> 	Option	    "Monitor-TV-1" "TV-1"
>> EndSection
>>
>> Section "Screen"
>> 	Identifier "Screen0"
>> 	Device     "Card0"
>> 	#Monitor    "Monitor0"
>> 	SubSection "Display"
>> 		Viewport   0 0
>> 		Depth     1
>> 	EndSubSection
>> 	SubSection "Display"
>> 		Viewport   0 0
>> 		Depth     4
>> 	EndSubSection
>> 	SubSection "Display"
>> 		Viewport   0 0
>> 		Depth     8
>> 	EndSubSection
>> 	SubSection "Display"
>> 		Viewport   0 0
>> 		Depth     15
>> 	EndSubSection
>> 	SubSection "Display"
>> 		Viewport   0 0
>> 		Depth     16
>> 	EndSubSection
>> 	SubSection "Display"
>> 		Viewport   0 0
>> 		Depth     24
>> 	EndSubSection
>> EndSection
>>
>>      


-- 
---
Adrian Popa
NOC Division
Network Engineer
Divizia Centrul National de Operare Retea
Departament Transport IP&  Metro
Compartiment IP Core&  Backbone
Phone: +40 21 400 3099

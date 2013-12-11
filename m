From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63481] [NV1A] No monitor signal since commit
 ebb945a94 (3.7-rc1)
Date: Wed, 11 Dec 2013 17:55:20 +0000
Message-ID: <bug-63481-8800-E86fSBsR13@http.bugs.freedesktop.org/>
References: <bug-63481-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0712974579=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63481-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0712974579==
Content-Type: multipart/alternative; boundary="1386784521.e5be3.2174"; charset="us-ascii"


--1386784521.e5be3.2174
Date: Wed, 11 Dec 2013 17:55:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63481

Claudio Laurita <claudio.laurita-M5v4ZxuNeFcZZnwohOMWHxTCRG1Z5fos@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #5 from Claudio Laurita <claudio.laurita-M5v4ZxuNeFcZZnwohOMWHxTCRG1Z5fos@public.gmane.org> ---
I'm experiencing the same problem on a debian kernel 3.11-0.bpo.2-486.
(I think it could be the same)
These are the relevant lines in Xorg.0.log

[    21.460] (II) NOUVEAU driver Date:   Thu Nov 7 14:56:48 2013 +1000
[    21.460] (II) NOUVEAU driver for NVIDIA chipset families :
[    21.467] (--) NOUVEAU(0): Chipset: "NVIDIA NV1A"
[    21.467] (II) NOUVEAU(0): Creating default Display subsection in Screen
section
[    21.467] (==) NOUVEAU(0): Depth 16, (--) framebuffer bpp 16
[    21.467] (==) NOUVEAU(0): RGB weight 565
[    21.467] (==) NOUVEAU(0): Default visual is TrueColor
[    21.467] (==) NOUVEAU(0): Using HW cursor
[    21.467] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    21.467] (==) NOUVEAU(0): Page flipping enabled
[    21.467] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[    21.590] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    21.690] (II) NOUVEAU(0): EDID for output DVI-I-1
[    21.690] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    21.690] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    21.690] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    21.690] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz e)
[    21.690] (II) NOUVEAU(0): Modeline "848x480"x60.0   33.75  848 864 976 1088
 480 486 494 517 +hsync +vsync (31.0 kHz e)
[    21.690] (II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800 
480 489 492 525 -hsync -vsync (31.5 kHz e)
[    21.690] (II) NOUVEAU(0): Output DVI-I-1 connected
[    21.690] (II) NOUVEAU(0): Using exact sizes for initial modes
[    21.690] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1024x768
[    21.690] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    21.690] (--) NOUVEAU(0): Virtual size is 1024x768 (pitch 0)
[    21.690] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[    21.690] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    21.690] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[    21.690] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    21.690] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0
MHz), 35.2 kHz, 56.2 Hz
[    21.690] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz e)
[    21.690] (**) NOUVEAU(0):  Driver mode "848x480": 33.8 MHz (scaled from 0.0
MHz), 31.0 kHz, 60.0 Hz
[    21.691] (II) NOUVEAU(0): Modeline "848x480"x60.0   33.75  848 864 976 1088
 480 486 494 517 +hsync +vsync (31.0 kHz e)
[    21.691] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 59.9 Hz
[    21.691] (II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800 
480 489 492 525 -hsync -vsync (31.5 kHz e)
[    21.691] (==) NOUVEAU(0): DPI set to (96, 96)
[    21.720] (II) NOUVEAU(0): Opened GPU channel 0
[    21.732] (II) NOUVEAU(0): [DRI2] Setup complete
[    21.732] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[    21.732] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau_vieux
[    21.801] (==) NOUVEAU(0): Backing store disabled
[    21.801] (==) NOUVEAU(0): Silken mouse enabled
[    21.803] (==) NOUVEAU(0): DPMS enabled
[    21.803] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    22.934] (II) NOUVEAU(0): NVEnterVT is called.
[    22.955] (II) NOUVEAU(0): Setting screen physical size to 270 x 203

The monitor is driven with wrong frequencies (as stated by an osd message).
The strange is that the monitor is connected to a VGA, not DVI (no DVI is
present at all)

Tell me if I can help someway
Thank you
Claudio

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386784521.e5be3.2174
Date: Wed, 11 Dec 2013 17:55:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:claudio.laurita&#64;integrazionetotale.it" title="Claudio Laurita &lt;claudio.laurita&#64;integrazionetotale.it&gt;"> <span class="fn">Claudio Laurita</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV1A] No monitor signal since commit ebb945a94 (3.7-rc1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63481">bug 63481</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV1A] No monitor signal since commit ebb945a94 (3.7-rc1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63481#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV1A] No monitor signal since commit ebb945a94 (3.7-rc1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63481">bug 63481</a>
              from <span class="vcard"><a class="email" href="mailto:claudio.laurita&#64;integrazionetotale.it" title="Claudio Laurita &lt;claudio.laurita&#64;integrazionetotale.it&gt;"> <span class="fn">Claudio Laurita</span></a>
</span></b>
        <pre>I'm experiencing the same problem on a debian kernel 3.11-0.bpo.2-486.
(I think it could be the same)
These are the relevant lines in Xorg.0.log

[    21.460] (II) NOUVEAU driver Date:   Thu Nov 7 14:56:48 2013 +1000
[    21.460] (II) NOUVEAU driver for NVIDIA chipset families :
[    21.467] (--) NOUVEAU(0): Chipset: &quot;NVIDIA NV1A&quot;
[    21.467] (II) NOUVEAU(0): Creating default Display subsection in Screen
section
[    21.467] (==) NOUVEAU(0): Depth 16, (--) framebuffer bpp 16
[    21.467] (==) NOUVEAU(0): RGB weight 565
[    21.467] (==) NOUVEAU(0): Default visual is TrueColor
[    21.467] (==) NOUVEAU(0): Using HW cursor
[    21.467] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    21.467] (==) NOUVEAU(0): Page flipping enabled
[    21.467] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[    21.590] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    21.690] (II) NOUVEAU(0): EDID for output DVI-I-1
[    21.690] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    21.690] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    21.690] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    21.690] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz e)
[    21.690] (II) NOUVEAU(0): Modeline &quot;848x480&quot;x60.0   33.75  848 864 976 1088
 480 486 494 517 +hsync +vsync (31.0 kHz e)
[    21.690] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x59.9   25.18  640 656 752 800 
480 489 492 525 -hsync -vsync (31.5 kHz e)
[    21.690] (II) NOUVEAU(0): Output DVI-I-1 connected
[    21.690] (II) NOUVEAU(0): Using exact sizes for initial modes
[    21.690] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1024x768
[    21.690] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    21.690] (--) NOUVEAU(0): Virtual size is 1024x768 (pitch 0)
[    21.690] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[    21.690] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    21.690] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[    21.690] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    21.690] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 36.0 MHz (scaled from 0.0
MHz), 35.2 kHz, 56.2 Hz
[    21.690] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz e)
[    21.690] (**) NOUVEAU(0):  Driver mode &quot;848x480&quot;: 33.8 MHz (scaled from 0.0
MHz), 31.0 kHz, 60.0 Hz
[    21.691] (II) NOUVEAU(0): Modeline &quot;848x480&quot;x60.0   33.75  848 864 976 1088
 480 486 494 517 +hsync +vsync (31.0 kHz e)
[    21.691] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 59.9 Hz
[    21.691] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x59.9   25.18  640 656 752 800 
480 489 492 525 -hsync -vsync (31.5 kHz e)
[    21.691] (==) NOUVEAU(0): DPI set to (96, 96)
[    21.720] (II) NOUVEAU(0): Opened GPU channel 0
[    21.732] (II) NOUVEAU(0): [DRI2] Setup complete
[    21.732] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[    21.732] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau_vieux
[    21.801] (==) NOUVEAU(0): Backing store disabled
[    21.801] (==) NOUVEAU(0): Silken mouse enabled
[    21.803] (==) NOUVEAU(0): DPMS enabled
[    21.803] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    22.934] (II) NOUVEAU(0): NVEnterVT is called.
[    22.955] (II) NOUVEAU(0): Setting screen physical size to 270 x 203

The monitor is driven with wrong frequencies (as stated by an osd message).
The strange is that the monitor is connected to a VGA, not DVI (no DVI is
present at all)

Tell me if I can help someway
Thank you
Claudio</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386784521.e5be3.2174--

--===============0712974579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0712974579==--

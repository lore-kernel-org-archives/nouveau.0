From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Mon, 23 Mar 2015 08:21:58 +0000
Message-ID: <bug-89558-8800-Cqvj1rBV8v@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0832399250=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0832399250==
Content-Type: multipart/alternative; boundary="1427098918.EDCD5F2.1173"; charset="UTF-8"


--1427098918.EDCD5F2.1173
Date: Mon, 23 Mar 2015 08:21:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

SMF <smf.linux-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #114524|0                           |1
        is obsolete|                            |
 Attachment #114534|0                           |1
        is obsolete|                            |
 Attachment #114537|0                           |1
        is obsolete|                            |
 Attachment #114538|0                           |1
        is obsolete|                            |

--- Comment #11 from SMF <smf.linux-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
Created attachment 114543
  --> https://bugs.freedesktop.org/attachment.cgi?id=114543&action=edit
filtered syslog

with the nvidiafb out of the way the git nouveau driver is now functional. The
dmesg output itself is full of the error messages so I have attached my debug
filtered syslog file instead. Below is my info/notice/warning data filtered
from syslog showing the general startup information from the nouveau module.

Mar 23 07:29:15 Mars kernel: [    0.000000] Kernel command line:
BOOT_IMAGE=/vmlinuz-3.19.2T ro root=/dev/sda7 video.use_native_backlight=1
nouveau.debug=debug
Mar 23 07:29:15 Mars kernel: [    3.111900] nouveau 0000:03:00.0: enabling
device (0006 -> 0007)
Mar 23 07:29:15 Mars kernel: [    3.112067] nouveau  [  DEVICE][0000:03:00.0]
BOOT0  : 0x118010a2
Mar 23 07:29:15 Mars kernel: [    3.112069] nouveau  [  DEVICE][0000:03:00.0]
Chipset: GM107 (NV118)
Mar 23 07:29:15 Mars kernel: [    3.112071] nouveau  [  DEVICE][0000:03:00.0]
Family : NV110
Mar 23 07:29:15 Mars kernel: [    3.120871] nouveau  [   VBIOS][0000:03:00.0]
using image from ACPI
Mar 23 07:29:15 Mars kernel: [    3.120935] nouveau  [   VBIOS][0000:03:00.0]
BIT signature found
Mar 23 07:29:15 Mars kernel: [    3.120939] nouveau  [   VBIOS][0000:03:00.0]
version 82.08.13.00.1c
Mar 23 07:29:15 Mars kernel: [    3.121246] nouveau  [     PMC][0000:03:00.0]
MSI interrupts enabled
Mar 23 07:29:15 Mars kernel: [    3.121306] nouveau  [     PFB][0000:03:00.0]
RAM type: DDR3
Mar 23 07:29:15 Mars kernel: [    3.121308] nouveau  [     PFB][0000:03:00.0]
RAM size: -1159778304 MiB
Mar 23 07:29:15 Mars kernel: [    3.121310] nouveau  [     PFB][0000:03:00.0]  
 ZCOMP: 0 tags
Mar 23 07:29:15 Mars kernel: [    3.160212] nouveau  [  PTHERM][0000:03:00.0]
FAN control: none / external
Mar 23 07:29:15 Mars kernel: [    3.160227] nouveau  [  PTHERM][0000:03:00.0]
internal sensor: no
Mar 23 07:29:15 Mars kernel: [    3.160285] nouveau  [     CLK][0000:03:00.0]
07: core 405 MHz memory 810 MHz 
Mar 23 07:29:15 Mars kernel: [    3.160719] nouveau  [     CLK][0000:03:00.0]
0a: core 270-1124 MHz memory 1600 MHz 
Mar 23 07:29:15 Mars kernel: [    3.161171] nouveau  [     CLK][0000:03:00.0]
0f: core 270-1124 MHz memory 2002 MHz 
Mar 23 07:29:15 Mars kernel: [    3.161324] nouveau  [     CLK][0000:03:00.0]
--: core 13 MHz  
Mar 23 07:29:15 Mars kernel: [    3.192088] nouveau  [     DRM] VRAM:
-1159778304 MiB
Mar 23 07:29:15 Mars kernel: [    3.192089] nouveau  [     DRM] GART: 1048576
MiB
Mar 23 07:29:15 Mars kernel: [    3.192103] nouveau  [     DRM] DCB version 4.0
Mar 23 07:29:15 Mars kernel: [    7.210976] nouveau  [     DRM] MM: using COPY
for buffer copies
Mar 23 07:29:15 Mars kernel: [    7.210993] [drm] Initialized nouveau 1.2.2
20120801 for 0000:03:00.0 on minor 1

One final point I did originally add an "if" statement to change the
device->cname to report GM108 in gm100.c I have now removed that and just added
the 0x118 case statement as originally suggested, sorry.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427098918.EDCD5F2.1173
Date: Mon, 23 Mar 2015 08:21:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:smf.linux&#64;ntlworld.com" title="SMF &lt;smf.linux&#64;ntlworld.com&gt;"> <span class="fn">SMF</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #114524 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #114534 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #114537 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #114538 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:smf.linux&#64;ntlworld.com" title="SMF &lt;smf.linux&#64;ntlworld.com&gt;"> <span class="fn">SMF</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=114543" name="attach_114543" title="filtered syslog">attachment 114543</a> <a href="attachment.cgi?id=114543&amp;action=edit" title="filtered syslog">[details]</a></span>
filtered syslog

with the nvidiafb out of the way the git nouveau driver is now functional. The
dmesg output itself is full of the error messages so I have attached my debug
filtered syslog file instead. Below is my info/notice/warning data filtered
from syslog showing the general startup information from the nouveau module.

Mar 23 07:29:15 Mars kernel: [    0.000000] Kernel command line:
BOOT_IMAGE=/vmlinuz-3.19.2T ro root=/dev/sda7 video.use_native_backlight=1
nouveau.debug=debug
Mar 23 07:29:15 Mars kernel: [    3.111900] nouveau 0000:03:00.0: enabling
device (0006 -&gt; 0007)
Mar 23 07:29:15 Mars kernel: [    3.112067] nouveau  [  DEVICE][0000:03:00.0]
BOOT0  : 0x118010a2
Mar 23 07:29:15 Mars kernel: [    3.112069] nouveau  [  DEVICE][0000:03:00.0]
Chipset: GM107 (NV118)
Mar 23 07:29:15 Mars kernel: [    3.112071] nouveau  [  DEVICE][0000:03:00.0]
Family : NV110
Mar 23 07:29:15 Mars kernel: [    3.120871] nouveau  [   VBIOS][0000:03:00.0]
using image from ACPI
Mar 23 07:29:15 Mars kernel: [    3.120935] nouveau  [   VBIOS][0000:03:00.0]
BIT signature found
Mar 23 07:29:15 Mars kernel: [    3.120939] nouveau  [   VBIOS][0000:03:00.0]
version 82.08.13.00.1c
Mar 23 07:29:15 Mars kernel: [    3.121246] nouveau  [     PMC][0000:03:00.0]
MSI interrupts enabled
Mar 23 07:29:15 Mars kernel: [    3.121306] nouveau  [     PFB][0000:03:00.0]
RAM type: DDR3
Mar 23 07:29:15 Mars kernel: [    3.121308] nouveau  [     PFB][0000:03:00.0]
RAM size: -1159778304 MiB
Mar 23 07:29:15 Mars kernel: [    3.121310] nouveau  [     PFB][0000:03:00.0]  
 ZCOMP: 0 tags
Mar 23 07:29:15 Mars kernel: [    3.160212] nouveau  [  PTHERM][0000:03:00.0]
FAN control: none / external
Mar 23 07:29:15 Mars kernel: [    3.160227] nouveau  [  PTHERM][0000:03:00.0]
internal sensor: no
Mar 23 07:29:15 Mars kernel: [    3.160285] nouveau  [     CLK][0000:03:00.0]
07: core 405 MHz memory 810 MHz 
Mar 23 07:29:15 Mars kernel: [    3.160719] nouveau  [     CLK][0000:03:00.0]
0a: core 270-1124 MHz memory 1600 MHz 
Mar 23 07:29:15 Mars kernel: [    3.161171] nouveau  [     CLK][0000:03:00.0]
0f: core 270-1124 MHz memory 2002 MHz 
Mar 23 07:29:15 Mars kernel: [    3.161324] nouveau  [     CLK][0000:03:00.0]
--: core 13 MHz  
Mar 23 07:29:15 Mars kernel: [    3.192088] nouveau  [     DRM] VRAM:
-1159778304 MiB
Mar 23 07:29:15 Mars kernel: [    3.192089] nouveau  [     DRM] GART: 1048576
MiB
Mar 23 07:29:15 Mars kernel: [    3.192103] nouveau  [     DRM] DCB version 4.0
Mar 23 07:29:15 Mars kernel: [    7.210976] nouveau  [     DRM] MM: using COPY
for buffer copies
Mar 23 07:29:15 Mars kernel: [    7.210993] [drm] Initialized nouveau 1.2.2
20120801 for 0000:03:00.0 on minor 1

One final point I did originally add an &quot;if&quot; statement to change the
device-&gt;cname to report GM108 in gm100.c I have now removed that and just added
the 0x118 case statement as originally suggested, sorry.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427098918.EDCD5F2.1173--

--===============0832399250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0832399250==--

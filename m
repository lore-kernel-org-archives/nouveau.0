From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52244] [ 4.876531] [drm] nouveau 0000:01:00.0: GPU
 lockup - switching to software fbcon
Date: Sat, 27 Oct 2012 20:26:29 +0000
Message-ID: <bug-52244-8800-r9xsd2bfpl@http.bugs.freedesktop.org/>
References: <bug-52244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0315104443=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-52244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0315104443==
Content-Type: multipart/alternative; boundary="1351369589.3cDA3.5060"; charset="us-ascii"


--1351369589.3cDA3.5060
Date: Sat, 27 Oct 2012 20:26:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=52244

Kevin Martin <ktmdms-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |---

--- Comment #17 from Kevin Martin <ktmdms-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Still occurs under kernel 3.7:

[    4.787773] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a3880a2
[    4.789963] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT215 (NVA3)
[    4.790141] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    4.793661] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    4.948004] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    4.948204] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    4.948637] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    4.948824] nouveau  [   VBIOS][0000:01:00.0] version 70.15.43.00
[    4.998607] nouveau  [     MXM][0000:01:00.0] no VBIOS data, nothing to do
[    4.998859] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    4.999110] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    5.038919] nouveau  [     DRM] VRAM: 1024 MiB
[    5.039095] nouveau  [     DRM] GART: 512 MiB
[    5.039262] nouveau  [     DRM] BIT BIOS found
[    5.039428] nouveau  [     DRM] Bios version 70.15.43.00
[    5.039594] nouveau  [     DRM] TMDS table version 2.0
[    5.039757] nouveau  [     DRM] DCB version 4.0
[    5.039933] nouveau  [     DRM] DCB outp 00: 01000323 00010034
[    5.040106] nouveau  [     DRM] DCB outp 01: 02014300 00000000
[    5.040274] nouveau  [     DRM] DCB outp 02: 02021362 00020010
[    5.040444] nouveau  [     DRM] DCB outp 03: 080333c6 0f220010
[    5.040611] nouveau  [     DRM] DCB outp 04: 08033382 00020010
[    5.040780] nouveau  [     DRM] DCB conn 00: 00000340
[    5.041031] nouveau  [     DRM] DCB conn 01: 00001061
[    5.041273] nouveau  [     DRM] DCB conn 02: 00000147
[    5.041510] nouveau  [     DRM] DCB conn 03: 00202346
[    5.041744] nouveau  [     DRM] DCB conn 04: 00000400
[    5.041989] nouveau  [     DRM] DCB conn 05: 00000210
[    5.042229] nouveau  [     DRM] DCB conn 06: 00000211
[    5.042468] nouveau  [     DRM] DCB conn 07: 00000213
[    5.042705] nouveau  [     DRM] DCB conn 08: 00020846
[    5.042948] nouveau  [     DRM] DCB conn 09: 00000900
[    5.083956] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[    6.448619] nouveau  [     DRM] 3 available performance level(s)
[    6.448821] nouveau  [     DRM] 0: core 135MHz shader 270MHz memory 135MHz
voltage 800mV
[    6.449110] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 324MHz
voltage 850mV
[    6.449395] nouveau  [     DRM] 3: core 576MHz shader 1436MHz memory 1600MHz
voltage 1050mV
[    6.449720] nouveau  [     DRM] c: core 405MHz shader 810MHz memory 324MHz
voltage 850mV
[    6.506727] nouveau  [     DRM] MM: using COPY for buffer copies
[    6.664752] nouveau  [     DRM] allocated 1680x945 fb: 0xd0000, bo
ffff88012d5d3f60
[    6.665561] fbcon: nouveaufb (fb0) is primary device
[    7.130142] nouveau E[     DRM] GPU lockup - switching to software fbcon
[    7.138026] fb0: nouveaufb frame buffer device
[    7.138116] [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351369589.3cDA3.5060
Date: Sat, 27 Oct 2012 20:26:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ktmdms&#64;gmail.com" title="Kevin Martin &lt;ktmdms&#64;gmail.com&gt;"> <span class="fn">Kevin Martin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [ 4.876531] [drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52244">bug 52244</a>
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
           <td>WORKSFORME
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [ 4.876531] [drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52244#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [ 4.876531] [drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52244">bug 52244</a>
              from <span class="vcard"><a class="email" href="mailto:ktmdms&#64;gmail.com" title="Kevin Martin &lt;ktmdms&#64;gmail.com&gt;"> <span class="fn">Kevin Martin</span></a>
</span></b>
        <pre>Still occurs under kernel 3.7:

[    4.787773] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a3880a2
[    4.789963] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT215 (NVA3)
[    4.790141] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    4.793661] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    4.948004] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    4.948204] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    4.948637] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    4.948824] nouveau  [   VBIOS][0000:01:00.0] version 70.15.43.00
[    4.998607] nouveau  [     MXM][0000:01:00.0] no VBIOS data, nothing to do
[    4.998859] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    4.999110] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    5.038919] nouveau  [     DRM] VRAM: 1024 MiB
[    5.039095] nouveau  [     DRM] GART: 512 MiB
[    5.039262] nouveau  [     DRM] BIT BIOS found
[    5.039428] nouveau  [     DRM] Bios version 70.15.43.00
[    5.039594] nouveau  [     DRM] TMDS table version 2.0
[    5.039757] nouveau  [     DRM] DCB version 4.0
[    5.039933] nouveau  [     DRM] DCB outp 00: 01000323 00010034
[    5.040106] nouveau  [     DRM] DCB outp 01: 02014300 00000000
[    5.040274] nouveau  [     DRM] DCB outp 02: 02021362 00020010
[    5.040444] nouveau  [     DRM] DCB outp 03: 080333c6 0f220010
[    5.040611] nouveau  [     DRM] DCB outp 04: 08033382 00020010
[    5.040780] nouveau  [     DRM] DCB conn 00: 00000340
[    5.041031] nouveau  [     DRM] DCB conn 01: 00001061
[    5.041273] nouveau  [     DRM] DCB conn 02: 00000147
[    5.041510] nouveau  [     DRM] DCB conn 03: 00202346
[    5.041744] nouveau  [     DRM] DCB conn 04: 00000400
[    5.041989] nouveau  [     DRM] DCB conn 05: 00000210
[    5.042229] nouveau  [     DRM] DCB conn 06: 00000211
[    5.042468] nouveau  [     DRM] DCB conn 07: 00000213
[    5.042705] nouveau  [     DRM] DCB conn 08: 00020846
[    5.042948] nouveau  [     DRM] DCB conn 09: 00000900
[    5.083956] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[    6.448619] nouveau  [     DRM] 3 available performance level(s)
[    6.448821] nouveau  [     DRM] 0: core 135MHz shader 270MHz memory 135MHz
voltage 800mV
[    6.449110] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 324MHz
voltage 850mV
[    6.449395] nouveau  [     DRM] 3: core 576MHz shader 1436MHz memory 1600MHz
voltage 1050mV
[    6.449720] nouveau  [     DRM] c: core 405MHz shader 810MHz memory 324MHz
voltage 850mV
[    6.506727] nouveau  [     DRM] MM: using COPY for buffer copies
[    6.664752] nouveau  [     DRM] allocated 1680x945 fb: 0xd0000, bo
ffff88012d5d3f60
[    6.665561] fbcon: nouveaufb (fb0) is primary device
[    7.130142] nouveau E[     DRM] GPU lockup - switching to software fbcon
[    7.138026] fb0: nouveaufb frame buffer device
[    7.138116] [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on
minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351369589.3cDA3.5060--

--===============0315104443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0315104443==--

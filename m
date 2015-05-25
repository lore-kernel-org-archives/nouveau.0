From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] New: HP ZBook 15 nouveau driver hangup for
 kernel >= 3.19
Date: Mon, 25 May 2015 07:16:54 +0000
Message-ID: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1575488950=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1575488950==
Content-Type: multipart/alternative; boundary="1432538214.0B3ddF2.4404"; charset="UTF-8"


--1432538214.0B3ddF2.4404
Date: Mon, 25 May 2015 07:16:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90626

            Bug ID: 90626
           Summary: HP ZBook 15 nouveau driver hangup for kernel >= 3.19
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: renda.krell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

This is not a duplicate of bug #89047, but just another bug after a driver fix.

For bug #89047 there has been obviously made the following fix:
-
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4195f40685a5f2783b4decece13ed740b61ee038

I tried this on my HP ZBook 15 using 4.1.rc4 (OpenSUSE HEAD kernel,
kernel-desktop) where this fix definitely went and run into another issue:

2015-05-25T08:26:17.054291+02:00 rkrell kernel: [    4.681436] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x108390a1
2015-05-25T08:26:17.054293+02:00 rkrell kernel: [    4.681438] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
2015-05-25T08:26:17.054293+02:00 rkrell kernel: [    4.681440] nouveau  [ 
DEVICE][0000:01:00.0] Family : NVE0
2015-05-25T08:26:17.054294+02:00 rkrell kernel: [    4.686763] nouveau  [  
VBIOS][0000:01:00.0] using image from ACPI
2015-05-25T08:26:17.054294+02:00 rkrell kernel: [    4.686921] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
2015-05-25T08:26:17.054352+02:00 rkrell kernel: [    4.686924] nouveau  [  
VBIOS][0000:01:00.0] version 80.28.52.00.09
2015-05-25T08:26:17.054353+02:00 rkrell kernel: [    4.686931] nouveau W[  
VBIOS][0000:01:00.0] DCB contains no useful data
2015-05-25T08:26:17.054356+02:00 rkrell kernel: [    4.686932] nouveau W[  
VBIOS][0000:01:00.0] DCB contains no useful data
2015-05-25T08:26:17.054356+02:00 rkrell kernel: [    4.686938] nouveau E[  
VBIOS][0000:01:00.0] 0xce73[ ]: unknown opcode 0xff
2015-05-25T08:26:17.054357+02:00 rkrell kernel: [    4.686942] nouveau E[
DEVINIT][0000:01:00.0] init failed, -22
2015-05-25T08:26:17.054357+02:00 rkrell kernel: [    4.686944] nouveau E[    
DRM] failed to create 0x00000080, -22
2015-05-25T08:26:17.054358+02:00 rkrell kernel: [    4.687221] nouveau: probe
of 0000:01:00.0 failed with error -22

The kernel still hangs up, CTRL-ALT-BACKSPACE does not work.
The BIOS of the HP ZBook 15 is set to Legacy Mode, no UEFI is used.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432538214.0B3ddF2.4404
Date: Mon, 25 May 2015 07:16:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 3.19"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626">90626</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HP ZBook 15 nouveau driver hangup for kernel &gt;= 3.19
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>renda.krell&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This is not a duplicate of <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="show_bug.cgi?id=89047">bug #89047</a>, but just another bug after a driver fix.

For <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="show_bug.cgi?id=89047">bug #89047</a> there has been obviously made the following fix:
-
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4195f40685a5f2783b4decece13ed740b61ee038">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4195f40685a5f2783b4decece13ed740b61ee038</a>

I tried this on my HP ZBook 15 using 4.1.rc4 (OpenSUSE HEAD kernel,
kernel-desktop) where this fix definitely went and run into another issue:

2015-05-25T08:26:17.054291+02:00 rkrell kernel: [    4.681436] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x108390a1
2015-05-25T08:26:17.054293+02:00 rkrell kernel: [    4.681438] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
2015-05-25T08:26:17.054293+02:00 rkrell kernel: [    4.681440] nouveau  [ 
DEVICE][0000:01:00.0] Family : NVE0
2015-05-25T08:26:17.054294+02:00 rkrell kernel: [    4.686763] nouveau  [  
VBIOS][0000:01:00.0] using image from ACPI
2015-05-25T08:26:17.054294+02:00 rkrell kernel: [    4.686921] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
2015-05-25T08:26:17.054352+02:00 rkrell kernel: [    4.686924] nouveau  [  
VBIOS][0000:01:00.0] version 80.28.52.00.09
2015-05-25T08:26:17.054353+02:00 rkrell kernel: [    4.686931] nouveau W[  
VBIOS][0000:01:00.0] DCB contains no useful data
2015-05-25T08:26:17.054356+02:00 rkrell kernel: [    4.686932] nouveau W[  
VBIOS][0000:01:00.0] DCB contains no useful data
2015-05-25T08:26:17.054356+02:00 rkrell kernel: [    4.686938] nouveau E[  
VBIOS][0000:01:00.0] 0xce73[ ]: unknown opcode 0xff
2015-05-25T08:26:17.054357+02:00 rkrell kernel: [    4.686942] nouveau E[
DEVINIT][0000:01:00.0] init failed, -22
2015-05-25T08:26:17.054357+02:00 rkrell kernel: [    4.686944] nouveau E[    
DRM] failed to create 0x00000080, -22
2015-05-25T08:26:17.054358+02:00 rkrell kernel: [    4.687221] nouveau: probe
of 0000:01:00.0 failed with error -22

The kernel still hangs up, CTRL-ALT-BACKSPACE does not work.
The BIOS of the HP ZBook 15 is set to Legacy Mode, no UEFI is used.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432538214.0B3ddF2.4404--

--===============1575488950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1575488950==--

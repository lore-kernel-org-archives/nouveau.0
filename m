From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77371] New: [NVA3] gpu lockup unless noaccel=1
Date: Sat, 12 Apr 2014 19:14:13 +0000
Message-ID: <bug-77371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0055833130=="
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


--===============0055833130==
Content-Type: multipart/alternative; boundary="1397330053.ea8C061.28292"; charset="us-ascii"


--1397330053.ea8C061.28292
Date: Sat, 12 Apr 2014 19:14:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77371

          Priority: medium
            Bug ID: 77371
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVA3] gpu lockup unless noaccel=1
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jw.hendy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 97262
  --> https://bugs.freedesktop.org/attachment.cgi?id=97262&action=edit
dmesg after normal startup on Arch x86_64, prior to startx

System details:

$ uname -a
Linux bigBang 3.14.0-4-ARCH #1 SMP PREEMPT Wed Apr 9 21:11:25 CEST 2014 x86_64
GNU/Linux

$ dmesg | grep -i chipset
[   19.583102] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT215 (NVA3)

$ lspci |grep -i vga
01:00.0 VGA compatible controller: NVIDIA Corporation GT215GLM [Quadro FX
1800M] (rev a2)

Description:

I can only successfully `startx` if I modprobe nouveau with no acceleration
(`nouveau.noaccel=1` appended to kernel line or `options nouveau noaccel=1` in
/etc/modprobe.d/nouveau.conf).

With noaccel=0 (default), I get a GPU lockup message and borked X session (see
attached photo of screen).

Similar bugs:

- https://bugs.freedesktop.org/show_bug.cgi?id=33165 (seems most similar)
- https://bugs.freedesktop.org/show_bug.cgi?id=69488
- https://bugs.freedesktop.org/show_bug.cgi?id=73373 (?, can startx)
- https://bugs.freedesktop.org/show_bug.cgi?id=69203 (?, no gpu lockup)
- https://bugs.freedesktop.org/show_bug.cgi?id=69465 (?, no gpu lockup)

Things tried:
--- firmware: I tried the nouveau-fw packages from Arch Linux's AUR, which
simply packages the firmware instructions here:
http://nouveau.freedesktop.org/wiki/VideoAcceleration/. I have diff'ed the
contents of /lib/firmware/nouveau/ and /tmp/nouveau/vuc-* + /tmp/nouveau/nv*,
and they are identical.

From what I can tell, NVA3 (NV50 Tesla family) shouldn't need 3D Accel firmware
(http://nouveau.freedesktop.org/wiki/InstallDRM/, 3D-accel firmware section):

"NV40 - NV50: No firmware needed. The Nouveau driver generates the ctxprogs and
related state internally (commits 48c6dfb8 and 266229a5)."

With firmware in /lib/firmware/nouveau, I've tried with and without
`nouveau.config=NvGrUseFW=1`, though per the Kernel Parameters page
(http://nouveau.freedesktop.org/wiki/KernelModuleParameters/), this only seems
relevant for NVC0.

--- Per bug 69488, I tried with `nouveau.rumpm=0` and still get the lockup, not
to mention that report suggests this is fixed in 3.13, and I'm on 3.14

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397330053.ea8C061.28292
Date: Sat, 12 Apr 2014 19:14:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3] gpu lockup unless noaccel=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77371">77371</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA3] gpu lockup unless noaccel=1
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jw.hendy&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=97262" name="attach_97262" title="dmesg after normal startup on Arch x86_64, prior to startx">attachment 97262</a> <a href="attachment.cgi?id=97262&amp;action=edit" title="dmesg after normal startup on Arch x86_64, prior to startx">[details]</a></span>
dmesg after normal startup on Arch x86_64, prior to startx

System details:

$ uname -a
Linux bigBang 3.14.0-4-ARCH #1 SMP PREEMPT Wed Apr 9 21:11:25 CEST 2014 x86_64
GNU/Linux

$ dmesg | grep -i chipset
[   19.583102] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT215 (NVA3)

$ lspci |grep -i vga
01:00.0 VGA compatible controller: NVIDIA Corporation GT215GLM [Quadro FX
1800M] (rev a2)

Description:

I can only successfully `startx` if I modprobe nouveau with no acceleration
(`nouveau.noaccel=1` appended to kernel line or `options nouveau noaccel=1` in
/etc/modprobe.d/nouveau.conf).

With noaccel=0 (default), I get a GPU lockup message and borked X session (see
attached photo of screen).

Similar bugs:

- <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="show_bug.cgi?id=33165">https://bugs.freedesktop.org/show_bug.cgi?id=33165</a> (seems most similar)
- <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - GF108 (NVC1) GPU lockup"
   href="show_bug.cgi?id=69488">https://bugs.freedesktop.org/show_bug.cgi?id=69488</a>
- <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="show_bug.cgi?id=73373">https://bugs.freedesktop.org/show_bug.cgi?id=73373</a> (?, can startx)
- <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="show_bug.cgi?id=69203">https://bugs.freedesktop.org/show_bug.cgi?id=69203</a> (?, no gpu lockup)
- <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3] Kernel freeze with kernel 3.11.1 / PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail"
   href="show_bug.cgi?id=69465">https://bugs.freedesktop.org/show_bug.cgi?id=69465</a> (?, no gpu lockup)

Things tried:
--- firmware: I tried the nouveau-fw packages from Arch Linux's AUR, which
simply packages the firmware instructions here:
<a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/">http://nouveau.freedesktop.org/wiki/VideoAcceleration/</a>. I have diff'ed the
contents of /lib/firmware/nouveau/ and /tmp/nouveau/vuc-* + /tmp/nouveau/nv*,
and they are identical.

From what I can tell, NVA3 (NV50 Tesla family) shouldn't need 3D Accel firmware
(<a href="http://nouveau.freedesktop.org/wiki/InstallDRM/">http://nouveau.freedesktop.org/wiki/InstallDRM/</a>, 3D-accel firmware section):

&quot;NV40 - NV50: No firmware needed. The Nouveau driver generates the ctxprogs and
related state internally (commits 48c6dfb8 and 266229a5).&quot;

With firmware in /lib/firmware/nouveau, I've tried with and without
`nouveau.config=NvGrUseFW=1`, though per the Kernel Parameters page
(<a href="http://nouveau.freedesktop.org/wiki/KernelModuleParameters/">http://nouveau.freedesktop.org/wiki/KernelModuleParameters/</a>), this only seems
relevant for NVC0.

--- Per <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - GF108 (NVC1) GPU lockup"
   href="show_bug.cgi?id=69488">bug 69488</a>, I tried with `nouveau.rumpm=0` and still get the lockup, not
to mention that report suggests this is fixed in 3.13, and I'm on 3.14</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397330053.ea8C061.28292--

--===============0055833130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0055833130==--

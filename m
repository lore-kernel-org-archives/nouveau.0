From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72651] New: [NV11] Hang during suspend/resume on
 Geforce 2 MX200 & MX400
Date: Thu, 12 Dec 2013 22:28:32 +0000
Message-ID: <bug-72651-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1280729044=="
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


--===============1280729044==
Content-Type: multipart/alternative; boundary="1386887312.1DDc1.15096"; charset="us-ascii"


--1386887312.1DDc1.15096
Date: Thu, 12 Dec 2013 22:28:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72651

          Priority: medium
            Bug ID: 72651
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV11] Hang during suspend/resume on Geforce 2 MX200 &
                    MX400
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: welnicki-9geRo0GdX4mDzrf88dcEIrGCNT7kqevq@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 90680
  --> https://bugs.freedesktop.org/attachment.cgi?id=90680&action=edit
Serial console dump from MX200 card (boot + crash)

Hibernation and suspend/resume always hangs on a GeForce2 MX200/MX400 (NV11)
with nouveau loaded.

Steps to reproduce:
- boot a kernel, load nouveau
- echo "disk" > /sys/power/state
- machine hangs after suspending devices but before the image writing begins
- after several seconds, the monitor complains about "input signal out of
range"

Same thing happens with "echo freeze > /sys/power/state".
If nouveau is unloaded before hibernation, everything works fine.

This happens on two different systems with a GeForce2 MX200/400:
1) Athlon XP 1700+ on an Asrock K7VT2,
   GeForce2 MX400 64MB AGP, with VGA output
2) Pentium II 400 on a 440BX-based Gigabyte GA-BX2000+,
   GeForce2 MX200 32MB AGP, with VGA and TV-out (S-Video + Cinch)

I'm using CentOS 6 userspace, and various kernels:
linux-2.6.32-358.18.1.el6
linux-3.0.x
linux-3.10.x
linux-3.12.1
linux-3.12.4

Using a serial console I was able to narrow down the hang to run_tmds_table(),
called from nv04_dfp_restore().
Dmesg output and VBIOS of both cards is attached.

Note that neither of my cards has DVI/HDMI.
It seems that the flat panel connector is wrongly fabricated in
nouveau_bios.c:fabricate_dcb_encoder_table().

Commenting out the call to fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, ...)
makes hibernation work fine (patch attached).

The current condition of checking bios->tmds.output{0,1}_script_ptr seems
wrong. But since I don't have any NV11 with DVI output, I'm not sure what to
key creating the TMDS output on.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386887312.1DDc1.15096
Date: Thu, 12 Dec 2013 22:28:32 +0000
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
   title="NEW --- - [NV11] Hang during suspend/resume on Geforce 2 MX200 &amp; MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72651">72651</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV11] Hang during suspend/resume on Geforce 2 MX200 &amp; MX400
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>welnicki&#64;students.mimuw.edu.pl
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=90680" name="attach_90680" title="Serial console dump from MX200 card (boot + crash)">attachment 90680</a> <a href="attachment.cgi?id=90680&amp;action=edit" title="Serial console dump from MX200 card (boot + crash)">[details]</a></span>
Serial console dump from MX200 card (boot + crash)

Hibernation and suspend/resume always hangs on a GeForce2 MX200/MX400 (NV11)
with nouveau loaded.

Steps to reproduce:
- boot a kernel, load nouveau
- echo &quot;disk&quot; &gt; /sys/power/state
- machine hangs after suspending devices but before the image writing begins
- after several seconds, the monitor complains about &quot;input signal out of
range&quot;

Same thing happens with &quot;echo freeze &gt; /sys/power/state&quot;.
If nouveau is unloaded before hibernation, everything works fine.

This happens on two different systems with a GeForce2 MX200/400:
1) Athlon XP 1700+ on an Asrock K7VT2,
   GeForce2 MX400 64MB AGP, with VGA output
2) Pentium II 400 on a 440BX-based Gigabyte GA-BX2000+,
   GeForce2 MX200 32MB AGP, with VGA and TV-out (S-Video + Cinch)

I'm using CentOS 6 userspace, and various kernels:
linux-2.6.32-358.18.1.el6
linux-3.0.x
linux-3.10.x
linux-3.12.1
linux-3.12.4

Using a serial console I was able to narrow down the hang to run_tmds_table(),
called from nv04_dfp_restore().
Dmesg output and VBIOS of both cards is attached.

Note that neither of my cards has DVI/HDMI.
It seems that the flat panel connector is wrongly fabricated in
nouveau_bios.c:fabricate_dcb_encoder_table().

Commenting out the call to fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, ...)
makes hibernation work fine (patch attached).

The current condition of checking bios-&gt;tmds.output{0,1}_script_ptr seems
wrong. But since I don't have any NV11 with DVI output, I'm not sure what to
key creating the TMDS output on.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386887312.1DDc1.15096--

--===============1280729044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1280729044==--

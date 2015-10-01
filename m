From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92213] New: nouveau hangs after resume on kwin
	present windows
Date: Thu, 01 Oct 2015 15:14:48 +0000
Message-ID: <bug-92213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2074617639=="
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


--===============2074617639==
Content-Type: multipart/alternative; boundary="1443712488.C30Bd0.1610"; charset="UTF-8"


--1443712488.C30Bd0.1610
Date: Thu, 1 Oct 2015 15:14:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92213

            Bug ID: 92213
           Summary: nouveau hangs after resume on kwin present windows
           Product: Mesa
           Version: 11.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: serafean-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

After a suspend/resume cycle, the present windows effect causes kwin (4.14) to
hang, with traces in dmesg leading directly to nouveau.

mesa-11.0
linux-4.2.2

lspci :
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [NVS 300] (rev a2)


---------  Suspend  - ------
[ 2268.722580] nouveau  [     DRM] suspending console...
[ 2268.722582] nouveau  [     DRM] suspending display...
[ 2268.722593] nouveau  [     DRM] evicting buffers...
[ 2268.722624] e1000e: EEE TX LPI TIMER: 00000011
[ 2269.421201] nouveau  [     DRM] waiting for kernel channels to go idle...
[ 2269.421224] nouveau  [     DRM] suspending client object trees...
[ 2269.421736] nouveau  [     DRM] suspending kernel object tree...


---- resuming ------
[ 2271.148331] PM: noirq resume of devices complete after 10.825 msecs
[ 2271.148436] PM: early resume of devices complete after 0.096 msecs
[ 2271.148493] nouveau  [     DRM] re-enabling device...
[ 2271.148503] rtc_cmos 00:02: System wakeup disabled by ACPI
[ 2271.148517] nouveau  [     DRM] resuming kernel object tree...
[ 2271.148523] i8042 kbd 00:06: System wakeup disabled by ACPI
[ 2271.148528] nouveau  [   VBIOS][0000:01:00.0] running init tables
[ 2271.148942] sd 0:0:0:0: [sda] Starting disk
[ 2271.148944] sd 1:0:0:0: [sdb] Starting disk
[ 2271.149557] ACPI Error: Field [IRQE] at 152 exceeds Buffer [NULL] size 128
(bits) (20150619/dsopcode-236)
[ 2271.149561] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.LPCB.SIO1.DSRS] (Node ffff8802150a1168), AE_AML_BUFFER_LIMIT
(20150619/psparse-536)
[ 2271.149565] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.LPCB.UAR1._SRS] (Node ffff8802150a1898), AE_AML_BUFFER_LIMIT
(20150619/psparse-536)
[ 2271.149567] serial 00:07: activation failed
[ 2271.149571] dpm_run_callback(): pnp_bus_resume+0x0/0x90 returns -5           
[ 2271.149572] PM: Device 00:07 failed to resume: error -5
[ 2271.299271] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 900000uv
[ 2271.299275] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[ 2271.319293] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz shader 810
MHz memory 405 MHz
[ 2271.332887] nouveau  [     DRM] resuming client object trees...
[ 2271.333159] nouveau  [     DRM] resuming display...
[ 2271.385567] nouveau  [     DRM] resuming console...

 -----  Present windows activated  ---------
[ 2302.347079] nouveau E[kwin[535]] fail set_domain
[ 2302.347083] nouveau E[kwin[535]] validating bo list
[ 2302.347087] nouveau E[kwin[535]] validate: -22
[ 2652.529957] nouveau E[kwin[535]] fail set_domain
[ 2652.529961] nouveau E[kwin[535]] validating bo list
[ 2652.529964] nouveau E[kwin[535]] validate: -22
[ 2652.578047] nouveau E[  PGRAPH][0000:01:00.0] magic set 0:
[ 2652.578052] nouveau E[  PGRAPH][0000:01:00.0]        0x00408604: 0x20087e0f
[ 2652.578055] nouveau E[  PGRAPH][0000:01:00.0]        0x00408608: 0xff7f7fff
[ 2652.578057] nouveau E[  PGRAPH][0000:01:00.0]        0x0040860c: 0x40000432
[ 2652.578058] nouveau E[  PGRAPH][0000:01:00.0]        0x00408610: 0x7fff0000
[ 2652.578060] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP0:  FAULT
[ 2652.578064] nouveau E[  PGRAPH][0000:01:00.0] ch 6 [0x001f94c000 kwin[535]]
subc 3 class 0x8597 mthd 0x15e0 data 0x00000000
[ 2652.578071] nouveau E[     PFB][0000:01:00.0] trapped read at 0xff7f7fff00
on channel 0x0001f94c [kwin[535]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
[ 2652.592136] nouveau E[kwin[535]] fail set_domain
[ 2652.592139] nouveau E[kwin[535]] validating bo list
[ 2652.592144] nouveau E[kwin[535]] validate: -22
[ 2652.657196] nouveau E[kwin[535]] fail set_domain
[ 2652.657201] nouveau E[kwin[535]] validating bo list
[ 2652.657205] nouveau E[kwin[535]] validate: -22
[ 2652.744986] nouveau E[kwin[535]] fail set_domain
[ 2652.744991] nouveau E[kwin[535]] validating bo list
[ 2652.744996] nouveau E[kwin[535]] validate: -22
[ 2718.101236] nouveau E[kwin[535]] fail set_domain
[ 2718.101241] nouveau E[kwin[535]] validating bo list
[ 2718.101245] nouveau E[kwin[535]] validate: -22
[ 2718.259685] nouveau E[kwin[535]] fail set_domain
[ 2718.259689] nouveau E[kwin[535]] validating bo list
[ 2718.259693] nouveau E[kwin[535]] validate: -22
[ 2718.324463] nouveau E[kwin[535]] fail set_domain
[ 2718.324467] nouveau E[kwin[535]] validating bo list
[ 2718.324472] nouveau E[kwin[535]] validate: -22

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443712488.C30Bd0.1610
Date: Thu, 1 Oct 2015 15:14:48 +0000
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
   title="NEW - nouveau hangs after resume on kwin present windows"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92213">92213</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau hangs after resume on kwin present windows
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>serafean&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>After a suspend/resume cycle, the present windows effect causes kwin (4.14) to
hang, with traces in dmesg leading directly to nouveau.

mesa-11.0
linux-4.2.2

lspci :
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [NVS 300] (rev a2)


---------  Suspend  - ------
[ 2268.722580] nouveau  [     DRM] suspending console...
[ 2268.722582] nouveau  [     DRM] suspending display...
[ 2268.722593] nouveau  [     DRM] evicting buffers...
[ 2268.722624] e1000e: EEE TX LPI TIMER: 00000011
[ 2269.421201] nouveau  [     DRM] waiting for kernel channels to go idle...
[ 2269.421224] nouveau  [     DRM] suspending client object trees...
[ 2269.421736] nouveau  [     DRM] suspending kernel object tree...


---- resuming ------
[ 2271.148331] PM: noirq resume of devices complete after 10.825 msecs
[ 2271.148436] PM: early resume of devices complete after 0.096 msecs
[ 2271.148493] nouveau  [     DRM] re-enabling device...
[ 2271.148503] rtc_cmos 00:02: System wakeup disabled by ACPI
[ 2271.148517] nouveau  [     DRM] resuming kernel object tree...
[ 2271.148523] i8042 kbd 00:06: System wakeup disabled by ACPI
[ 2271.148528] nouveau  [   VBIOS][0000:01:00.0] running init tables
[ 2271.148942] sd 0:0:0:0: [sda] Starting disk
[ 2271.148944] sd 1:0:0:0: [sdb] Starting disk
[ 2271.149557] ACPI Error: Field [IRQE] at 152 exceeds Buffer [NULL] size 128
(bits) (20150619/dsopcode-236)
[ 2271.149561] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.LPCB.SIO1.DSRS] (Node ffff8802150a1168), AE_AML_BUFFER_LIMIT
(20150619/psparse-536)
[ 2271.149565] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.LPCB.UAR1._SRS] (Node ffff8802150a1898), AE_AML_BUFFER_LIMIT
(20150619/psparse-536)
[ 2271.149567] serial 00:07: activation failed
[ 2271.149571] dpm_run_callback(): pnp_bus_resume+0x0/0x90 returns -5           
[ 2271.149572] PM: Device 00:07 failed to resume: error -5
[ 2271.299271] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 900000uv
[ 2271.299275] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[ 2271.319293] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz shader 810
MHz memory 405 MHz
[ 2271.332887] nouveau  [     DRM] resuming client object trees...
[ 2271.333159] nouveau  [     DRM] resuming display...
[ 2271.385567] nouveau  [     DRM] resuming console...

 -----  Present windows activated  ---------
[ 2302.347079] nouveau E[kwin[535]] fail set_domain
[ 2302.347083] nouveau E[kwin[535]] validating bo list
[ 2302.347087] nouveau E[kwin[535]] validate: -22
[ 2652.529957] nouveau E[kwin[535]] fail set_domain
[ 2652.529961] nouveau E[kwin[535]] validating bo list
[ 2652.529964] nouveau E[kwin[535]] validate: -22
[ 2652.578047] nouveau E[  PGRAPH][0000:01:00.0] magic set 0:
[ 2652.578052] nouveau E[  PGRAPH][0000:01:00.0]        0x00408604: 0x20087e0f
[ 2652.578055] nouveau E[  PGRAPH][0000:01:00.0]        0x00408608: 0xff7f7fff
[ 2652.578057] nouveau E[  PGRAPH][0000:01:00.0]        0x0040860c: 0x40000432
[ 2652.578058] nouveau E[  PGRAPH][0000:01:00.0]        0x00408610: 0x7fff0000
[ 2652.578060] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP0:  FAULT
[ 2652.578064] nouveau E[  PGRAPH][0000:01:00.0] ch 6 [0x001f94c000 kwin[535]]
subc 3 class 0x8597 mthd 0x15e0 data 0x00000000
[ 2652.578071] nouveau E[     PFB][0000:01:00.0] trapped read at 0xff7f7fff00
on channel 0x0001f94c [kwin[535]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
[ 2652.592136] nouveau E[kwin[535]] fail set_domain
[ 2652.592139] nouveau E[kwin[535]] validating bo list
[ 2652.592144] nouveau E[kwin[535]] validate: -22
[ 2652.657196] nouveau E[kwin[535]] fail set_domain
[ 2652.657201] nouveau E[kwin[535]] validating bo list
[ 2652.657205] nouveau E[kwin[535]] validate: -22
[ 2652.744986] nouveau E[kwin[535]] fail set_domain
[ 2652.744991] nouveau E[kwin[535]] validating bo list
[ 2652.744996] nouveau E[kwin[535]] validate: -22
[ 2718.101236] nouveau E[kwin[535]] fail set_domain
[ 2718.101241] nouveau E[kwin[535]] validating bo list
[ 2718.101245] nouveau E[kwin[535]] validate: -22
[ 2718.259685] nouveau E[kwin[535]] fail set_domain
[ 2718.259689] nouveau E[kwin[535]] validating bo list
[ 2718.259693] nouveau E[kwin[535]] validate: -22
[ 2718.324463] nouveau E[kwin[535]] fail set_domain
[ 2718.324467] nouveau E[kwin[535]] validating bo list
[ 2718.324472] nouveau E[kwin[535]] validate: -22</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443712488.C30Bd0.1610--

--===============2074617639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2074617639==--

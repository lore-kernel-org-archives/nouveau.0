From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] New: [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Wed, 24 Oct 2012 04:21:48 +0000
Message-ID: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0091259777=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0091259777==
Content-Type: multipart/alternative; boundary="1351052508.1a0BB1.13674"; charset="us-ascii"


--1351052508.1a0BB1.13674
Date: Wed, 24 Oct 2012 04:21:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

          Priority: medium
            Bug ID: 56340
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA
                    Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
                    M64 graphics
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hi,

I have this system with FIC VA-503+ mainboard and NVIDIA RIVA TNT2 M64.
It is probably the most unreliable computer I have ever had with Ubuntu.
Here are the symptoms I have seen.

1. Frequent freeze (50% of the time) during boot up (Nouveau displays a message
saying that GPU has crashed, and several seconds later the computer will
freeze.)
2. Sudden freeze during use
3. Sudden reverting back to log in screen

For 1, note that the freeze during boot up is most severe with NVIDIA RIVA TNT2
M64 only.
It seems to not have too many boot up freeze problems with other NVIDIA
graphics cards (i.e., GeForce 2 MX, GeForce 4 MX, and GeForce FX 5200).
Same with ATI Technologies graphics cards like Radeon 9250 and Radeon 9800 Pro.
For 2, sometimes when the computer freezes, I still see some access going on
with the hard drive, but it will eventually stop.
Keyboard and mouse will completely freeze.
For 3, it happens "some times," not frequently, but I have observed it a few
times.
I did clean AGP and PCI connectors several times (Frequent cause of system
instability from my extensive experience of testing hardware with Linux.).
Is there a bug in the of VIA Technologies device drivers when used with
relatively older VIA Technologies hardware like Apollo MVP3 or Apollo Pro133?
Perhaps, VIA Technologies AGP GART device driver or PATA device driver can be
the culprit here.

System Configuration:

- Ubuntu 10.04.4 LTS 32-bit
  * All patches issued in the last 2 weeks have been applied
  * Linux 2.6.32-43-generic
- FIC VA-503+ mainboard
  * BIOS Version JE439 (I believe this is the last release version.)
  * VIA Technologies Apollo MVP3 chipset
- AMD K6-2 (I know it's old.)
  * 450 MHz
  * 100 MHz FSB
- 512 MB PC100 DDR SDRAM
  * 256 MB PC100 SDRAM DIMM X 2
  * Passes Memtest86+ v4.00 test in flying colors
- NVIDIA RIVA TNT2 M64 graphics card
  * 32 MB SDRAM
  * Universal (1.5V/3.3V) AGP
- Intel 1000 Mbps Ethernet PCI card
- Maxtor 91360D8 13.6 GB PATA hard drive
- AT keyboard
- PS/2 mouse

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351052508.1a0BB1.13674
Date: Wed, 24 Oct 2012 04:21:48 +0000
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
   title="NEW --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">56340</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics
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
          <td>mypersonalmailbox1&#64;mail.com
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
        <pre>Hi,

I have this system with FIC VA-503+ mainboard and NVIDIA RIVA TNT2 M64.
It is probably the most unreliable computer I have ever had with Ubuntu.
Here are the symptoms I have seen.

1. Frequent freeze (50% of the time) during boot up (Nouveau displays a message
saying that GPU has crashed, and several seconds later the computer will
freeze.)
2. Sudden freeze during use
3. Sudden reverting back to log in screen

For 1, note that the freeze during boot up is most severe with NVIDIA RIVA TNT2
M64 only.
It seems to not have too many boot up freeze problems with other NVIDIA
graphics cards (i.e., GeForce 2 MX, GeForce 4 MX, and GeForce FX 5200).
Same with ATI Technologies graphics cards like Radeon 9250 and Radeon 9800 Pro.
For 2, sometimes when the computer freezes, I still see some access going on
with the hard drive, but it will eventually stop.
Keyboard and mouse will completely freeze.
For 3, it happens &quot;some times,&quot; not frequently, but I have observed it a few
times.
I did clean AGP and PCI connectors several times (Frequent cause of system
instability from my extensive experience of testing hardware with Linux.).
Is there a bug in the of VIA Technologies device drivers when used with
relatively older VIA Technologies hardware like Apollo MVP3 or Apollo Pro133?
Perhaps, VIA Technologies AGP GART device driver or PATA device driver can be
the culprit here.

System Configuration:

- Ubuntu 10.04.4 LTS 32-bit
  * All patches issued in the last 2 weeks have been applied
  * Linux 2.6.32-43-generic
- FIC VA-503+ mainboard
  * BIOS Version JE439 (I believe this is the last release version.)
  * VIA Technologies Apollo MVP3 chipset
- AMD K6-2 (I know it's old.)
  * 450 MHz
  * 100 MHz FSB
- 512 MB PC100 DDR SDRAM
  * 256 MB PC100 SDRAM DIMM X 2
  * Passes Memtest86+ v4.00 test in flying colors
- NVIDIA RIVA TNT2 M64 graphics card
  * 32 MB SDRAM
  * Universal (1.5V/3.3V) AGP
- Intel 1000 Mbps Ethernet PCI card
- Maxtor 91360D8 13.6 GB PATA hard drive
- AT keyboard
- PS/2 mouse

Regards,

fpgahardwareengineer</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351052508.1a0BB1.13674--

--===============0091259777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0091259777==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63101] New: [Ubuntu 10.04.4 LTS 32-bit] NVIDIA
 GeForce 7300 GT AGP graphics card will not display any text characters on
 VIA Technologies Apollo MVP3-based mainboard
Date: Thu, 04 Apr 2013 05:48:05 +0000
Message-ID: <bug-63101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0160093145=="
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


--===============0160093145==
Content-Type: multipart/alternative; boundary="1365054485.4aD2081.18021"; charset="us-ascii"


--1365054485.4aD2081.18021
Date: Thu, 4 Apr 2013 05:48:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63101

          Priority: medium
            Bug ID: 63101
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [Ubuntu 10.04.4 LTS 32-bit] NVIDIA GeForce 7300 GT AGP
                    graphics card will not display any text characters on
                    VIA Technologies Apollo MVP3-based mainboard
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hi,

I will report that when I use BFG Technologies GeForce 7300 GT AGP graphics
card (NVIDIA GeForce 7300 GT AGP 512 MB DDR2 SDRAM) on FIC VA-503+ mainboard
(VIA Technologies Apollo MVP3 chipset), it will not display text characters
when AGP aperture setting is set to 64 MB, 128 MB, or 256 MB settings.
If the AGP aperture size is set to 32 MB or less (i.e., 4 MB, 8 MB, 16 MB, and
32 MB), the text characters will get displayed correctly on the screen.
The same exact bug has also been observed with EVGA GeForce 6200 AGP graphics
card (NVIDIA GeForce 6200 AGP 256 MB DDR2 SDRAM).
Furthermore, I have another similar era FIC mainboard (FIC KA-6110 mainboard)
with VIA Technologies chipset (Apollo Pro 133 chipset), it exhibits the same
exact behavior with EVGA GeForce 6200 AGP, and the exact same workaround (i.e.,
Set AGP aperture size to less than or equal to 32 MB, as already stated.)
resolves the issue.
Even if the screen does not correctly display the text characters, the system
does not crash or freeze, and Nouveau is able to draw graphic objects on the
screen.
However, text characters do not get displayed on the screen.
Because this bug appears when I adjust the AGP aperture size higher, I won't be
surprised if this is a bug of agpgart-via kernel driver or via-agp kernel
module.
Note that BFG Technologies GeForce 7300 GT AGP graphics card is capable of
running in a 3.3V AGP environment, and that is the reason why I am able to test
this graphics card with this very old Socket 7 era chipset.
Honestly, I am surprised that Nouveau didn't freeze or crash with this old
chipset, but I still want this annoying bug fixed.
System Configuration:

- Ubuntu 10.04.4 LTS 32-bit
  * Linux 2.6.32-46-generic
- FIC VA-503+ mainboard
  * BIOS Version JE439 (I believe this is the last release version.)
  * VIA Technologies Apollo MVP3 chipset
- AMD K6-2 (I know it's old.)
  * 450 MHz
  * 100 MHz FSB
- 512 MB PC100 DDR SDRAM
  * 256 MB PC100 SDRAM DIMM X 2
  * Passes Memtest86+ v4.00 test in flying colors
- BFG Technologies GeForce 7300 GT graphics card
  * 512 MB DDR2 SDRAM
  * Universal (1.5V/3.3V) AGP
- Intel 100 Mbps Ethernet PCI card
- Creative Labs/Ensoniq ES1371 PCI sound card
- Maxtor 90720D5 7 GB PATA hard drive
- Plextor 12X DVD-RW drive
- AT keyboard
- PS/2 mouse

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365054485.4aD2081.18021
Date: Thu, 4 Apr 2013 05:48:05 +0000
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
   title="NEW --- - [Ubuntu 10.04.4 LTS 32-bit] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63101">63101</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Ubuntu 10.04.4 LTS 32-bit] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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

I will report that when I use BFG Technologies GeForce 7300 GT AGP graphics
card (NVIDIA GeForce 7300 GT AGP 512 MB DDR2 SDRAM) on FIC VA-503+ mainboard
(VIA Technologies Apollo MVP3 chipset), it will not display text characters
when AGP aperture setting is set to 64 MB, 128 MB, or 256 MB settings.
If the AGP aperture size is set to 32 MB or less (i.e., 4 MB, 8 MB, 16 MB, and
32 MB), the text characters will get displayed correctly on the screen.
The same exact bug has also been observed with EVGA GeForce 6200 AGP graphics
card (NVIDIA GeForce 6200 AGP 256 MB DDR2 SDRAM).
Furthermore, I have another similar era FIC mainboard (FIC KA-6110 mainboard)
with VIA Technologies chipset (Apollo Pro 133 chipset), it exhibits the same
exact behavior with EVGA GeForce 6200 AGP, and the exact same workaround (i.e.,
Set AGP aperture size to less than or equal to 32 MB, as already stated.)
resolves the issue.
Even if the screen does not correctly display the text characters, the system
does not crash or freeze, and Nouveau is able to draw graphic objects on the
screen.
However, text characters do not get displayed on the screen.
Because this bug appears when I adjust the AGP aperture size higher, I won't be
surprised if this is a bug of agpgart-via kernel driver or via-agp kernel
module.
Note that BFG Technologies GeForce 7300 GT AGP graphics card is capable of
running in a 3.3V AGP environment, and that is the reason why I am able to test
this graphics card with this very old Socket 7 era chipset.
Honestly, I am surprised that Nouveau didn't freeze or crash with this old
chipset, but I still want this annoying bug fixed.
System Configuration:

- Ubuntu 10.04.4 LTS 32-bit
  * Linux 2.6.32-46-generic
- FIC VA-503+ mainboard
  * BIOS Version JE439 (I believe this is the last release version.)
  * VIA Technologies Apollo MVP3 chipset
- AMD K6-2 (I know it's old.)
  * 450 MHz
  * 100 MHz FSB
- 512 MB PC100 DDR SDRAM
  * 256 MB PC100 SDRAM DIMM X 2
  * Passes Memtest86+ v4.00 test in flying colors
- BFG Technologies GeForce 7300 GT graphics card
  * 512 MB DDR2 SDRAM
  * Universal (1.5V/3.3V) AGP
- Intel 100 Mbps Ethernet PCI card
- Creative Labs/Ensoniq ES1371 PCI sound card
- Maxtor 90720D5 7 GB PATA hard drive
- Plextor 12X DVD-RW drive
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

--1365054485.4aD2081.18021--

--===============0160093145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0160093145==--

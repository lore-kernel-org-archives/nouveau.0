From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85086] New: read/write faults leave machine unsuable
Date: Thu, 16 Oct 2014 11:45:10 +0000
Message-ID: <bug-85086-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1754025611=="
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


--===============1754025611==
Content-Type: multipart/alternative; boundary="1413459910.Cf4E3bf1.11867"; charset="UTF-8"


--1413459910.Cf4E3bf1.11867
Date: Thu, 16 Oct 2014 11:45:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85086

            Bug ID: 85086
           Summary: read/write faults leave machine unsuable
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tethys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 107921
  --> https://bugs.freedesktop.org/attachment.cgi?id=107921&action=edit
nouveau errors (from journalctl)

I came in this morning to find my machine at a text console, displaying
the following error:

Oct 15 20:57:55 localhost.localdomain kernel: nouveau E[Xorg[4149]] failed to
idle channel 0xcccc0000 [Xorg[4149]]
Oct 15 20:58:10 localhost.localdomain kernel: nouveau E[Xorg[4149]] failed to
idle channel 0xcccc0000 [Xorg[4149]]
Oct 15 20:58:15 localhost.localdomain kernel: nouveau E[   PFIFO][0000:01:00.0]
read fault at 0x0001e60000 [PTE] from CE2/GR_COPY on channel 0x007f8ef000
[unknown]

Possibly relevant things:

tet:~# uname -a
Linux tet.colet10.gambit 3.17.0 #9 SMP Mon Oct 13 16:26:23 BST 2014 x86_64
x86_64 x86_64 GNU/Linux

tet:~# lspci -v | sed -n '/VGA/,/^$/p'
01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [NVS 510] (rev a1)
(prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 0967
        Flags: bus master, fast devsel, latency 0, IRQ 25
        Memory at f2000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at f0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at f3000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb

tet:~# fgrep Monitor /var/log/Xorg.0.log
[    51.449] (**) |   |-->Monitor "<default monitor>"
[    51.714] (II) NOUVEAU(0): Monitor name: DELL U2713HM
[    51.748] (II) NOUVEAU(0): Monitor name: SDM-S205F/K
[    51.817] (II) NOUVEAU(0): Monitor name: DELL U2711

tet:~# rpm -qa | fgrep nouveau
xorg-x11-drv-nouveau-1.0.9-2.fc20.x86_64

tet:~# rpm -qa | fgrep mesa
mesa-libGL-10.1.5-1.20140607.fc20.i686
mesa-libglapi-10.1.5-1.20140607.fc20.x86_64
mesa-filesystem-10.1.5-1.20140607.fc20.x86_64
mesa-libglapi-10.1.5-1.20140607.fc20.i686
mesa-libGLU-9.0.0-5.fc20.x86_64
mesa-libgbm-10.1.5-1.20140607.fc20.x86_64
mesa-libGLES-10.1.5-1.20140607.fc20.x86_64
mesa-libwayland-egl-10.1.5-1.20140607.fc20.x86_64
mesa-dri-drivers-10.1.5-1.20140607.fc20.x86_64
mesa-libEGL-10.1.5-1.20140607.fc20.x86_64
mesa-libxatracker-10.1.5-1.20140607.fc20.x86_64
mesa-libgbm-10.1.5-1.20140607.fc20.i686
mesa-libGL-10.1.5-1.20140607.fc20.x86_64
mesa-libEGL-10.1.5-1.20140607.fc20.i686

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413459910.Cf4E3bf1.11867
Date: Thu, 16 Oct 2014 11:45:10 +0000
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
   title="NEW - read/write faults leave machine unsuable"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85086">85086</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>read/write faults leave machine unsuable
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
          <td>tethys&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=107921" name="attach_107921" title="nouveau errors (from journalctl)">attachment 107921</a> <a href="attachment.cgi?id=107921&amp;action=edit" title="nouveau errors (from journalctl)">[details]</a></span>
nouveau errors (from journalctl)

I came in this morning to find my machine at a text console, displaying
the following error:

Oct 15 20:57:55 localhost.localdomain kernel: nouveau E[Xorg[4149]] failed to
idle channel 0xcccc0000 [Xorg[4149]]
Oct 15 20:58:10 localhost.localdomain kernel: nouveau E[Xorg[4149]] failed to
idle channel 0xcccc0000 [Xorg[4149]]
Oct 15 20:58:15 localhost.localdomain kernel: nouveau E[   PFIFO][0000:01:00.0]
read fault at 0x0001e60000 [PTE] from CE2/GR_COPY on channel 0x007f8ef000
[unknown]

Possibly relevant things:

tet:~# uname -a
Linux tet.colet10.gambit 3.17.0 #9 SMP Mon Oct 13 16:26:23 BST 2014 x86_64
x86_64 x86_64 GNU/Linux

tet:~# lspci -v | sed -n '/VGA/,/^$/p'
01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [NVS 510] (rev a1)
(prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 0967
        Flags: bus master, fast devsel, latency 0, IRQ 25
        Memory at f2000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at f0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at f3000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb

tet:~# fgrep Monitor /var/log/Xorg.0.log
[    51.449] (**) |   |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;
[    51.714] (II) NOUVEAU(0): Monitor name: DELL U2713HM
[    51.748] (II) NOUVEAU(0): Monitor name: SDM-S205F/K
[    51.817] (II) NOUVEAU(0): Monitor name: DELL U2711

tet:~# rpm -qa | fgrep nouveau
xorg-x11-drv-nouveau-1.0.9-2.fc20.x86_64

tet:~# rpm -qa | fgrep mesa
mesa-libGL-10.1.5-1.20140607.fc20.i686
mesa-libglapi-10.1.5-1.20140607.fc20.x86_64
mesa-filesystem-10.1.5-1.20140607.fc20.x86_64
mesa-libglapi-10.1.5-1.20140607.fc20.i686
mesa-libGLU-9.0.0-5.fc20.x86_64
mesa-libgbm-10.1.5-1.20140607.fc20.x86_64
mesa-libGLES-10.1.5-1.20140607.fc20.x86_64
mesa-libwayland-egl-10.1.5-1.20140607.fc20.x86_64
mesa-dri-drivers-10.1.5-1.20140607.fc20.x86_64
mesa-libEGL-10.1.5-1.20140607.fc20.x86_64
mesa-libxatracker-10.1.5-1.20140607.fc20.x86_64
mesa-libgbm-10.1.5-1.20140607.fc20.i686
mesa-libGL-10.1.5-1.20140607.fc20.x86_64
mesa-libEGL-10.1.5-1.20140607.fc20.i686</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413459910.Cf4E3bf1.11867--

--===============1754025611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1754025611==--

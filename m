From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] New: nouveau GF108 kernel crash in optimus
 mode when enabling external display output
Date: Sun, 19 May 2013 20:54:37 +0000
Message-ID: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1606880315=="
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


--===============1606880315==
Content-Type: multipart/alternative; boundary="1368996878.df2Afe1.5122"; charset="us-ascii"


--1368996878.df2Afe1.5122
Date: Sun, 19 May 2013 20:54:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64774

          Priority: medium
            Bug ID: 64774
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau GF108 kernel crash in optimus mode when
                    enabling external display output
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: All
          Reporter: pasik-X3B1VOXEql0@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 79549
  --> https://bugs.freedesktop.org/attachment.cgi?id=79549&action=edit
dmesg Linux 3.8.11 nouveau optimus before the kernel crash

I'm using Lenovo T430 laptop with intel+nvidia hybrid graphics, optimus is
enabled in BIOS:

$ lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [Quadro NVS 5400M]
(rev a1)

$ uname -a
Linux localhost.localdomain 3.8.11-200.fc18.x86_64 #1 SMP Wed May 1 19:44:27
UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

I boot up the system with only laptop internal LVDS active on intel gpu, and
when in X session, I enable the second display on nouveau gpu connected to the
dock DP2/DVI connector. 
At this point the kernel crashes immediately.

Screenshots of the kernel crash/stacktrace here:
http://pasik.reaktio.net/nouveau/debug/nouveau-kernel-crash01.jpg
http://pasik.reaktio.net/nouveau/debug/nouveau-kernel-crash02.jpg

hand-written bits from the kernel crash:

Pid: 1208, comm: Xorg Not tainted 3.8.11-200.fc18.x86_64 #1 LENOVO
2349H2G/2349H2G
RIP: 0010:[<ffffffffa01abb7e>] [<ffffffffa01abb7e>] nvc0_vm_map_sg+0x8e/0x110
[nouveau]
RSP: 0018:ffff8803298357c8 EFLAGS: 00010206
..
Process Xorg (pid: 1208,..)
..
Call Trace:
.. nouveau_vm_map_sg+0xc2/0x130 [nouveau]
.. nouveau_vma_getmap.isra.11+0x68/0xa0 [nouveau]
.. nouveau_bo_move_m2mf.isra.12+0x85/0x140 [nouveau]
.. ? nouveau_vm_map_at+0x153/0x1c0 [nouveau]
.. nouveau_bo_move+0xa5/0x400 [nouveau]
.. ttm_bo_handle_move_mem+0x245/0x610 [ttm]

More info from the screenshots above (also attached)..

Kernel dmesg from before the crash attached.
I also tried with Linux kernel 3.9.2 and there the system crashes hard aswell.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368996878.df2Afe1.5122
Date: Sun, 19 May 2013 20:54:38 +0000
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
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774">64774</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau GF108 kernel crash in optimus mode when enabling external display output
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pasik&#64;iki.fi
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Created <span class=""><a href="attachment.cgi?id=79549" name="attach_79549" title="dmesg Linux 3.8.11 nouveau optimus before the kernel crash">attachment 79549</a> <a href="attachment.cgi?id=79549&amp;action=edit" title="dmesg Linux 3.8.11 nouveau optimus before the kernel crash">[details]</a></span>
dmesg Linux 3.8.11 nouveau optimus before the kernel crash

I'm using Lenovo T430 laptop with intel+nvidia hybrid graphics, optimus is
enabled in BIOS:

$ lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [Quadro NVS 5400M]
(rev a1)

$ uname -a
Linux localhost.localdomain 3.8.11-200.fc18.x86_64 #1 SMP Wed May 1 19:44:27
UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

I boot up the system with only laptop internal LVDS active on intel gpu, and
when in X session, I enable the second display on nouveau gpu connected to the
dock DP2/DVI connector. 
At this point the kernel crashes immediately.

Screenshots of the kernel crash/stacktrace here:
<a href="http://pasik.reaktio.net/nouveau/debug/nouveau-kernel-crash01.jpg">http://pasik.reaktio.net/nouveau/debug/nouveau-kernel-crash01.jpg</a>
<a href="http://pasik.reaktio.net/nouveau/debug/nouveau-kernel-crash02.jpg">http://pasik.reaktio.net/nouveau/debug/nouveau-kernel-crash02.jpg</a>

hand-written bits from the kernel crash:

Pid: 1208, comm: Xorg Not tainted 3.8.11-200.fc18.x86_64 #1 LENOVO
2349H2G/2349H2G
RIP: 0010:[&lt;ffffffffa01abb7e&gt;] [&lt;ffffffffa01abb7e&gt;] nvc0_vm_map_sg+0x8e/0x110
[nouveau]
RSP: 0018:ffff8803298357c8 EFLAGS: 00010206
..
Process Xorg (pid: 1208,..)
..
Call Trace:
.. nouveau_vm_map_sg+0xc2/0x130 [nouveau]
.. nouveau_vma_getmap.isra.11+0x68/0xa0 [nouveau]
.. nouveau_bo_move_m2mf.isra.12+0x85/0x140 [nouveau]
.. ? nouveau_vm_map_at+0x153/0x1c0 [nouveau]
.. nouveau_bo_move+0xa5/0x400 [nouveau]
.. ttm_bo_handle_move_mem+0x245/0x610 [ttm]

More info from the screenshots above (also attached)..

Kernel dmesg from before the crash attached.
I also tried with Linux kernel 3.9.2 and there the system crashes hard aswell.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368996878.df2Afe1.5122--

--===============1606880315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1606880315==--

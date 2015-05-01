From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90276] New: [NVE6] nouveau E[ PFIFO][0000:01:00.0]
 read fault at 0x000a5c0000 [UNSUPPORTED_KIND] from CE2/GR_CE on channel
 0x007f329000 [unknown]
Date: Fri, 01 May 2015 19:03:13 +0000
Message-ID: <bug-90276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2022015215=="
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


--===============2022015215==
Content-Type: multipart/alternative; boundary="1430506993.21E8d1.380"; charset="UTF-8"


--1430506993.21E8d1.380
Date: Fri, 1 May 2015 19:03:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90276

            Bug ID: 90276
           Summary: [NVE6]  nouveau E[   PFIFO][0000:01:00.0] read fault
                    at 0x000a5c0000 [UNSUPPORTED_KIND] from CE2/GR_CE on
                    channel 0x007f329000 [unknown]
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: arthurphilippeheymans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115504
  --> https://bugs.freedesktop.org/attachment.cgi?id=115504&action=edit
Kernel Log

When I launch the 3d game Xonotic or 0ad I get a systematically reproducible
crash: screen freezes and system can't be shutdown anymore from ssh.

How to reproduce:
Launch the game Xonotic


This has been so since at least linux 3.18
Does not happen on linux 3.14

lspci -v:
Flags: bus master, VGA palette snoop, 66MHz, medium devsel, latency 64
        Bus: primary=00, secondary=04, subordinate=04, sec-latency=64
        Memory behind bridge: fe100000-fe1fffff

01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 660
Ti] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 2843
        Flags: bus master, fast devsel, latency 0, IRQ 29
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at f0000000 (64-bit, prefetchable) [size=128M]
        Memory at f8000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at fe000000 [disabled] [size=512K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

mesa 10.5.4-1
libdrm 2.4.60-2
xf86-video-nouveau 1.0.11-3
linux 4.0.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430506993.21E8d1.380
Date: Fri, 1 May 2015 19:03:13 +0000
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
   title="NEW - [NVE6] nouveau E[ PFIFO][0000:01:00.0] read fault at 0x000a5c0000 [UNSUPPORTED_KIND] from CE2/GR_CE on channel 0x007f329000 [unknown]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276">90276</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6]  nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000a5c0000 [UNSUPPORTED_KIND] from CE2/GR_CE on channel 0x007f329000 [unknown]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>arthurphilippeheymans&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115504" name="attach_115504" title="Kernel Log">attachment 115504</a> <a href="attachment.cgi?id=115504&amp;action=edit" title="Kernel Log">[details]</a></span>
Kernel Log

When I launch the 3d game Xonotic or 0ad I get a systematically reproducible
crash: screen freezes and system can't be shutdown anymore from ssh.

How to reproduce:
Launch the game Xonotic


This has been so since at least linux 3.18
Does not happen on linux 3.14

lspci -v:
Flags: bus master, VGA palette snoop, 66MHz, medium devsel, latency 64
        Bus: primary=00, secondary=04, subordinate=04, sec-latency=64
        Memory behind bridge: fe100000-fe1fffff

01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 660
Ti] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 2843
        Flags: bus master, fast devsel, latency 0, IRQ 29
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at f0000000 (64-bit, prefetchable) [size=128M]
        Memory at f8000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at fe000000 [disabled] [size=512K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

mesa 10.5.4-1
libdrm 2.4.60-2
xf86-video-nouveau 1.0.11-3
linux 4.0.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430506993.21E8d1.380--

--===============2022015215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2022015215==--

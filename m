From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91025] New: nouveau fails to run with NV5 [Riva TNT2
 / TNT2 Pro]
Date: Fri, 19 Jun 2015 02:09:39 +0000
Message-ID: <bug-91025-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0336699444=="
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


--===============0336699444==
Content-Type: multipart/alternative; boundary="1434679779.05Cc1.11630"; charset="UTF-8"


--1434679779.05Cc1.11630
Date: Fri, 19 Jun 2015 02:09:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91025

            Bug ID: 91025
           Summary: nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: anonymissimus-KvP5wT2u2U0@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 116588
  --> https://bugs.freedesktop.org/attachment.cgi?id=116588&action=edit
dmesg > kernel_log.txt

sudo lspci -vnn:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV5 [Riva TNT2 /
TNT2 Pro] [10de:0028] (rev 11) (prog-if 00 [VGA controller])
    Subsystem: Elsa AG Erazor III [1048:0c28]
    Flags: 66MHz, medium devsel, IRQ 11
    Memory at f4000000 (32-bit, non-prefetchable) [size=16M]
    Memory at f6000000 (32-bit, prefetchable) [size=32M]
    Expansion ROM at f5ff0000 [disabled] [size=64K]
    Capabilities: [60] Power Management version 1
    Capabilities: [44] AGP version 2.0

AFAICT there should be a "kernel driver in use: nouveau" line here, but I
didn't overlook/forget to copy it. That's probably why xrandr doesn't let me
set anything better than 1024x768.

log according to http://nouveau.freedesktop.org/wiki/Bugs/ attached, notice the
nouveau error messages at ~12.xx.

The only way of dumping the video bios that worked for me was dd according to
http://nouveau.freedesktop.org/wiki/DumpingVideoBios/.
vbtracetool didn't work due to not finding pci.h even after installing
linux-headers while compiling.

OS/packages:
No clue about needed stuff here or how to find out versions. OS is fresh
debian-8.1.0-i386-lxde-CD1.iso. All packages up to date according to synaptic
and the normal update repos of this distro (current stable, stretch) as of
19.06.2015.

uname -r:
3.16.0-4-686-pae

Passing nouveau.agpmode=0 (or 1 or 2) in grub didn't help. (I think I did this
correctly, as it seems I was correct with log_buf_len=1M too.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434679779.05Cc1.11630
Date: Fri, 19 Jun 2015 02:09:39 +0000
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
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025">91025</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]
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
          <td>x86 (IA32)
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
          <td>anonymissimus&#64;arcor.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116588" name="attach_116588" title="dmesg &gt; kernel_log.txt">attachment 116588</a> <a href="attachment.cgi?id=116588&amp;action=edit" title="dmesg &gt; kernel_log.txt">[details]</a></span>
dmesg &gt; kernel_log.txt

sudo lspci -vnn:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV5 [Riva TNT2 /
TNT2 Pro] [10de:0028] (rev 11) (prog-if 00 [VGA controller])
    Subsystem: Elsa AG Erazor III [1048:0c28]
    Flags: 66MHz, medium devsel, IRQ 11
    Memory at f4000000 (32-bit, non-prefetchable) [size=16M]
    Memory at f6000000 (32-bit, prefetchable) [size=32M]
    Expansion ROM at f5ff0000 [disabled] [size=64K]
    Capabilities: [60] Power Management version 1
    Capabilities: [44] AGP version 2.0

AFAICT there should be a &quot;kernel driver in use: nouveau&quot; line here, but I
didn't overlook/forget to copy it. That's probably why xrandr doesn't let me
set anything better than 1024x768.

log according to <a href="http://nouveau.freedesktop.org/wiki/Bugs/">http://nouveau.freedesktop.org/wiki/Bugs/</a> attached, notice the
nouveau error messages at ~12.xx.

The only way of dumping the video bios that worked for me was dd according to
<a href="http://nouveau.freedesktop.org/wiki/DumpingVideoBios/">http://nouveau.freedesktop.org/wiki/DumpingVideoBios/</a>.
vbtracetool didn't work due to not finding pci.h even after installing
linux-headers while compiling.

OS/packages:
No clue about needed stuff here or how to find out versions. OS is fresh
debian-8.1.0-i386-lxde-CD1.iso. All packages up to date according to synaptic
and the normal update repos of this distro (current stable, stretch) as of
19.06.2015.

uname -r:
3.16.0-4-686-pae

Passing nouveau.agpmode=0 (or 1 or 2) in grub didn't help. (I think I did this
correctly, as it seems I was correct with log_buf_len=1M too.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434679779.05Cc1.11630--

--===============0336699444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0336699444==--

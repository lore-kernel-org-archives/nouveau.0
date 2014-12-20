From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87543] New: "unmatched output device
 0x0103010201010100" when connecting to hdmi
Date: Sat, 20 Dec 2014 23:59:11 +0000
Message-ID: <bug-87543-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0074084144=="
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


--===============0074084144==
Content-Type: multipart/alternative; boundary="1419119951.e3571.5247"; charset="UTF-8"


--1419119951.e3571.5247
Date: Sat, 20 Dec 2014 23:59:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87543

            Bug ID: 87543
           Summary: "unmatched output device 0x0103010201010100" when
                    connecting to hdmi
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: Somelauw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 111096
  --> https://bugs.freedesktop.org/attachment.cgi?id=111096&action=edit
dmesg, acpidump, vbios

I'm trying to get an external screen (a television) to work using a HDMI cable.
Unfortunately the HDMI screen doesn't show up in the output of xrandr.
This all works under windows, so the cable isn't broken or anything.

In my dmesg, I found the following problem:
nouveau  [     MXM][0000:01:00.0] unmatched output device 0x0103010201010100

My OS is LMDE.
I'm using the following kernel: 3.17-7.dmz.1-liquorix-amd64

Here is some info about my graphical card:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96GLM [Quadro FX
770M] [10de:065c] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Hewlett-Packard Company Device [103c:30e7]
    Flags: bus master, fast devsel, latency 0, IRQ 35
    Memory at 92000000 (32-bit, non-prefetchable) [size=16M]
    Memory at 80000000 (64-bit, prefetchable) [size=256M]
    Memory at 90000000 (64-bit, non-prefetchable) [size=32M]
    I/O ports at 7000 [size=128]
    Expansion ROM at <ignored> [disabled]
    Capabilities: <access denied>
    Kernel driver in use: nouveau

Chipset: G96 (NV96)
Family : NV50

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419119951.e3571.5247
Date: Sat, 20 Dec 2014 23:59:11 +0000
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
   title="NEW - &quot;unmatched output device 0x0103010201010100&quot; when connecting to hdmi"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87543">87543</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>&quot;unmatched output device 0x0103010201010100&quot; when connecting to hdmi
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
          <td>Somelauw&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=111096" name="attach_111096" title="dmesg, acpidump, vbios">attachment 111096</a> <a href="attachment.cgi?id=111096&amp;action=edit" title="dmesg, acpidump, vbios">[details]</a></span>
dmesg, acpidump, vbios

I'm trying to get an external screen (a television) to work using a HDMI cable.
Unfortunately the HDMI screen doesn't show up in the output of xrandr.
This all works under windows, so the cable isn't broken or anything.

In my dmesg, I found the following problem:
nouveau  [     MXM][0000:01:00.0] unmatched output device 0x0103010201010100

My OS is LMDE.
I'm using the following kernel: 3.17-7.dmz.1-liquorix-amd64

Here is some info about my graphical card:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96GLM [Quadro FX
770M] [10de:065c] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Hewlett-Packard Company Device [103c:30e7]
    Flags: bus master, fast devsel, latency 0, IRQ 35
    Memory at 92000000 (32-bit, non-prefetchable) [size=16M]
    Memory at 80000000 (64-bit, prefetchable) [size=256M]
    Memory at 90000000 (64-bit, non-prefetchable) [size=32M]
    I/O ports at 7000 [size=128]
    Expansion ROM at &lt;ignored&gt; [disabled]
    Capabilities: &lt;access denied&gt;
    Kernel driver in use: nouveau

Chipset: G96 (NV96)
Family : NV50</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419119951.e3571.5247--

--===============0074084144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0074084144==--

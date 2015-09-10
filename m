From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91954] New: "link training failed": nouveau does not
 recover from monitor suspend
Date: Thu, 10 Sep 2015 03:07:55 +0000
Message-ID: <bug-91954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0220818752=="
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


--===============0220818752==
Content-Type: multipart/alternative; boundary="1441854475.1FC65a1.30651"; charset="UTF-8"


--1441854475.1FC65a1.30651
Date: Thu, 10 Sep 2015 03:07:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91954

            Bug ID: 91954
           Summary: "link training failed": nouveau does not recover from
                    monitor suspend
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: djc-vNUPr3c+39GHXe+LvDLADg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When my monitor wakes up from "power save mode" (DPMS suspend) nouveau does not
display any output and the monitor goes back to power save after a few seconds.
The kernel says:

kernel: nouveau E[   PDISP][0000:03:00.0][0x00000006] 02:0006:0f42: link
training failed

The behaviour of the monitor might be a bit dodgy. When booting the machine I
have to mash buttons on the monitor to keep it awake until the firmware starts
displaying an image, otherwise I will get no output from the firmware at all.

When the monitor goes into power save mode, it stays awake showing a message
"Power save mode" for about 3 seconds, then it actually powers down (its LED
turns orange). I have noticed that nouveau can recover if I shake the mouse
during those three seconds, but it can't recover if I let the monitor power all
the way down.

Complete logs to follow.

Hardware:
Lenovo Thinkstation P500, all legacy/CSM features disabled ("pure UEFI")
Nvidia Quadro K620 (GM107/NV117)
Thinkvision 2840m connected via Displayport

Software:
xorg-x11-server-Xorg-1.17.2-2.fc22.x86_64
xorg-x11-drv-nouveau-1.0.11-2.fc22.x86_64
Kernel is 4.2.0 plus Fedora patches plus these four commits suggested by Ben
Skeggs:
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&id=7c11c99b3c66a8e03494e56ce6e6c5303ee85934
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&id=f10956d4455fcb24ecbdca30e6d9d88c95dc2588
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&id=fe0f5d08806dcf7fd51092dfc6ea666ea2392692
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&id=2a89359415da2fc1250b4c205de3c384bd781f54

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441854475.1FC65a1.30651
Date: Thu, 10 Sep 2015 03:07:55 +0000
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
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954">91954</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>&quot;link training failed&quot;: nouveau does not recover from monitor suspend
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
          <td>djc&#64;djc.id.au
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When my monitor wakes up from &quot;power save mode&quot; (DPMS suspend) nouveau does not
display any output and the monitor goes back to power save after a few seconds.
The kernel says:

kernel: nouveau E[   PDISP][0000:03:00.0][0x00000006] 02:0006:0f42: link
training failed

The behaviour of the monitor might be a bit dodgy. When booting the machine I
have to mash buttons on the monitor to keep it awake until the firmware starts
displaying an image, otherwise I will get no output from the firmware at all.

When the monitor goes into power save mode, it stays awake showing a message
&quot;Power save mode&quot; for about 3 seconds, then it actually powers down (its LED
turns orange). I have noticed that nouveau can recover if I shake the mouse
during those three seconds, but it can't recover if I let the monitor power all
the way down.

Complete logs to follow.

Hardware:
Lenovo Thinkstation P500, all legacy/CSM features disabled (&quot;pure UEFI&quot;)
Nvidia Quadro K620 (GM107/NV117)
Thinkvision 2840m connected via Displayport

Software:
xorg-x11-server-Xorg-1.17.2-2.fc22.x86_64
xorg-x11-drv-nouveau-1.0.11-2.fc22.x86_64
Kernel is 4.2.0 plus Fedora patches plus these four commits suggested by Ben
Skeggs:
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&amp;id=7c11c99b3c66a8e03494e56ce6e6c5303ee85934">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&amp;id=7c11c99b3c66a8e03494e56ce6e6c5303ee85934</a>
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&amp;id=f10956d4455fcb24ecbdca30e6d9d88c95dc2588">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&amp;id=f10956d4455fcb24ecbdca30e6d9d88c95dc2588</a>
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&amp;id=fe0f5d08806dcf7fd51092dfc6ea666ea2392692">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&amp;id=fe0f5d08806dcf7fd51092dfc6ea666ea2392692</a>
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&amp;id=2a89359415da2fc1250b4c205de3c384bd781f54">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.3&amp;id=2a89359415da2fc1250b4c205de3c384bd781f54</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441854475.1FC65a1.30651--

--===============0220818752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0220818752==--

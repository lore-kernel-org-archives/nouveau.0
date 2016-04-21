From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95054] New: KDE 5 / Plasma crashes with nouveau
 "fifo: gr engine fault on channel 2, recovering" or "gr: TRAP ch 2"
Date: Thu, 21 Apr 2016 15:59:32 +0000
Message-ID: <bug-95054-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1825333777=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1825333777==
Content-Type: multipart/alternative; boundary="14612543710.9F0ba9.22282";
 charset="UTF-8"


--14612543710.9F0ba9.22282
Date: Thu, 21 Apr 2016 15:59:31 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95054

            Bug ID: 95054
           Summary: KDE 5 / Plasma crashes with nouveau "fifo: gr engine
                    fault on channel 2, recovering" or "gr: TRAP ch 2"
           Product: xorg
           Version: 7.4 (2008.09)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I upgraded from KDE 4 to KDE 5/Plasma. Since the nouveau driver keeps crashing
and freezes everything. If I use the proprietary nvidia firmware (NvGrUseFw=1)
together with the nouveau driver everything works fine.

Normally, the crash heralds itself by some disrupted graphics (black boxes on
the desktop) some seconds before everything freezes totally. The crash is
usually triggered by some desktop effect if some item (menu/dialog/window)
fades in or out ("transparency" effect). The crash usually occurs within the
first five minutes after the login. Sometimes even the login crashes (sddm
window manager) because the window manager uses the same fading effect and
triggers the bug, too.

My kernel version is 4.4.7.

Graphic card: "ASUS GeForce GTX 660 PCI 3.0 2GB DDR5"

uname: "Linux 4.4.7-gentoo #2 SMP Thu Apr 21 13:34:23 CEST 2016 x86_64 Intel(R)
Xeon(R) CPU E3-1230 v3 @ 3.30GHz GenuineIntel GNU/Linux"

I also still suffer from bug #93629 and 93630 that also vanish if the
proprietary firmware is used. But I decided to open a new bug, because the
dmesg messages are different.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14612543710.9F0ba9.22282
Date: Thu, 21 Apr 2016 15:59:31 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - KDE 5 / Plasma crashes with nouveau &quot;fifo: gr engine fault on channel 2, recovering&quot; or &quot;gr: TRAP ch 2&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95054">95054</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>KDE 5 / Plasma crashes with nouveau &quot;fifo: gr engine fault on channel 2, recovering&quot; or &quot;gr: TRAP ch 2&quot;
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.4 (2008.09)
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
          <td>matthias.h.nagel&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I upgraded from KDE 4 to KDE 5/Plasma. Since the nouveau driver keeps crashing
and freezes everything. If I use the proprietary nvidia firmware (NvGrUseFw=1)
together with the nouveau driver everything works fine.

Normally, the crash heralds itself by some disrupted graphics (black boxes on
the desktop) some seconds before everything freezes totally. The crash is
usually triggered by some desktop effect if some item (menu/dialog/window)
fades in or out (&quot;transparency&quot; effect). The crash usually occurs within the
first five minutes after the login. Sometimes even the login crashes (sddm
window manager) because the window manager uses the same fading effect and
triggers the bug, too.

My kernel version is 4.4.7.

Graphic card: &quot;ASUS GeForce GTX 660 PCI 3.0 2GB DDR5&quot;

uname: &quot;Linux 4.4.7-gentoo #2 SMP Thu Apr 21 13:34:23 CEST 2016 x86_64 Intel(R)
Xeon(R) CPU E3-1230 v3 &#64; 3.30GHz GenuineIntel GNU/Linux&quot;

I also still suffer from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="show_bug.cgi?id=93629">bug #93629</a> and 93630 that also vanish if the
proprietary firmware is used. But I decided to open a new bug, because the
dmesg messages are different.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14612543710.9F0ba9.22282--

--===============1825333777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1825333777==--

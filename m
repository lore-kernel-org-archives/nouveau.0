From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96802] New: Upgrading mesa from 11.0.6 -> 11.2.2
 causes graphics deadlock
Date: Mon, 04 Jul 2016 13:19:35 +0000
Message-ID: <bug-96802-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1192462677=="
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


--===============1192462677==
Content-Type: multipart/alternative; boundary="14676383750.304177aC.23130";
 charset="UTF-8"


--14676383750.304177aC.23130
Date: Mon, 4 Jul 2016 13:19:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96802

            Bug ID: 96802
           Summary: Upgrading mesa from 11.0.6 -> 11.2.2 causes graphics
                    deadlock
           Product: Mesa
           Version: 11.2
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ian.kumlien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 124894
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124894&action=3Dedit
dmesg output

Hi, I have tested this several times with several different kernels, always
with the same result. It deadlocks wayland or X within seconds after openin=
g a
terminal or chrome.

It starts out like this:
[  108.167312] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[  108.167328] nouveau 0000:01:00.0: fifo: msppp engine fault on channel 12,
recovering...
[  118.871915] nouveau 0000:01:00.0: multiqueue0:src[7039]: failed to idle
channel 12 [multiqueue0:src[7039]]
[  133.873009] nouveau 0000:01:00.0: multiqueue0:src[7039]: failed to idle
channel 12 [multiqueue0:src[7039]]
[  134.242698] nouveau 0000:01:00.0: mspdec: intr 028c0000
[  134.242744] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 08=
4048
[ IBUS ]
[  138.538241] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[  138.538259] nouveau 0000:01:00.0: fifo: mspdec engine fault on channel 1=
2,
recovering...
[  140.537498] nouveau 0000:01:00.0: fifo: runlist update timeout

And then it all breaks down and never recovers (the machine is reachable but
can't reboot properly afterwards)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14676383750.304177aC.23130
Date: Mon, 4 Jul 2016 13:19:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Upgrading mesa from 11.0.6 -&gt; 11.2.2 causes graphics d=
eadlock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96802">96802</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Upgrading mesa from 11.0.6 -&gt; 11.2.2 causes graphics deadl=
ock
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.2
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
          <td>major
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
          <td>ian.kumlien&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124894=
" name=3D"attach_124894" title=3D"dmesg output">attachment 124894</a> <a hr=
ef=3D"attachment.cgi?id=3D124894&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

Hi, I have tested this several times with several different kernels, always
with the same result. It deadlocks wayland or X within seconds after openin=
g a
terminal or chrome.

It starts out like this:
[  108.167312] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[  108.167328] nouveau 0000:01:00.0: fifo: msppp engine fault on channel 12,
recovering...
[  118.871915] nouveau 0000:01:00.0: multiqueue0:src[7039]: failed to idle
channel 12 [multiqueue0:src[7039]]
[  133.873009] nouveau 0000:01:00.0: multiqueue0:src[7039]: failed to idle
channel 12 [multiqueue0:src[7039]]
[  134.242698] nouveau 0000:01:00.0: mspdec: intr 028c0000
[  134.242744] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 08=
4048
[ IBUS ]
[  138.538241] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[  138.538259] nouveau 0000:01:00.0: fifo: mspdec engine fault on channel 1=
2,
recovering...
[  140.537498] nouveau 0000:01:00.0: fifo: runlist update timeout

And then it all breaks down and never recovers (the machine is reachable but
can't reboot properly afterwards)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14676383750.304177aC.23130--

--===============1192462677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1192462677==--

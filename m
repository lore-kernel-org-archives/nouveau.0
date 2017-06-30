From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101665] New: lspci blocks forever with a GP107M
Date: Fri, 30 Jun 2017 17:13:52 +0000
Message-ID: <bug-101665-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1932879607=="
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


--===============1932879607==
Content-Type: multipart/alternative; boundary="14988428322.e9b2.618";
 charset="UTF-8"


--14988428322.e9b2.618
Date: Fri, 30 Jun 2017 17:13:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101665

            Bug ID: 101665
           Summary: lspci blocks forever with a GP107M
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kenneth-xkhwgxqQjnbNLxjTenLetw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hello,

I have a Dell XPS 15 9560 with a GTX 1050 Mobile (GP107M) and an Intel Kaby=
lake
CPU.  Using Kernel 4.11.3 on the Arch installer image, whenever I run 'lspc=
i',
it blocks indefinitely and never prints any output.

After running lspci, dmesg contains:

[   54.819264] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   54.879968] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   54.879973] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   54.879974] nouveau 0000:01:00.0: DRM: resuming object tree...

Eventually the scheduler gets cranky about the hung process and starts spew=
ing
[  245.385522] INFO: task lspci:576 blocked for more than 120 seconds.
and a backtrace every 2 minutes.

Blacklisting nouveau makes lspci work.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14988428322.e9b2.618
Date: Fri, 30 Jun 2017 17:13:52 +0000
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
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101665">101665</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>lspci blocks forever with a GP107M
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
          <td>kenneth&#64;whitecape.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,

I have a Dell XPS 15 9560 with a GTX 1050 Mobile (GP107M) and an Intel Kaby=
lake
CPU.  Using Kernel 4.11.3 on the Arch installer image, whenever I run 'lspc=
i',
it blocks indefinitely and never prints any output.

After running lspci, dmesg contains:

[   54.819264] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   54.879968] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   54.879973] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   54.879974] nouveau 0000:01:00.0: DRM: resuming object tree...

Eventually the scheduler gets cranky about the hung process and starts spew=
ing
[  245.385522] INFO: task lspci:576 blocked for more than 120 seconds.
and a backtrace every 2 minutes.

Blacklisting nouveau makes lspci work.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14988428322.e9b2.618--

--===============1932879607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1932879607==--

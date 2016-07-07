From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96836] New: Kernel unaligned access at TPC[105d9fb4]
 nvkm_instobj_wr32+0x14/0x20 [nouveau]
Date: Thu, 07 Jul 2016 02:23:25 +0000
Message-ID: <bug-96836-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1786328609=="
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


--===============1786328609==
Content-Type: multipart/alternative; boundary="14678582050.5C94A0B.20434";
 charset="UTF-8"


--14678582050.5C94A0B.20434
Date: Thu, 7 Jul 2016 02:23:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96836

            Bug ID: 96836
           Summary: Kernel unaligned access at TPC[105d9fb4]
                    nvkm_instobj_wr32+0x14/0x20 [nouveau]
           Product: xorg
           Version: unspecified
          Hardware: SPARC
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ciaran.gillespie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When attempting to use Nouveau driver with Xorg on my SunBlade 2500 running=
 the
latested build from Debian-9.0 Sid SPARC64 CPU 0 runs up to 100% and then
eventually the Xorg session shuts down. It appears that it's timing out on a
GPU lock. A bunch of messages appears in the Xorg.0.log indicating fifo:
CACH_ERROR also with in the messages log there are several repeating errors.

log_unaligned: 598 callbacks suppressed
Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr32+0x14/0x20 [nouve=
au]

Eventually the Xorg session gives up and times out.

I'll try and attach some more logs but it appears to have something to do w=
ith
the iowrite32_native macro on SPARC V9 systems.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14678582050.5C94A0B.20434
Date: Thu, 7 Jul 2016 02:23:25 +0000
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
   title=3D"NEW - Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr3=
2+0x14/0x20 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96836">96836</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr32+0x=
14/0x20 [nouveau]
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
          <td>SPARC
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
          <td>ciaran.gillespie&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When attempting to use Nouveau driver with Xorg on my SunBlade=
 2500 running the
latested build from Debian-9.0 Sid SPARC64 CPU 0 runs up to 100% and then
eventually the Xorg session shuts down. It appears that it's timing out on a
GPU lock. A bunch of messages appears in the Xorg.0.log indicating fifo:
CACH_ERROR also with in the messages log there are several repeating errors.

log_unaligned: 598 callbacks suppressed
Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr32+0x14/0x20 [nouve=
au]

Eventually the Xorg session gives up and times out.

I'll try and attach some more logs but it appears to have something to do w=
ith
the iowrite32_native macro on SPARC V9 systems.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14678582050.5C94A0B.20434--

--===============1786328609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1786328609==--

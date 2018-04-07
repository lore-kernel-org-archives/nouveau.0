From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105940] New: Display freeze caused by nouveau
Date: Sat, 07 Apr 2018 12:57:19 +0000
Message-ID: <bug-105940-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2077172173=="
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


--===============2077172173==
Content-Type: multipart/alternative; boundary="15231058390.DB4Bbe4.9687"
Content-Transfer-Encoding: 7bit


--15231058390.DB4Bbe4.9687
Date: Sat, 7 Apr 2018 12:57:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105940

            Bug ID: 105940
           Summary: Display freeze caused by nouveau
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: stefano.biagiotti-h53T4Qt7PfY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 138676
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138676&action=3Dedit
journalctl -k -b -1 --no-pager --no-hostname

On my Fedora 27 system, display often freezes unpredictably. Mouse and keyb=
oard
don't work, but system is pingable and I can login using ssh.

I actually use kernel-4.15.14-300.fc27.x86_64,
xorg-x11-drv-nouveau-1.0.15-3.fc27.x86_64.=20

I have two monitors connected to the display adapter. Hardware is (from lsp=
ci):
01:00.0 VGA compatible controller: NVIDIA Corporation GT215 [GeForce GT 320]
(rev a2)

Excerpt of journalctl (full journalctl in attachment):

apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH TLB flush idle tim=
eout
fail
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH_STATUS 00be0003 [B=
USY
DISPATCH ENG2D RMASK TPC_RAST TPC_PROP TPC_TEX TPC_MP]
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS0: 00000000=
 []
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS1: 0000106d
[TPC_TEX TPC_MP]
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS2: 00148000
[ENG2D]
apr 07 12:51:35 kernel: ------------[ cut here ]------------
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: timeout
apr 07 12:51:35 kernel: WARNING: CPU: 3 PID: 1929 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.c:171 g84_gr_tlb_flush+0x2ce/0x3=
60
[nouveau]
a

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15231058390.DB4Bbe4.9687
Date: Sat, 7 Apr 2018 12:57:19 +0000
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
   title=3D"NEW - Display freeze caused by nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105940">105940</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Display freeze caused by nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>stefano.biagiotti&#64;gtn.it
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138676=
" name=3D"attach_138676" title=3D"journalctl -k -b -1 --no-pager --no-hostn=
ame">attachment 138676</a> <a href=3D"attachment.cgi?id=3D138676&amp;action=
=3Dedit" title=3D"journalctl -k -b -1 --no-pager --no-hostname">[details]</=
a></span>
journalctl -k -b -1 --no-pager --no-hostname

On my Fedora 27 system, display often freezes unpredictably. Mouse and keyb=
oard
don't work, but system is pingable and I can login using ssh.

I actually use kernel-4.15.14-300.fc27.x86_64,
xorg-x11-drv-nouveau-1.0.15-3.fc27.x86_64.=20

I have two monitors connected to the display adapter. Hardware is (from lsp=
ci):
01:00.0 VGA compatible controller: NVIDIA Corporation GT215 [GeForce GT 320]
(rev a2)

Excerpt of journalctl (full journalctl in attachment):

apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH TLB flush idle tim=
eout
fail
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH_STATUS 00be0003 [B=
USY
DISPATCH ENG2D RMASK TPC_RAST TPC_PROP TPC_TEX TPC_MP]
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS0: 00000000=
 []
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS1: 0000106d
[TPC_TEX TPC_MP]
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS2: 00148000
[ENG2D]
apr 07 12:51:35 kernel: ------------[ cut here ]------------
apr 07 12:51:35 kernel: nouveau 0000:01:00.0: timeout
apr 07 12:51:35 kernel: WARNING: CPU: 3 PID: 1929 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.c:171 g84_gr_tlb_flush+0x2ce/0x3=
60
[nouveau]
a</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15231058390.DB4Bbe4.9687--

--===============2077172173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2077172173==--

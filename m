From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111724] New: NVE6 (GK106) memory re-clocking breaks
 GpuTest plot3d benchmark
Date: Tue, 17 Sep 2019 14:31:43 +0000
Message-ID: <bug-111724-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1697309253=="
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


--===============1697309253==
Content-Type: multipart/alternative; boundary="15687307051.36E3bCE.9244"
Content-Transfer-Encoding: 7bit


--15687307051.36E3bCE.9244
Date: Tue, 17 Sep 2019 14:31:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111724

            Bug ID: 111724
           Summary: NVE6 (GK106) memory re-clocking breaks GpuTest plot3d
                    benchmark
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I have stepped upon a problem with NVE6 (GK106) in GpuTest
https://www.geeks3d.com/gputest/ plot3d benchmark that occurs only in plot3d
and nowhere else. There are visible glitches and when left for a longer time
Nouveau seems to crash.

The GPU has 4 profiles:=20
07: core 324 MHz memory 648 MHz
0a: core 324-862 MHz memory 1620 MHz
0d: core 549-1228 MHz memory 6008 MHz
0f: core 549-1228 MHz memory 6008 MHz

The problem occurs when switching re-clocking profile directly from 648 MHz=
 to
6008 MHz skipping the 0xA 1620 MHz profile. If gone through 0xA profile
everything works fine.

If the memory re-clocking is disabled, it works fine. If there is 0xF profi=
le
set directly (breaking the benchmark) with memory re-clocking enabled, then=
 the
nouveau gets unloaded, and nouveau gets loaded back with memory re-clocking
disabled, when changing re-clocking profiles it still glitches. Which impli=
es
something that breaks this is only touched when the memory re-clocking is
enabled.

I have gone through all nouveau pmu scripts traces, checked every difference
(of the scripts) with Nvidia driver and nothing seemed to affect this probl=
em
that has different values than Nvidia. Actual code which was changing the
values for 0xf profile to be same as Nvidia is here:
https://github.com/mmenzyns/nouveau/tree/linux-5.2_gk106_memory_issues. The
scripts for the highest-profile should be almost identical between Nvidia a=
nd
Nouveau.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687307051.36E3bCE.9244
Date: Tue, 17 Sep 2019 14:31:45 +0000
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
   title=3D"NEW - NVE6 (GK106) memory re-clocking breaks GpuTest plot3d ben=
chmark"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111724">111724</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVE6 (GK106) memory re-clocking breaks GpuTest plot3d benchma=
rk
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
          <td>not set
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
          <td>mmenzyns&#64;redhat.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have stepped upon a problem with NVE6 (GK106) in GpuTest
<a href=3D"https://www.geeks3d.com/gputest/">https://www.geeks3d.com/gputes=
t/</a> plot3d benchmark that occurs only in plot3d
and nowhere else. There are visible glitches and when left for a longer time
Nouveau seems to crash.

The GPU has 4 profiles:=20
07: core 324 MHz memory 648 MHz
0a: core 324-862 MHz memory 1620 MHz
0d: core 549-1228 MHz memory 6008 MHz
0f: core 549-1228 MHz memory 6008 MHz

The problem occurs when switching re-clocking profile directly from 648 MHz=
 to
6008 MHz skipping the 0xA 1620 MHz profile. If gone through 0xA profile
everything works fine.

If the memory re-clocking is disabled, it works fine. If there is 0xF profi=
le
set directly (breaking the benchmark) with memory re-clocking enabled, then=
 the
nouveau gets unloaded, and nouveau gets loaded back with memory re-clocking
disabled, when changing re-clocking profiles it still glitches. Which impli=
es
something that breaks this is only touched when the memory re-clocking is
enabled.

I have gone through all nouveau pmu scripts traces, checked every difference
(of the scripts) with Nvidia driver and nothing seemed to affect this probl=
em
that has different values than Nvidia. Actual code which was changing the
values for 0xf profile to be same as Nvidia is here:
<a href=3D"https://github.com/mmenzyns/nouveau/tree/linux-5.2_gk106_memory_=
issues">https://github.com/mmenzyns/nouveau/tree/linux-5.2_gk106_memory_iss=
ues</a>. The
scripts for the highest-profile should be almost identical between Nvidia a=
nd
Nouveau.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687307051.36E3bCE.9244--

--===============1697309253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1697309253==--

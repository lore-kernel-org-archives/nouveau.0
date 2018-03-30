From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105814] New: Frequent Xorg lockups with GT710 after
 rad or write faults
Date: Fri, 30 Mar 2018 01:49:11 +0000
Message-ID: <bug-105814-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1833865527=="
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


--===============1833865527==
Content-Type: multipart/alternative; boundary="15223745511.2ebCBaF7.1783"
Content-Transfer-Encoding: 7bit


--15223745511.2ebCBaF7.1783
Date: Fri, 30 Mar 2018 01:49:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105814

            Bug ID: 105814
           Summary: Frequent Xorg lockups with GT710 after rad or write
                    faults
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: zarniwhoop-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

This is my second problem on my new machine (ryzen, GT710 (GK208B) - I need=
ed a
vga connector), linux-4.15.12, gcc-7.3.0, glibc-2.27, mesa-17.3.7,
xorg-server-1.19.6, mouveau-1.0.15).

I am seeing frequent lockups in X (keyboard and mouse not working, but
MagicSysRQ works). Arguably this is similar to #104448, but I'm using "regu=
lar"
glibc.

There is no particular pattern to when this bug bites - the first time, I h=
ad
just built icewm, rerun startx, and was evaluating the various themes. Late=
r, I
was installing firefox extension ublock-origin. As with the other bug I just
raised (105813) I tried using the modesetting Xorg driver instead of nouvea=
u,
but the problem occurred again (left it compiling, came back to a frozen
xscreensaver). After that I turned off xscreensaver and it has now been up =
for
perhaps 2 hours, but will maybe go down again soon ;-(

From these failures I have extracted the following from my syslog, several =
(but
not all) show UNSUPPORTED_KIND. The 'scheduled for recovery' messages imply=
 it
might self-correct, but it doesn't seem to.

Mar 28 18:50:05 origin kernel: [ 7715.267689] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 18:50:05 origin kernel: [ 7715.273911] nouveau 0000:26:00.0: fifo: w=
rite
fault at 0003228000 engine 1b [CE2] client 18 [GR_CE] reason 0c
[UNSUPPORTED_KIND] on channel 2 [003fbfa000 Xorg[22520]]
Mar 28 18:50:05 origin kernel: [ 7715.273921] nouveau 0000:26:00.0: fifo:
channel 2: killed
Mar 28 18:50:05 origin kernel: [ 7715.273923] nouveau 0000:26:00.0: fifo:
runlist 0: scheduled for recovery
Mar 28 18:50:05 origin kernel: [ 7715.273934] nouveau 0000:26:00.0: fifo:
engine 0: scheduled for recovery
Mar 28 18:50:05 origin kernel: [ 7715.273938] nouveau 0000:26:00.0: fifo:
engine 6: scheduled for recovery
Mar 28 18:50:05 origin kernel: [ 7715.273965] nouveau 0000:26:00.0:
Xorg[22520]: channel 2 killed!

Mar 28 19:33:30 origin kernel: [ 2215.090852] nouveau 0000:26:00.0: fifo: r=
ead
fault at 000171c000 engine 1b [CE2] client 18 [GR_CE] reason 02 [PTE] on
channel 2 [003fbfa000 Xorg[1576]]
Mar 28 19:33:30 origin kernel: [ 2215.090861] nouveau 0000:26:00.0: fifo:
channel 2: killed
Mar 28 19:33:30 origin kernel: [ 2215.090863] nouveau 0000:26:00.0: fifo:
runlist 0: scheduled for recovery
Mar 28 19:33:30 origin kernel: [ 2215.090873] nouveau 0000:26:00.0: fifo:
engine 0: scheduled for recovery
Mar 28 19:33:30 origin kernel: [ 2215.090877] nouveau 0000:26:00.0: fifo:
engine 6: scheduled for recovery
Mar 28 19:33:30 origin kernel: [ 2215.090891] nouveau 0000:26:00.0: Xorg[15=
76]:
channel 2 killed!

Mar 28 22:27:26 origin kernel: [ 3793.782622] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000004
Mar 28 22:27:27 origin kernel: [ 3794.949062] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 22:27:27 origin kernel: [ 3794.949066] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 22:27:27 origin kernel: [ 3795.465905] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 22:27:27 origin kernel: [ 3795.465909] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 22:27:27 origin kernel: [ 3795.532524] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 22:27:27 origin kernel: [ 3795.537738] nouveau 0000:26:00.0: fifo: r=
ead
fault at 0001f08000 engine 1b [CE2] client 18 [GR_CE] reason 0c
[UNSUPPORTED_KIND] on channel 2 [003fbfa000 Xorg[1290]]
Mar 28 22:27:27 origin kernel: [ 3795.537745] nouveau 0000:26:00.0: fifo:
channel 2: killed
Mar 28 22:27:27 origin kernel: [ 3795.537747] nouveau 0000:26:00.0: fifo:
runlist 0: scheduled for recovery
Mar 28 22:27:27 origin kernel: [ 3795.537757] nouveau 0000:26:00.0: fifo:
engine 0: scheduled for recovery
Mar 28 22:27:27 origin kernel: [ 3795.537761] nouveau 0000:26:00.0: fifo:
engine 6: scheduled for recovery

Mar 29 21:19:49 origin kernel: [13387.804276] nouveau 0000:26:00.0: fifo: r=
ead
fault at 0004740000 engine 1b [CE2] client 18 [GR_CE] reason 0c
[UNSUPPORTED_KIND] on channel 2 [003fbfa000 Xorg[1343]]
Mar 29 21:19:49 origin kernel: [13387.804286] nouveau 0000:26:00.0: fifo:
channel 2: killed
Mar 29 21:19:49 origin kernel: [13387.804289] nouveau 0000:26:00.0: fifo:
runlist 0: scheduled for recovery
Mar 29 21:19:49 origin kernel: [13387.804299] nouveau 0000:26:00.0: fifo:
engine 0: scheduled for recovery
Mar 29 21:19:49 origin kernel: [13387.804303] nouveau 0000:26:00.0: fifo:
engine 6: scheduled for recovery
Mar 29 21:19:49 origin kernel: [13387.804308] nouveau 0000:26:00.0: Xorg[13=
43]:
channel 2 killed!

(that last one was using modesetting, the others were using the Xorg nouveau
driver).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15223745511.2ebCBaF7.1783
Date: Fri, 30 Mar 2018 01:49:11 +0000
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
   title=3D"NEW - Frequent Xorg lockups with GT710 after rad or write fault=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105814">105814</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Frequent Xorg lockups with GT710 after rad or write faults
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
          <td>zarniwhoop&#64;ntlworld.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This is my second problem on my new machine (ryzen, GT710 (GK2=
08B) - I needed a
vga connector), linux-4.15.12, gcc-7.3.0, glibc-2.27, mesa-17.3.7,
xorg-server-1.19.6, mouveau-1.0.15).

I am seeing frequent lockups in X (keyboard and mouse not working, but
MagicSysRQ works). Arguably this is similar to #104448, but I'm using &quot=
;regular&quot;
glibc.

There is no particular pattern to when this bug bites - the first time, I h=
ad
just built icewm, rerun startx, and was evaluating the various themes. Late=
r, I
was installing firefox extension ublock-origin. As with the other bug I just
raised (105813) I tried using the modesetting Xorg driver instead of nouvea=
u,
but the problem occurred again (left it compiling, came back to a frozen
xscreensaver). After that I turned off xscreensaver and it has now been up =
for
perhaps 2 hours, but will maybe go down again soon ;-(

From these failures I have extracted the following from my syslog, several =
(but
not all) show UNSUPPORTED_KIND. The 'scheduled for recovery' messages imply=
 it
might self-correct, but it doesn't seem to.

Mar 28 18:50:05 origin kernel: [ 7715.267689] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 18:50:05 origin kernel: [ 7715.273911] nouveau 0000:26:00.0: fifo: w=
rite
fault at 0003228000 engine 1b [CE2] client 18 [GR_CE] reason 0c
[UNSUPPORTED_KIND] on channel 2 [003fbfa000 Xorg[22520]]
Mar 28 18:50:05 origin kernel: [ 7715.273921] nouveau 0000:26:00.0: fifo:
channel 2: killed
Mar 28 18:50:05 origin kernel: [ 7715.273923] nouveau 0000:26:00.0: fifo:
runlist 0: scheduled for recovery
Mar 28 18:50:05 origin kernel: [ 7715.273934] nouveau 0000:26:00.0: fifo:
engine 0: scheduled for recovery
Mar 28 18:50:05 origin kernel: [ 7715.273938] nouveau 0000:26:00.0: fifo:
engine 6: scheduled for recovery
Mar 28 18:50:05 origin kernel: [ 7715.273965] nouveau 0000:26:00.0:
Xorg[22520]: channel 2 killed!

Mar 28 19:33:30 origin kernel: [ 2215.090852] nouveau 0000:26:00.0: fifo: r=
ead
fault at 000171c000 engine 1b [CE2] client 18 [GR_CE] reason 02 [PTE] on
channel 2 [003fbfa000 Xorg[1576]]
Mar 28 19:33:30 origin kernel: [ 2215.090861] nouveau 0000:26:00.0: fifo:
channel 2: killed
Mar 28 19:33:30 origin kernel: [ 2215.090863] nouveau 0000:26:00.0: fifo:
runlist 0: scheduled for recovery
Mar 28 19:33:30 origin kernel: [ 2215.090873] nouveau 0000:26:00.0: fifo:
engine 0: scheduled for recovery
Mar 28 19:33:30 origin kernel: [ 2215.090877] nouveau 0000:26:00.0: fifo:
engine 6: scheduled for recovery
Mar 28 19:33:30 origin kernel: [ 2215.090891] nouveau 0000:26:00.0: Xorg[15=
76]:
channel 2 killed!

Mar 28 22:27:26 origin kernel: [ 3793.782622] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000004
Mar 28 22:27:27 origin kernel: [ 3794.949062] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 22:27:27 origin kernel: [ 3794.949066] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 22:27:27 origin kernel: [ 3795.465905] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 22:27:27 origin kernel: [ 3795.465909] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 22:27:27 origin kernel: [ 3795.532524] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 22:27:27 origin kernel: [ 3795.537738] nouveau 0000:26:00.0: fifo: r=
ead
fault at 0001f08000 engine 1b [CE2] client 18 [GR_CE] reason 0c
[UNSUPPORTED_KIND] on channel 2 [003fbfa000 Xorg[1290]]
Mar 28 22:27:27 origin kernel: [ 3795.537745] nouveau 0000:26:00.0: fifo:
channel 2: killed
Mar 28 22:27:27 origin kernel: [ 3795.537747] nouveau 0000:26:00.0: fifo:
runlist 0: scheduled for recovery
Mar 28 22:27:27 origin kernel: [ 3795.537757] nouveau 0000:26:00.0: fifo:
engine 0: scheduled for recovery
Mar 28 22:27:27 origin kernel: [ 3795.537761] nouveau 0000:26:00.0: fifo:
engine 6: scheduled for recovery

Mar 29 21:19:49 origin kernel: [13387.804276] nouveau 0000:26:00.0: fifo: r=
ead
fault at 0004740000 engine 1b [CE2] client 18 [GR_CE] reason 0c
[UNSUPPORTED_KIND] on channel 2 [003fbfa000 Xorg[1343]]
Mar 29 21:19:49 origin kernel: [13387.804286] nouveau 0000:26:00.0: fifo:
channel 2: killed
Mar 29 21:19:49 origin kernel: [13387.804289] nouveau 0000:26:00.0: fifo:
runlist 0: scheduled for recovery
Mar 29 21:19:49 origin kernel: [13387.804299] nouveau 0000:26:00.0: fifo:
engine 0: scheduled for recovery
Mar 29 21:19:49 origin kernel: [13387.804303] nouveau 0000:26:00.0: fifo:
engine 6: scheduled for recovery
Mar 29 21:19:49 origin kernel: [13387.804308] nouveau 0000:26:00.0: Xorg[13=
43]:
channel 2 killed!

(that last one was using modesetting, the others were using the Xorg nouveau
driver).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15223745511.2ebCBaF7.1783--

--===============1833865527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1833865527==--

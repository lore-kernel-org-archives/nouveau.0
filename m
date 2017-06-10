From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101372] New: nouveau?/DRI3?: dual monitors unusable
 without running compton --paint-on-overlay (sometimes)
Date: Sat, 10 Jun 2017 19:24:23 +0000
Message-ID: <bug-101372-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0045688663=="
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


--===============0045688663==
Content-Type: multipart/alternative; boundary="14971226630.0EdDbc08.14845";
 charset="UTF-8"


--14971226630.0EdDbc08.14845
Date: Sat, 10 Jun 2017 19:24:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101372

            Bug ID: 101372
           Summary: nouveau?/DRI3?: dual monitors unusable without running
                    compton --paint-on-overlay (sometimes)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jimijames.bove-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Last known good version: 4.9.8
Software: Arch Linux, XFCE, compton, nouveau (using DRI3)
Hardware: NVIDIA Corporation GK107 [GeForce GT 740] (rev a1)

The behavior of this bug is identical to #97916
(https://bugs.freedesktop.org/show_bug.cgi?id=3D97916), but none of the
workarounds work. Usually.

Quoting its behavior because they explained it way better than I could:
With default settings (no xorg.conf), dual monitors can only be used in "cl=
one"
mode.  When trying to switch to "extend" mode, the right-hand display freez=
es
and continues to display a snapshot of the cloned display contents at the t=
ime
of the switch.  Using Option "DRI" "2" in xorg.conf is a workaround.

And later on in the bug report, they discovered another workaround is making
sure your compositor does what the --paint-on-overlay option makes compton =
do.

In my case, a few things are different:
1. I'm not running Ivy Bridge.
2. Switching to DRI2 does NOT fix it.
3. Enabling --paint-on-overlay fixed it the first time I tried it, even acr=
oss
multiple boots and tests, and then randomly stopped working for seemingly no
reason. I had changed nothing about my system.
4. I started having this issue when I upgraded the kernel to 4.9.10 from 4.=
9.8,
rather than when it started for them: 4.7.4. And yes, I already tested to
confirm that this behavior changes between those two versions of Linux, and=
 not
with any other upgrade or downgrade to any of my other packages (not even
nouveau, mesa, or xorg). You might ask why I'm making this bug report here,
then, instead of at bugzilla.kernel.org. That's because of
https://bugzilla.kernel.org/show_bug.cgi?id=3D195321#c5
5. When X and XFCE first run, this behavior doesn't  happen at all (assumin=
g it
wasn't happening before I shut it down). My dual-monitor setup still works
properly. However, once I disconnect that monitor--or if it was disconnected
when I rebooted, causing my system to remember that on boot--this behavior
starts, and does not go away until I disable and enable the monitor in XFCE=
's
Display preferences, which then restores the proper behavior until the next
disconnect. It specifically has to be XFCE's Display preferences. Adding a
regular, simple (using nothing but two Monitor sections and Identifiers
matching the monitor names) dual-monitor .conf file to xorg.conf.d/ actually
made it worse by causing this behavior to start immediately at boot no matt=
er
what, and for some reason xrandr couldn't turn the monitor back on after
running xrandr --output <output> --off (though XFCE's preferences COULD tur=
n it
back on).
6. I still have this behavior when compton is disabled and I'm not running =
any
compositor at all. I specifically have to either downgrade the kernel or run
compton with the --paint-on-overlay option to fix it (when that even manage=
s to
fix it).

I have not yet tested a newer kernel version than 4.9.10, but I plan to whe=
n I
have more time, probably in a week, but possibly in a month.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14971226630.0EdDbc08.14845
Date: Sat, 10 Jun 2017 19:24:23 +0000
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
   title=3D"NEW - nouveau?/DRI3?: dual monitors unusable without running co=
mpton --paint-on-overlay (sometimes)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101372">101372</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau?/DRI3?: dual monitors unusable without running compto=
n --paint-on-overlay (sometimes)
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
          <td>critical
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
          <td>jimijames.bove&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Last known good version: 4.9.8
Software: Arch Linux, XFCE, compton, nouveau (using DRI3)
Hardware: NVIDIA Corporation GK107 [GeForce GT 740] (rev a1)

The behavior of this bug is identical to #97916
(<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Dual monitors unusable with DRI3 on Ivy Bridge"
   href=3D"show_bug.cgi?id=3D97916">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D97916</a>), but none of the
workarounds work. Usually.

Quoting its behavior because they explained it way better than I could:
With default settings (no xorg.conf), dual monitors can only be used in &qu=
ot;clone&quot;
mode.  When trying to switch to &quot;extend&quot; mode, the right-hand dis=
play freezes
and continues to display a snapshot of the cloned display contents at the t=
ime
of the switch.  Using Option &quot;DRI&quot; &quot;2&quot; in xorg.conf is =
a workaround.

And later on in the bug report, they discovered another workaround is making
sure your compositor does what the --paint-on-overlay option makes compton =
do.

In my case, a few things are different:
1. I'm not running Ivy Bridge.
2. Switching to DRI2 does NOT fix it.
3. Enabling --paint-on-overlay fixed it the first time I tried it, even acr=
oss
multiple boots and tests, and then randomly stopped working for seemingly no
reason. I had changed nothing about my system.
4. I started having this issue when I upgraded the kernel to 4.9.10 from 4.=
9.8,
rather than when it started for them: 4.7.4. And yes, I already tested to
confirm that this behavior changes between those two versions of Linux, and=
 not
with any other upgrade or downgrade to any of my other packages (not even
nouveau, mesa, or xorg). You might ask why I'm making this bug report here,
then, instead of at bugzilla.kernel.org. That's because of
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D195321#c5">https:/=
/bugzilla.kernel.org/show_bug.cgi?id=3D195321#c5</a>
5. When X and XFCE first run, this behavior doesn't  happen at all (assumin=
g it
wasn't happening before I shut it down). My dual-monitor setup still works
properly. However, once I disconnect that monitor--or if it was disconnected
when I rebooted, causing my system to remember that on boot--this behavior
starts, and does not go away until I disable and enable the monitor in XFCE=
's
Display preferences, which then restores the proper behavior until the next
disconnect. It specifically has to be XFCE's Display preferences. Adding a
regular, simple (using nothing but two Monitor sections and Identifiers
matching the monitor names) dual-monitor .conf file to xorg.conf.d/ actually
made it worse by causing this behavior to start immediately at boot no matt=
er
what, and for some reason xrandr couldn't turn the monitor back on after
running xrandr --output &lt;output&gt; --off (though XFCE's preferences COU=
LD turn it
back on).
6. I still have this behavior when compton is disabled and I'm not running =
any
compositor at all. I specifically have to either downgrade the kernel or run
compton with the --paint-on-overlay option to fix it (when that even manage=
s to
fix it).

I have not yet tested a newer kernel version than 4.9.10, but I plan to whe=
n I
have more time, probably in a week, but possibly in a month.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14971226630.0EdDbc08.14845--

--===============0045688663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0045688663==--

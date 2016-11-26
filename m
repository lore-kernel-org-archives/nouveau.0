From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90351] [Regression,
 bisected] Backlight of internal eDP display doesn't turn off any
 more (Dell XPS 17/GeForce GT 555M)
Date: Sat, 26 Nov 2016 14:52:46 +0000
Message-ID: <bug-90351-8800-mNgV9jg59H@http.bugs.freedesktop.org/>
References: <bug-90351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0481453178=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90351-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0481453178==
Content-Type: multipart/alternative; boundary="14801719670.a310bDCA.8695";
 charset="UTF-8"


--14801719670.a310bDCA.8695
Date: Sat, 26 Nov 2016 14:52:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D90351

Erik van Pienbroek <erik-freedesktop-bugzilla-7hpmIAI+aCYpZwe9G04TCw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #115605|0                           |1
        is obsolete|                            |

--- Comment #2 from Erik van Pienbroek <erik-freedesktop-bugzilla@vanpienbr=
oek.nl> ---
Created attachment 128201
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128201&action=3Dedit
debug logging k.8.8-300.nvmst.fc25.x86_64

The nouveau atomic modesetting changes have arrived recently in the drm-next
tree. I did some testing with a recent drm-next git checkout and the situat=
ion
has improved regarding this bug, but it's not fully solved yet. The findings
were also discussed in downstream bug report
https://bugzilla.redhat.com/show_bug.cgi?id=3D1123661 but I'll also share t=
hem
here.

Initial testing was done with drm-next git rev d8c1abd, dated 20161111. With
this kernel I can confirm that with no external monitors connected the
backlight of the internal laptop monitor now turns off properly when the GN=
OME
session is locked. So we can consider that part of this bug report resolved
(the patch which was uploaded to this bug report earlier can be considered
obsolete now)

However, when an external monitor is attached (using a mini-DP-to-DP adapte=
r)
and powered on as well then locking the GNOME session results in the behavi=
our
which was also mentioned in comment 0, that is: the backlight of both the
internal monitor and the external monitor initially turn off properly, but
after 8 seconds the backlight of both monitors suddenly turns back on while=
 the
image on both monitors stays blank. When I press any key or move the mouse =
the
image comes back normally and I can unlock the GNOME session and resume wor=
k.

As suggested by Hans de Goede in the downstream bug report I also did testi=
ng
with a custom Fedora kernel which was prepared by Ben Skeggs recently
(containing a backport of the nouveau atomic modesetting changes:
https://copr.fedorainfracloud.org/coprs/bskeggs/nouveau-atomic-mst) but that
kernel also showed the same issue.

I managed to collect debug logging from both nouveau and gnome-settings-dae=
mon
(using kernel boot flags 'log_buf_len=3D8M nouveau.debug=3Ddisp=3Dtrace,i2c=
=3Dtrace
drm.debug=3D0x14' and running gnome-settings-daemon with the '--debug' argu=
ment)
and uploaded it to both this bug report.  In this logging these are the rel=
ated
timestamp events:
nov 21 19:05:53 - Boot of kernel 4.8.8-300.nvmst.fc25.x86_64
nov 21 19:07:00 - Pressed Super+L to lock the GNOME session
(both monitors turns off now including both backlights)
nov 21 19:07:08 - Backlight of both the internal and the external monitors =
turn
back on automatically showing just a blank screen
nov 21 19:07:29 - Unlock of the GNOME session

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14801719670.a310bDCA.8695
Date: Sat, 26 Nov 2016 14:52:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:erik-free=
desktop-bugzilla&#64;vanpienbroek.nl" title=3D"Erik van Pienbroek &lt;erik-=
freedesktop-bugzilla&#64;vanpienbroek.nl&gt;"> <span class=3D"fn">Erik van =
Pienbroek</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Regression, bisected] Backlight of internal eDP display =
doesn't turn off any more (Dell XPS 17/GeForce GT 555M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90351">bug 90351<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #115605 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Regression, bisected] Backlight of internal eDP display =
doesn't turn off any more (Dell XPS 17/GeForce GT 555M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90351#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Regression, bisected] Backlight of internal eDP display =
doesn't turn off any more (Dell XPS 17/GeForce GT 555M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90351">bug 90351<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erik-freedesktop-bugzilla&#64;vanpienbroek.nl" title=3D"Erik van Pienbroek =
&lt;erik-freedesktop-bugzilla&#64;vanpienbroek.nl&gt;"> <span class=3D"fn">=
Erik van Pienbroek</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128201=
" name=3D"attach_128201" title=3D"debug logging k.8.8-300.nvmst.fc25.x86_64=
">attachment 128201</a> <a href=3D"attachment.cgi?id=3D128201&amp;action=3D=
edit" title=3D"debug logging k.8.8-300.nvmst.fc25.x86_64">[details]</a></sp=
an>
debug logging k.8.8-300.nvmst.fc25.x86_64

The nouveau atomic modesetting changes have arrived recently in the drm-next
tree. I did some testing with a recent drm-next git checkout and the situat=
ion
has improved regarding this bug, but it's not fully solved yet. The findings
were also discussed in downstream bug report
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1123661">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1123661</a> but I'll also share them
here.

Initial testing was done with drm-next git rev d8c1abd, dated 20161111. With
this kernel I can confirm that with no external monitors connected the
backlight of the internal laptop monitor now turns off properly when the GN=
OME
session is locked. So we can consider that part of this bug report resolved
(the patch which was uploaded to this bug report earlier can be considered
obsolete now)

However, when an external monitor is attached (using a mini-DP-to-DP adapte=
r)
and powered on as well then locking the GNOME session results in the behavi=
our
which was also mentioned in <a href=3D"show_bug.cgi?id=3D90351#c0">comment =
0</a>, that is: the backlight of both the
internal monitor and the external monitor initially turn off properly, but
after 8 seconds the backlight of both monitors suddenly turns back on while=
 the
image on both monitors stays blank. When I press any key or move the mouse =
the
image comes back normally and I can unlock the GNOME session and resume wor=
k.

As suggested by Hans de Goede in the downstream bug report I also did testi=
ng
with a custom Fedora kernel which was prepared by Ben Skeggs recently
(containing a backport of the nouveau atomic modesetting changes:
<a href=3D"https://copr.fedorainfracloud.org/coprs/bskeggs/nouveau-atomic-m=
st">https://copr.fedorainfracloud.org/coprs/bskeggs/nouveau-atomic-mst</a>)=
 but that
kernel also showed the same issue.

I managed to collect debug logging from both nouveau and gnome-settings-dae=
mon
(using kernel boot flags 'log_buf_len=3D8M nouveau.debug=3Ddisp=3Dtrace,i2c=
=3Dtrace
drm.debug=3D0x14' and running gnome-settings-daemon with the '--debug' argu=
ment)
and uploaded it to both this bug report.  In this logging these are the rel=
ated
timestamp events:
nov 21 19:05:53 - Boot of kernel 4.8.8-300.nvmst.fc25.x86_64
nov 21 19:07:00 - Pressed Super+L to lock the GNOME session
(both monitors turns off now including both backlights)
nov 21 19:07:08 - Backlight of both the internal and the external monitors =
turn
back on automatically showing just a blank screen
nov 21 19:07:29 - Unlock of the GNOME session</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14801719670.a310bDCA.8695--

--===============0481453178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0481453178==--

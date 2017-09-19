From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Tue, 19 Sep 2017 22:13:48 +0000
Message-ID: <bug-99900-8800-OdeacpB1yu@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0383708783=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0383708783==
Content-Type: multipart/alternative; boundary="15058592287.C4F63fA7.20458";
 charset="UTF-8"


--15058592287.C4F63fA7.20458
Date: Tue, 19 Sep 2017 22:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #19 from andrewb03-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 134350
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134350&action=3Dedit
dmesg from ARCH 4.12.3 kernel

Linux 4.12.12 (confirmed in Arch) and 4.12.13 (confirmed in both my Gentoo =
and
Arch installs) appear to break nouveau's autodetection of the display and
gnome-shell crashes:

[   12.945435] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   13.087167] gnome-shell[901]: segfault at 28 ip 00007ffab9d672f5 sp
00007fff5771ba20 error 4 in libmutter-0.so.0.0.0[7ffab9d1d000+139000]
[   16.264988] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   16.286324] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1

Attached dmesg from failed nouveau init.

Can we get movement on this?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15058592287.C4F63fA7.20458
Date: Tue, 19 Sep 2017 22:13:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrewb03&#64;gmail.com" title=3D"andrewb03&#64;gmail.com">andrewb03&#64;gm=
ail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134350=
" name=3D"attach_134350" title=3D"dmesg from ARCH 4.12.3 kernel">attachment=
 134350</a> <a href=3D"attachment.cgi?id=3D134350&amp;action=3Dedit" title=
=3D"dmesg from ARCH 4.12.3 kernel">[details]</a></span>
dmesg from ARCH 4.12.3 kernel

Linux 4.12.12 (confirmed in Arch) and 4.12.13 (confirmed in both my Gentoo =
and
Arch installs) appear to break nouveau's autodetection of the display and
gnome-shell crashes:

[   12.945435] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   13.087167] gnome-shell[901]: segfault at 28 ip 00007ffab9d672f5 sp
00007fff5771ba20 error 4 in libmutter-0.so.0.0.0[7ffab9d1d000+139000]
[   16.264988] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   16.286324] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1

Attached dmesg from failed nouveau init.

Can we get movement on this?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15058592287.C4F63fA7.20458--

--===============0383708783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0383708783==--

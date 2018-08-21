From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Tue, 21 Aug 2018 17:25:26 +0000
Message-ID: <bug-105319-8800-ILyQaUZLKV@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1717252934=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1717252934==
Content-Type: multipart/alternative; boundary="15348723260.418cC.23133"
Content-Transfer-Encoding: 7bit


--15348723260.418cC.23133
Date: Tue, 21 Aug 2018 17:25:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #26 from S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> ---
(In reply to Dominik 'Rathann' Mierzejewski from comment #25)
> I can confirm Sergio's findings so far, though
> kernel-4.15.0-0.rc4.git4.1.fc28.x86_64 (based on git commit ead68f216110)
> hangs completely upon switching fbcon to nouveaufb if I have "rhgb" in the
> kernel command line. I won't be able to provide more details for some time
> as I have to give back the machine where this can be reproduced. I'll keep
> my fingers crossed for Sergio.

Correct, here [1] is the kernel I tested .

I just started :

git bisect start v4.15-rc6 ead68f216110
Bisecting: 173 revisions left to test after this (roughly 8 steps)



[1]
kernel-4.15.0-0.rc3.git4.1.fc28
kernel-4.15.0-0.rc4.git0.1.fc28 good graphics, bad interrupts=20
kernel-4.15.0-0.rc4.git1.1.fc28
kernel-4.15.0-0.rc4.git2.1.fc28
kernel-4.15.0-0.rc4.git3.1.fc28 good graphics, bad interrupts=20
kernel-4.15.0-0.rc4.git4.1.fc28 good graphics, bad interrupts=20
kernel-4.15.0-0.rc6.git0.1.fc28 bad graphics
kernel-4.15.0-0.rc6.git0.2.fc28 bad graphics
kernel-4.15.0-0.rc6.git0.3.fc28
kernel-4.15.0-0.rc6.git1.1.fc28 good interrupts (but bad graphics)=20
kernel-4.15.0-0.rc6.git2.1.fc28

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15348723260.418cC.23133
Date: Tue, 21 Aug 2018 17:25:26 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio&#64;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.=
com&gt;"> <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span></b>
        <pre>(In reply to Dominik 'Rathann' Mierzejewski from <a href=3D"sh=
ow_bug.cgi?id=3D105319#c25">comment #25</a>)
<span class=3D"quote">&gt; I can confirm Sergio's findings so far, though
&gt; kernel-4.15.0-0.rc4.git4.1.fc28.x86_64 (based on git commit ead68f2161=
10)
&gt; hangs completely upon switching fbcon to nouveaufb if I have &quot;rhg=
b&quot; in the
&gt; kernel command line. I won't be able to provide more details for some =
time
&gt; as I have to give back the machine where this can be reproduced. I'll =
keep
&gt; my fingers crossed for Sergio.</span >

Correct, here [1] is the kernel I tested .

I just started :

git bisect start v4.15-rc6 ead68f216110
Bisecting: 173 revisions left to test after this (roughly 8 steps)



[1]
kernel-4.15.0-0.rc3.git4.1.fc28
kernel-4.15.0-0.rc4.git0.1.fc28 good graphics, bad interrupts=20
kernel-4.15.0-0.rc4.git1.1.fc28
kernel-4.15.0-0.rc4.git2.1.fc28
kernel-4.15.0-0.rc4.git3.1.fc28 good graphics, bad interrupts=20
kernel-4.15.0-0.rc4.git4.1.fc28 good graphics, bad interrupts=20
kernel-4.15.0-0.rc6.git0.1.fc28 bad graphics
kernel-4.15.0-0.rc6.git0.2.fc28 bad graphics
kernel-4.15.0-0.rc6.git0.3.fc28
kernel-4.15.0-0.rc6.git1.1.fc28 good interrupts (but bad graphics)=20
kernel-4.15.0-0.rc6.git2.1.fc28</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15348723260.418cC.23133--

--===============1717252934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1717252934==--

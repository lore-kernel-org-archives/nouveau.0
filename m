From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92961] Xorg freezes (only mouse and ssh are still
 working)
Date: Tue, 13 Feb 2018 07:46:05 +0000
Message-ID: <bug-92961-8800-22RZSZ6wte@http.bugs.freedesktop.org/>
References: <bug-92961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1443758473=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1443758473==
Content-Type: multipart/alternative; boundary="15185079653.da2be.9284"
Content-Transfer-Encoding: 7bit


--15185079653.da2be.9284
Date: Tue, 13 Feb 2018 07:46:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92961

--- Comment #16 from Tulli0 <deprisco.davide-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have the same problem with Gnome 3 on Gentoo with nouveau driver.
The freezes is randomly and with web browser, mail client and so on.
When I shutdown the system for a reboot I can see the message that I attach=
ed
I search this file [gpfifogf100.c] on internet and I find this one patch:
https://patchwork.kernel.org/patch/9502079/

I restore the previous value of ret with:
"ret =3D -EBUSY;"
in the gpfifogf100.c and gpfifogk104.c
And the problem seam solved

This is the fourth day of test without a freeze.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15185079653.da2be.9284
Date: Tue, 13 Feb 2018 07:46:05 +0000
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
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961">bug 92961<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
deprisco.davide&#64;gmail.com" title=3D"Tulli0 &lt;deprisco.davide&#64;gmai=
l.com&gt;"> <span class=3D"fn">Tulli0</span></a>
</span></b>
        <pre>I have the same problem with Gnome 3 on Gentoo with nouveau dr=
iver.
The freezes is randomly and with web browser, mail client and so on.
When I shutdown the system for a reboot I can see the message that I attach=
ed
I search this file [gpfifogf100.c] on internet and I find this one patch:
<a href=3D"https://patchwork.kernel.org/patch/9502079/">https://patchwork.k=
ernel.org/patch/9502079/</a>

I restore the previous value of ret with:
&quot;ret =3D -EBUSY;&quot;
in the gpfifogf100.c and gpfifogk104.c
And the problem seam solved

This is the fourth day of test without a freeze.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15185079653.da2be.9284--

--===============1443758473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1443758473==--

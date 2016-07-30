From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91632] Assert in nouveau_pushbuf_data
Date: Sat, 30 Jul 2016 19:07:59 +0000
Message-ID: <bug-91632-8800-tdZxOvvll4@http.bugs.freedesktop.org/>
References: <bug-91632-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0772488577=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91632-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0772488577==
Content-Type: multipart/alternative; boundary="14699056780.0Ff8.8463";
 charset="UTF-8"


--14699056780.0Ff8.8463
Date: Sat, 30 Jul 2016 19:07:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91632

--- Comment #5 from Francesco Turco <fturco-97jfqw80gc6171pxa8y+qA@public.gmane.org> ---
I can't start the Qupzilla web browser because of a crash, and the problem
seems to be related to nouveau. I can run qupzilla just file if I use the
--disable-gpu commandline option. Please see
https://github.com/QupZilla/qupzilla/issues/2046 for the original bug I
submitted. I'm going to attach the qupzilla gdb backtrace. I'm using
mesa-12.0.1-5 on a Parabola GNU/Linux-libre system.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14699056780.0Ff8.8463
Date: Sat, 30 Jul 2016 19:07:58 +0000
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
   title=3D"NEW - Assert in nouveau_pushbuf_data"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91632#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Assert in nouveau_pushbuf_data"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91632">bug 91632<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fturco&#64;fastmail.fm" title=3D"Francesco Turco &lt;fturco&#64;fastmail.fm=
&gt;"> <span class=3D"fn">Francesco Turco</span></a>
</span></b>
        <pre>I can't start the Qupzilla web browser because of a crash, and=
 the problem
seems to be related to nouveau. I can run qupzilla just file if I use the
--disable-gpu commandline option. Please see
<a href=3D"https://github.com/QupZilla/qupzilla/issues/2046">https://github=
.com/QupZilla/qupzilla/issues/2046</a> for the original bug I
submitted. I'm going to attach the qupzilla gdb backtrace. I'm using
mesa-12.0.1-5 on a Parabola GNU/Linux-libre system.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14699056780.0Ff8.8463--

--===============0772488577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0772488577==--

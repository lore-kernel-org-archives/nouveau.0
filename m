From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110997] NV50 fan runs at full speed after resume
 from suspend on kernels 5.1.8, 4.19.49
Date: Tue, 25 Jun 2019 21:54:14 +0000
Message-ID: <bug-110997-8800-2vf4LLsFaX@http.bugs.freedesktop.org/>
References: <bug-110997-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0861280786=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110997-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0861280786==
Content-Type: multipart/alternative; boundary="15614996541.CBaEad.9892"
Content-Transfer-Encoding: 7bit


--15614996541.CBaEad.9892
Date: Tue, 25 Jun 2019 21:54:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110997

--- Comment #2 from Marc Meledandri <m.meledandri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi! Thanks so much for the quick turnaround on this one. Great that you had=
 a
card on hand to test with.

I can confirm that this patch applied against stable kernel 5.1.15 resolves=
 the
fan speed issue when resuming from suspend.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614996541.CBaEad.9892
Date: Tue, 25 Jun 2019 21:54:14 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - NV50 fan runs at full speed after resume from suspen=
d on kernels 5.1.8, 4.19.49"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110997#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - NV50 fan runs at full speed after resume from suspen=
d on kernels 5.1.8, 4.19.49"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110997">bug 11099=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
m.meledandri&#64;gmail.com" title=3D"Marc Meledandri &lt;m.meledandri&#64;g=
mail.com&gt;"> <span class=3D"fn">Marc Meledandri</span></a>
</span></b>
        <pre>Hi! Thanks so much for the quick turnaround on this one. Great=
 that you had a
card on hand to test with.

I can confirm that this patch applied against stable kernel 5.1.15 resolves=
 the
fan speed issue when resuming from suspend.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614996541.CBaEad.9892--

--===============0861280786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0861280786==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107447] regression in thermal management of Quadro
 FX 1500
Date: Mon, 03 Sep 2018 15:22:32 +0000
Message-ID: <bug-107447-8800-LyTM1zxXqS@http.bugs.freedesktop.org/>
References: <bug-107447-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0597149890=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107447-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0597149890==
Content-Type: multipart/alternative; boundary="15359881512.2588cE5ed.27179"
Content-Transfer-Encoding: 7bit


--15359881512.2588cE5ed.27179
Date: Mon, 3 Sep 2018 15:22:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107447

--- Comment #5 from Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org> ---
One problem seems to be that the thermal target is set only once by the lin=
ear
fallback, and forgotten.  The patch below "fixes" that, at least, to keep
updating the fan with the linear fallback.

But, according to Thomas, this still seems too high.  I'm not sure whether =
it's
the correct behavior or it was just because the fan never worked in the pas=
t.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15359881512.2588cE5ed.27179
Date: Mon, 3 Sep 2018 15:22:31 +0000
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
   title=3D"NEW - regression in thermal management of Quadro FX 1500"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107447#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - regression in thermal management of Quadro FX 1500"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107447">bug 10744=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tiwai&#64;suse.de" title=3D"Takashi Iwai &lt;tiwai&#64;suse.de&gt;"> <span =
class=3D"fn">Takashi Iwai</span></a>
</span></b>
        <pre>One problem seems to be that the thermal target is set only on=
ce by the linear
fallback, and forgotten.  The patch below &quot;fixes&quot; that, at least,=
 to keep
updating the fan with the linear fallback.

But, according to Thomas, this still seems too high.  I'm not sure whether =
it's
the correct behavior or it was just because the fan never worked in the pas=
t.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15359881512.2588cE5ed.27179--

--===============0597149890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0597149890==--

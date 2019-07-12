From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110714] Xorg crashes randomly because of memory leak
Date: Fri, 12 Jul 2019 08:38:58 +0000
Message-ID: <bug-110714-8800-Pe1trFxTI3@http.bugs.freedesktop.org/>
References: <bug-110714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1421446822=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1421446822==
Content-Type: multipart/alternative; boundary="15629207372.A36ab03cE.22057"
Content-Transfer-Encoding: 7bit


--15629207372.A36ab03cE.22057
Date: Fri, 12 Jul 2019 08:38:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #12 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
Out of curiosity, can you also check with `xrestop`, after leaving your ses=
sion
running for some time, if any X11 client tend to be leaking or using an ins=
ane
amount of X11 resources?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15629207372.A36ab03cE.22057
Date: Fri, 12 Jul 2019 08:38:57 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>Out of curiosity, can you also check with `xrestop`, after lea=
ving your session
running for some time, if any X11 client tend to be leaking or using an ins=
ane
amount of X11 resources?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15629207372.A36ab03cE.22057--

--===============1421446822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1421446822==--

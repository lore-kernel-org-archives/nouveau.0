From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106994] [PATCH] Fix null pointer dereference in
 drmmode_output_dpms
Date: Fri, 07 Sep 2018 14:40:30 +0000
Message-ID: <bug-106994-8800-jxfLQ5ofnE@http.bugs.freedesktop.org/>
References: <bug-106994-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0617751115=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106994-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0617751115==
Content-Type: multipart/alternative; boundary="15363312300.7EfD.2904"
Content-Transfer-Encoding: 7bit


--15363312300.7EfD.2904
Date: Fri, 7 Sep 2018 14:40:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106994

--- Comment #8 from John Lindgren <john-ytntcHzVV1kcWVvVuXF20w@public.gmane.org> ---
Ping.  Can someone review this patch and if it looks good, apply it please?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15363312300.7EfD.2904
Date: Fri, 7 Sep 2018 14:40:30 +0000
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
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994">bug 10699=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john&#64;jlindgren.net" title=3D"John Lindgren &lt;john&#64;jlindgren.net&g=
t;"> <span class=3D"fn">John Lindgren</span></a>
</span></b>
        <pre>Ping.  Can someone review this patch and if it looks good, app=
ly it please?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15363312300.7EfD.2904--

--===============0617751115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0617751115==--

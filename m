From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96307] Kernel 4.7-rc1 oops when starting X
Date: Mon, 20 Jun 2016 11:15:44 +0000
Message-ID: <bug-96307-8800-8p6TeC3ZTT@http.bugs.freedesktop.org/>
References: <bug-96307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1560763213=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96307-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1560763213==
Content-Type: multipart/alternative; boundary="14664213430.0eA8.23272";
 charset="UTF-8"


--14664213430.0eA8.23272
Date: Mon, 20 Jun 2016 11:15:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96307

--- Comment #2 from Dmitrii Tcvetkov <demfloro-dmrBKrQMA3sox3rIn2DAYQ@public.gmane.org> ---
Merged:

commit fffc5f59f2c68ca859c3f92b224393ed3adbe1ca
Author: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Date:   Thu Jun 2 19:27:51 2016 +0200

    drm/crtc: fix connector reference counting mismatch in
drm_crtc_helper_set_config

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14664213430.0eA8.23272
Date: Mon, 20 Jun 2016 11:15:43 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Kernel 4.7-rc1 oops when starting X"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96307#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Kernel 4.7-rc1 oops when starting X"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96307">bug 96307<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
demfloro&#64;demfloro.ru" title=3D"Dmitrii Tcvetkov &lt;demfloro&#64;demflo=
ro.ru&gt;"> <span class=3D"fn">Dmitrii Tcvetkov</span></a>
</span></b>
        <pre>Merged:

commit fffc5f59f2c68ca859c3f92b224393ed3adbe1ca
Author: Philipp Zabel &lt;<a href=3D"mailto:p.zabel&#64;pengutronix.de">p.z=
abel&#64;pengutronix.de</a>&gt;
Date:   Thu Jun 2 19:27:51 2016 +0200

    drm/crtc: fix connector reference counting mismatch in
drm_crtc_helper_set_config</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14664213430.0eA8.23272--

--===============1560763213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1560763213==--

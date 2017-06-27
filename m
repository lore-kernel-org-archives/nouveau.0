From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101601] Nvidia GT 1030 (NV138/GP108) support
Date: Tue, 27 Jun 2017 13:50:24 +0000
Message-ID: <bug-101601-8800-a62KpZGyQQ@http.bugs.freedesktop.org/>
References: <bug-101601-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1297270389=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101601-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1297270389==
Content-Type: multipart/alternative; boundary="14985714251.7EecA2E7.10282";
 charset="UTF-8"


--14985714251.7EecA2E7.10282
Date: Tue, 27 Jun 2017 13:50:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101601

--- Comment #2 from Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> ---
Created attachment 132283
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D132283&action=3Dedit
log_gf119_disp_pioc_init_returns_0

The problem is that gf119_disp_pioc_init() is returning -EBUSY.

Modesetting works fine (let's say 90% of the times) if I force
gf119_disp_pioc_init() to return 0. Of course I highly doubt this is a
reasonable fix but at least it could give an hint where the real issue is.

In attachment the log with this ugly change (but at least I was able to hav=
e a
reasonable resolution).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14985714251.7EecA2E7.10282
Date: Tue, 27 Jun 2017 13:50:25 +0000
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
   title=3D"NEW - Nvidia GT 1030 (NV138/GP108) support"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101601#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia GT 1030 (NV138/GP108) support"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101601">bug 10160=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carlo&#64;caione.org" title=3D"Carlo Caione &lt;carlo&#64;caione.org&gt;"> =
<span class=3D"fn">Carlo Caione</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D132283=
" name=3D"attach_132283" title=3D"log_gf119_disp_pioc_init_returns_0">attac=
hment 132283</a> <a href=3D"attachment.cgi?id=3D132283&amp;action=3Dedit" t=
itle=3D"log_gf119_disp_pioc_init_returns_0">[details]</a></span>
log_gf119_disp_pioc_init_returns_0

The problem is that gf119_disp_pioc_init() is returning -EBUSY.

Modesetting works fine (let's say 90% of the times) if I force
gf119_disp_pioc_init() to return 0. Of course I highly doubt this is a
reasonable fix but at least it could give an hint where the real issue is.

In attachment the log with this ugly change (but at least I was able to hav=
e a
reasonable resolution).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14985714251.7EecA2E7.10282--

--===============1297270389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1297270389==--

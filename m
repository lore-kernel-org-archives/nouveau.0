From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96306] BUG: KASAN: slab-out-of-bounds in OUT_RINGp
 (via nvc0_fbcon_imageblit)
Date: Thu, 07 Jul 2016 21:59:55 +0000
Message-ID: <bug-96306-8800-EcwhpVYRJk@http.bugs.freedesktop.org/>
References: <bug-96306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0971490069=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0971490069==
Content-Type: multipart/alternative; boundary="14679287951.2eb0CF5CF.7247";
 charset="UTF-8"


--14679287951.2eb0CF5CF.7247
Date: Thu, 7 Jul 2016 21:59:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96306

Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
                 CC|                            |peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org
             Status|NEW                         |RESOLVED

--- Comment #1 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
Fixed since v4.7-rc3 with:

commit f045f459d925138fe7d6193a8c86406bda7e49da
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Jun 2 12:23:31 2016 +1000

    drm/nouveau/fbcon: fix out-of-bounds memory accesses

    Reported by KASAN.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Confirmed that is does no longer occur in v4.7-rc6-74-g076501f.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14679287951.2eb0CF5CF.7247
Date: Thu, 7 Jul 2016 21:59:55 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:peter&#64=
;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"> <span c=
lass=3D"fn">Peter Wu</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - BUG: KASAN: slab-out-of-bounds in OUT_RINGp (v=
ia nvc0_fbcon_imageblit)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96306">bug 96306<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>peter&#64;lekensteyn.nl
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - BUG: KASAN: slab-out-of-bounds in OUT_RINGp (v=
ia nvc0_fbcon_imageblit)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96306#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - BUG: KASAN: slab-out-of-bounds in OUT_RINGp (v=
ia nvc0_fbcon_imageblit)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96306">bug 96306<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>Fixed since v4.7-rc3 with:

commit f045f459d925138fe7d6193a8c86406bda7e49da
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeggs&#6=
4;redhat.com</a>&gt;
Date:   Thu Jun 2 12:23:31 2016 +1000

    drm/nouveau/fbcon: fix out-of-bounds memory accesses

    Reported by KASAN.

    Signed-off-by: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com"=
>bskeggs&#64;redhat.com</a>&gt;
    Cc: <a href=3D"mailto:stable&#64;vger.kernel.org">stable&#64;vger.kerne=
l.org</a>

Confirmed that is does no longer occur in v4.7-rc6-74-g076501f.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14679287951.2eb0CF5CF.7247--

--===============0971490069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0971490069==--

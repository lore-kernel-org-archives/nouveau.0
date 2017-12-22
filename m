From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88272] [NVAC] Flickering screen on 1920x1080 monitor
 with 9400M in MacbookPro 5, 5
Date: Fri, 22 Dec 2017 03:27:44 +0000
Message-ID: <bug-88272-8800-QRVwdmgdWM@http.bugs.freedesktop.org/>
References: <bug-88272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0022268708=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88272-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0022268708==
Content-Type: multipart/alternative; boundary="15139132641.928B4Eb.626";
 charset="UTF-8"


--15139132641.928B4Eb.626
Date: Fri, 22 Dec 2017 03:27:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D88272

--- Comment #11 from mbazzinotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 136358
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136358&action=3Dedit
nouveau raw mmiotrace with trace MARK

When asking in #nouveau for some leads on related source code points:

pmoreau:
https://github.com/skeggsb/nouveau/blob/master/drm/nouveau/nv50_display.c a=
nd
https://github.com/skeggsb/nouveau/tree/master/drm/nouveau/nvkm/engine/disp/

Was the 2nd link meant to point to nv_50_display.c?

imirkin_: the other option is subdev/fb

I don't know how nv_50 was derived from the geforce 9400m.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15139132641.928B4Eb.626
Date: Fri, 22 Dec 2017 03:27:44 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272">bug 88272<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mbazzinotti&#64;gmail.com" title=3D"mbazzinotti&#64;gmail.com">mbazzinotti&=
#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136358=
" name=3D"attach_136358" title=3D"nouveau raw mmiotrace with trace MARK">at=
tachment 136358</a> <a href=3D"attachment.cgi?id=3D136358&amp;action=3Dedit=
" title=3D"nouveau raw mmiotrace with trace MARK">[details]</a></span>
nouveau raw mmiotrace with trace MARK

When asking in #nouveau for some leads on related source code points:

pmoreau:
<a href=3D"https://github.com/skeggsb/nouveau/blob/master/drm/nouveau/nv50_=
display.c">https://github.com/skeggsb/nouveau/blob/master/drm/nouveau/nv50_=
display.c</a> and
<a href=3D"https://github.com/skeggsb/nouveau/tree/master/drm/nouveau/nvkm/=
engine/disp/">https://github.com/skeggsb/nouveau/tree/master/drm/nouveau/nv=
km/engine/disp/</a>

Was the 2nd link meant to point to nv_50_display.c?

imirkin_: the other option is subdev/fb

I don't know how nv_50 was derived from the geforce 9400m.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15139132641.928B4Eb.626--

--===============0022268708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0022268708==--

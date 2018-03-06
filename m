From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99464] openmw - Segfault with the nouveau ddx + DRI3
Date: Tue, 06 Mar 2018 18:58:47 +0000
Message-ID: <bug-99464-8800-Ya65FTVAmK@http.bugs.freedesktop.org/>
References: <bug-99464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2049626111=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99464-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2049626111==
Content-Type: multipart/alternative; boundary="15203627281.392fA.25172"
Content-Transfer-Encoding: 7bit


--15203627281.392fA.25172
Date: Tue, 6 Mar 2018 18:58:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99464

--- Comment #2 from Greg V <greg-h9od4bJ/6ZMRmC9m2n0wefGwBlcYIbsQ@public.gmane.org> ---
I'm currently also experiencing a crash with OpenMW in update_framebuffer_s=
ize
(surface is NULL).

But with RadeonSI on Wayland! (SDL_VIDEODRIVER=3Dwayland)

Radeon RX 480, FreeBSD 12-CURRENT + drm-next-kmod 4.11, Mesa 18.1.0-devel (=
git
master with my BSD fixes).

Same game works fine on X11. Under Weston, this crash. It *used to* work fi=
ne
on Wayland, but broke recently.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15203627281.392fA.25172
Date: Tue, 6 Mar 2018 18:58:48 +0000
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
   title=3D"NEW - openmw - Segfault with the nouveau ddx + DRI3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99464#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - openmw - Segfault with the nouveau ddx + DRI3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99464">bug 99464<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
greg&#64;unrelenting.technology" title=3D"Greg V &lt;greg&#64;unrelenting.t=
echnology&gt;"> <span class=3D"fn">Greg V</span></a>
</span></b>
        <pre>I'm currently also experiencing a crash with OpenMW in update_=
framebuffer_size
(surface is NULL).

But with RadeonSI on Wayland! (SDL_VIDEODRIVER=3Dwayland)

Radeon RX 480, FreeBSD 12-CURRENT + drm-next-kmod 4.11, Mesa 18.1.0-devel (=
git
master with my BSD fixes).

Same game works fine on X11. Under Weston, this crash. It *used to* work fi=
ne
on Wayland, but broke recently.</pre>
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

--15203627281.392fA.25172--

--===============2049626111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2049626111==--

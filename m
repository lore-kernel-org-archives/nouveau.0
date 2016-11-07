From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98631] GPU lock ups when starting GDM, SDDM,
	and Plasma Desktop
Date: Mon, 07 Nov 2016 21:52:29 +0000
Message-ID: <bug-98631-8800-6EK2iIgEgK@http.bugs.freedesktop.org/>
References: <bug-98631-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0573007855=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98631-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0573007855==
Content-Type: multipart/alternative; boundary="14785555490.246d27.19830";
 charset="UTF-8"


--14785555490.246d27.19830
Date: Mon, 7 Nov 2016 21:52:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98631

--- Comment #3 from Mingcong Bai <jeffbai-ymACFijhrKM@public.gmane.org> ---
As a follow up, after removing nouveau_dri.so, I no longer get GPU lock up =
when
starting Plasma desktop.

However, I am still getting weird colors (for example, my KSplash setting h=
as a
background of dark green color, but it showed up as bright blue, and there =
is a
black border around the KDE logo and the spinner (I will attach a photograph
when I get back to my room).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14785555490.246d27.19830
Date: Mon, 7 Nov 2016 21:52:29 +0000
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
   title=3D"NEW - GPU lock ups when starting GDM, SDDM, and Plasma Desktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU lock ups when starting GDM, SDDM, and Plasma Desktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631">bug 98631<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeffbai&#64;aosc.xyz" title=3D"Mingcong Bai &lt;jeffbai&#64;aosc.xyz&gt;"> =
<span class=3D"fn">Mingcong Bai</span></a>
</span></b>
        <pre>As a follow up, after removing nouveau_dri.so, I no longer get=
 GPU lock up when
starting Plasma desktop.

However, I am still getting weird colors (for example, my KSplash setting h=
as a
background of dark green color, but it showed up as bright blue, and there =
is a
black border around the KDE logo and the spinner (I will attach a photograph
when I get back to my room).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14785555490.246d27.19830--

--===============0573007855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0573007855==--

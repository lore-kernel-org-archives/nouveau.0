From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90482] Xorg take 100% CPU when using multiple
 independent screen configuration
Date: Mon, 24 Oct 2016 09:41:04 +0000
Message-ID: <bug-90482-8800-V1vT7L4W3b@http.bugs.freedesktop.org/>
References: <bug-90482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0457963442=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90482-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0457963442==
Content-Type: multipart/alternative; boundary="14773020640.BA3dCeA80.3904";
 charset="UTF-8"


--14773020640.BA3dCeA80.3904
Date: Mon, 24 Oct 2016 09:41:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D90482

--- Comment #4 from Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> ---
@dura
Thank you for your quick and dirty fix!
I am also suffering the same problem (reported here btw:
https://bugs.freedesktop.org/show_bug.cgi?id=3D98383).

In case when my xinerama is disabled, your patch is working great. No more =
100%
cpu usage!
But when it is disabled and I power up my TV, then I have still have server
crash, but that could be another story (maybe related?).

What is the problem to merge this patch upstream?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14773020640.BA3dCeA80.3904
Date: Mon, 24 Oct 2016 09:41:04 +0000
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
   title=3D"NEW - Xorg take 100% CPU when using multiple independent screen=
 configuration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90482#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg take 100% CPU when using multiple independent screen=
 configuration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90482">bug 90482<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
manio&#64;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;s=
kyboo.net&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span></b>
        <pre>&#64;dura
Thank you for your quick and dirty fix!
I am also suffering the same problem (reported here btw:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X server is crashing/eats 100% cpu when turning on monito=
r"
   href=3D"show_bug.cgi?id=3D98383">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D98383</a>).

In case when my xinerama is disabled, your patch is working great. No more =
100%
cpu usage!
But when it is disabled and I power up my TV, then I have still have server
crash, but that could be another story (maybe related?).

What is the problem to merge this patch upstream?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14773020640.BA3dCeA80.3904--

--===============0457963442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0457963442==--

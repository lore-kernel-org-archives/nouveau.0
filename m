From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104672] [NVAC] Compiz segfaults on login on Ubuntu
 17.10 with Unity 7 (kernel DRM bug?)
Date: Fri, 19 Jan 2018 01:35:58 +0000
Message-ID: <bug-104672-8800-APaN1fx4m5@http.bugs.freedesktop.org/>
References: <bug-104672-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1040806016=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104672-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1040806016==
Content-Type: multipart/alternative; boundary="15163257581.77BEb1BE4.23189"
Content-Transfer-Encoding: 7bit


--15163257581.77BEb1BE4.23189
Date: Fri, 19 Jan 2018 01:35:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104672

--- Comment #6 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Created attachment 136840
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136840&action=3Dedit
Tentative patch

The following patch from Ben Skeggs fixes it for me, hopefully that should =
also
be the case on your laptop.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15163257581.77BEb1BE4.23189
Date: Fri, 19 Jan 2018 01:35:58 +0000
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
   title=3D"ASSIGNED - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672">bug 10467=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136840=
" name=3D"attach_136840" title=3D"Tentative patch">attachment 136840</a> <a=
 href=3D"attachment.cgi?id=3D136840&amp;action=3Dedit" title=3D"Tentative p=
atch">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=
=3D104672&amp;attachment=3D136840'>[review]</a>
Tentative patch

The following patch from Ben Skeggs fixes it for me, hopefully that should =
also
be the case on your laptop.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15163257581.77BEb1BE4.23189--

--===============1040806016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1040806016==--

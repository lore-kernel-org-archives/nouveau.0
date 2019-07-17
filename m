From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111094] Cannot start Xorg on Nvidia GP108M
Date: Wed, 17 Jul 2019 07:34:35 +0000
Message-ID: <bug-111094-8800-7WnwaLX2ii@http.bugs.freedesktop.org/>
References: <bug-111094-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0138084605=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111094-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0138084605==
Content-Type: multipart/alternative; boundary="15633488751.F8771dDeE.20588"
Content-Transfer-Encoding: 7bit


--15633488751.F8771dDeE.20588
Date: Wed, 17 Jul 2019 07:34:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111094

--- Comment #4 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Looking at the logs you provided, it's the NVIDIA kernel module that ends up
being loaded rather than Nouveau. And looking at the Xorg.log, you no longer
have the NVIDIA DDX so it=E2=80=99s the Nouveau one that is being loaded, b=
ut since it
can=E2=80=99t communicate with the Nouveau kernel module, it fails to find =
a device and
X exists because no screen was found.

I am assuming you removed the "nvidia-utils" package, but forgot to remove =
the
"nvidia" one, which contains the kernel module.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15633488751.F8771dDeE.20588
Date: Wed, 17 Jul 2019 07:34:35 +0000
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
   title=3D"NEW - Cannot start Xorg on Nvidia GP108M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111094#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot start Xorg on Nvidia GP108M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111094">bug 11109=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Looking at the logs you provided, it's the NVIDIA kernel modul=
e that ends up
being loaded rather than Nouveau. And looking at the Xorg.log, you no longer
have the NVIDIA DDX so it=E2=80=99s the Nouveau one that is being loaded, b=
ut since it
can=E2=80=99t communicate with the Nouveau kernel module, it fails to find =
a device and
X exists because no screen was found.

I am assuming you removed the &quot;nvidia-utils&quot; package, but forgot =
to remove the
&quot;nvidia&quot; one, which contains the kernel module.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15633488751.F8771dDeE.20588--

--===============0138084605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0138084605==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Mon, 26 Mar 2018 11:41:40 +0000
Message-ID: <bug-105319-8800-EVXIOZuGsL@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0907143434=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0907143434==
Content-Type: multipart/alternative; boundary="15220644992.EC4A20ac8.12581"
Content-Transfer-Encoding: 7bit


--15220644992.EC4A20ac8.12581
Date: Mon, 26 Mar 2018 11:41:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #12 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to S=C3=A9rgio M. Basto from comment #10)
> I send in attach full dmesg.txt and Xorg.0.log

Thank you for the logs.

I tried 4.15.12 on a G98 (9300 GS) but could not reproduce that issue (I had
two screens: one connected over VGA and the other over HDMI). 4.15.12 should
not have any new patches over 4.16-rc6, so you don=E2=80=99t need to try 4.=
15.12.
I=E2=80=99ll see if I can find some errors in the patches that went in 4.15=
. If you are
able to bisect the faulty commit that went in 4.15, that would be really
helpful.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15220644992.EC4A20ac8.12581
Date: Mon, 26 Mar 2018 11:41:39 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to S=C3=A9rgio M. Basto from <a href=3D"show_bug.cgi=
?id=3D105319#c10">comment #10</a>)
<span class=3D"quote">&gt; I send in attach full dmesg.txt and Xorg.0.log</=
span >

Thank you for the logs.

I tried 4.15.12 on a G98 (9300 GS) but could not reproduce that issue (I had
two screens: one connected over VGA and the other over HDMI). 4.15.12 should
not have any new patches over 4.16-rc6, so you don=E2=80=99t need to try 4.=
15.12.
I=E2=80=99ll see if I can find some errors in the patches that went in 4.15=
. If you are
able to bisect the faulty commit that went in 4.15, that would be really
helpful.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15220644992.EC4A20ac8.12581--

--===============0907143434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0907143434==--

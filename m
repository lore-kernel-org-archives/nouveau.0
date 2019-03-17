From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108058] After resuming from suspend,
 discrete GPU is powered on and can't be turned off
Date: Sun, 17 Mar 2019 17:05:07 +0000
Message-ID: <bug-108058-8800-dTQnl9whdO@http.bugs.freedesktop.org/>
References: <bug-108058-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1231870760=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108058-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1231870760==
Content-Type: multipart/alternative; boundary="15528423072.7DBcEb203.9361"
Content-Transfer-Encoding: 7bit


--15528423072.7DBcEb203.9361
Date: Sun, 17 Mar 2019 17:05:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108058

--- Comment #7 from Domenico Iezzi <domenico.iezzi.201-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Still occurring to me on linux 5.0.2.

I also noticed that after resuming from suspend, if I run something with the
discrete GPU like this:

    DRI_PRIME=3D1 glxgears -info

the power consumption returns to normal values. This seems to be the same
behavior already noticed by @Tolga in comment #1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15528423072.7DBcEb203.9361
Date: Sun, 17 Mar 2019 17:05:07 +0000
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
   title=3D"NEW - After resuming from suspend, discrete GPU is powered on a=
nd can't be turned off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108058#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After resuming from suspend, discrete GPU is powered on a=
nd can't be turned off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108058">bug 10805=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
domenico.iezzi.201&#64;gmail.com" title=3D"Domenico Iezzi &lt;domenico.iezz=
i.201&#64;gmail.com&gt;"> <span class=3D"fn">Domenico Iezzi</span></a>
</span></b>
        <pre>Still occurring to me on linux 5.0.2.

I also noticed that after resuming from suspend, if I run something with the
discrete GPU like this:

    DRI_PRIME=3D1 glxgears -info

the power consumption returns to normal values. This seems to be the same
behavior already noticed by &#64;Tolga in <a href=3D"show_bug.cgi?id=3D1080=
58#c1">comment #1</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15528423072.7DBcEb203.9361--

--===============1231870760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1231870760==--

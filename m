From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Sun, 15 Oct 2017 04:14:11 +0000
Message-ID: <bug-75985-8800-z5IXj1GOmL@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1353396921=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1353396921==
Content-Type: multipart/alternative; boundary="15080408514.bf9AFf1.28369";
 charset="UTF-8"


--15080408514.bf9AFf1.28369
Date: Sun, 15 Oct 2017 04:14:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #18 from Fede <fedevx-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
(In reply to Maik Freudenberg from comment #17)
> (In reply to Ilia Mirkin from comment #16)
> > So an interesting thought here is that GRUB also supports the setpci
> > command
> Really smart thinking but users trying it had no success. Register always
> returning value 0xFFFFFFFF. Which would normally(?) mean, no device there.
> Which led me to dig a bit into setpci and it seems to me that without the
> kernel and its mmio, setpci is only able to work on the standard 256 pci
> registers but not the extended config space. So out of luck there?


I can confirm this. It does not work from GRUB. The best work-around so far=
 is
to have a service do the setpci step before the nvidia drivers are loaded a=
nd
display-manager.service starts (for those on systemd).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15080408514.bf9AFf1.28369
Date: Sun, 15 Oct 2017 04:14:11 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fedevx&#64;yahoo.com" title=3D"Fede &lt;fedevx&#64;yahoo.com&gt;"> <span cl=
ass=3D"fn">Fede</span></a>
</span></b>
        <pre>(In reply to Maik Freudenberg from <a href=3D"show_bug.cgi?id=
=3D75985#c17">comment #17</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D75985#c16">comment #16</a>)
&gt; &gt; So an interesting thought here is that GRUB also supports the set=
pci
&gt; &gt; command
&gt; Really smart thinking but users trying it had no success. Register alw=
ays
&gt; returning value 0xFFFFFFFF. Which would normally(?) mean, no device th=
ere.
&gt; Which led me to dig a bit into setpci and it seems to me that without =
the
&gt; kernel and its mmio, setpci is only able to work on the standard 256 p=
ci
&gt; registers but not the extended config space. So out of luck there?</sp=
an >


I can confirm this. It does not work from GRUB. The best work-around so far=
 is
to have a service do the setpci step before the nvidia drivers are loaded a=
nd
display-manager.service starts (for those on systemd).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15080408514.bf9AFf1.28369--

--===============1353396921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1353396921==--

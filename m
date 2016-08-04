From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97192] SuperTuxkart graphic errors [NVE4 - GK104]
Date: Thu, 04 Aug 2016 15:28:01 +0000
Message-ID: <bug-97192-8800-O4k0thYBAb@http.bugs.freedesktop.org/>
References: <bug-97192-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1799803825=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97192-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1799803825==
Content-Type: multipart/alternative; boundary="14703244810.4D4b1.1646";
 charset="UTF-8"


--14703244810.4D4b1.1646
Date: Thu, 4 Aug 2016 15:28:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97192

--- Comment #23 from Alejandro <alejandrohp-1Ww2luigxekRVMDPamJrIw@public.gmane.org> ---
(In reply to Samuel Pitoiset from comment #16)
> Created attachment 125530 [details] [review]
> workaround
>=20
> nouveau: kernel rejected pushbuf: Device or resource busy
> nouveau: ch6: krec 0 pushes 511 bufs 83 relocs 0
>=20
> This is bad and it happens when we submit data too fast and then the comm=
and
> stream is rejected. I already saw that issue with a dEQP test but not yet
> fixed it.
>=20
> Can you try to apply the attached workaround patch?

Is the bug notified to the concerning developer? Who is the developer? =F0=
=9F=98=92 =F0=9F=98=A0 =F0=9F=98=8B=F0=9F=98=8B=F0=9F=98=8B

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14703244810.4D4b1.1646
Date: Thu, 4 Aug 2016 15:28:01 +0000
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
   title=3D"NEW - SuperTuxkart graphic errors [NVE4 - GK104]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97192#c23">Commen=
t # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - SuperTuxkart graphic errors [NVE4 - GK104]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97192">bug 97192<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alejandrohp&#64;openmailbox.org" title=3D"Alejandro &lt;alejandrohp&#64;ope=
nmailbox.org&gt;"> <span class=3D"fn">Alejandro</span></a>
</span></b>
        <pre>(In reply to Samuel Pitoiset from <a href=3D"show_bug.cgi?id=
=3D97192#c16">comment #16</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D125530" name=3D"attach_125530" title=3D"workaround">attachment 1255=
30</a> <a href=3D"attachment.cgi?id=3D125530&amp;action=3Dedit" title=3D"wo=
rkaround">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;b=
ug=3D97192&amp;attachment=3D125530'>[review]</a> [review]
&gt; workaround
&gt;=20
&gt; nouveau: kernel rejected pushbuf: Device or resource busy
&gt; nouveau: ch6: krec 0 pushes 511 bufs 83 relocs 0
&gt;=20
&gt; This is bad and it happens when we submit data too fast and then the c=
ommand
&gt; stream is rejected. I already saw that issue with a dEQP test but not =
yet
&gt; fixed it.
&gt;=20
&gt; Can you try to apply the attached workaround patch?</span >

Is the bug notified to the concerning developer? Who is the developer? =F0=
=9F=98=92 =F0=9F=98=A0 =F0=9F=98=8B=F0=9F=98=8B=F0=9F=98=8B</pre>
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

--14703244810.4D4b1.1646--

--===============1799803825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1799803825==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98631] GPU lock ups when starting GDM, SDDM,
	and Plasma Desktop
Date: Tue, 22 Aug 2017 06:59:44 +0000
Message-ID: <bug-98631-8800-9pvQ53zAU0@http.bugs.freedesktop.org/>
References: <bug-98631-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0424370733=="
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


--===============0424370733==
Content-Type: multipart/alternative; boundary="15033851830.ED96F.7142";
 charset="UTF-8"


--15033851830.ED96F.7142
Date: Tue, 22 Aug 2017 06:59:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98631

--- Comment #7 from Mingcong Bai <jeffbai-ymACFijhrKM@public.gmane.org> ---
(In reply to caguduzexi from comment #6)
> Quote: "After a minute or two, the display responds again, but only showi=
ng
> a black background with several randomly colored pixels, and some white
> blocks."
>=20
> Yes, this is exactly what i had on x86_64.
> It would be great if you could create a gdb log. With such a log the
> developers could see if its the same problem like i had here:
>=20
> https://bugs.freedesktop.org/show_bug.cgi?id=3D102349
>=20
> Side note: I had to change from tty to the x-server and move the mouse
> around to cause a segfault error. Then change back to the tty and read out
> the gdb log with "thread apply all bt"
>=20
> Thanks

It will be two weeks before I could get to working with my PowerMac again. =
Will
try and produce one then.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15033851830.ED96F.7142
Date: Tue, 22 Aug 2017 06:59:43 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - GPU lock ups when starting GDM, SDDM, and Plasma Des=
ktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - GPU lock ups when starting GDM, SDDM, and Plasma Des=
ktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631">bug 98631<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeffbai&#64;aosc.xyz" title=3D"Mingcong Bai &lt;jeffbai&#64;aosc.xyz&gt;"> =
<span class=3D"fn">Mingcong Bai</span></a>
</span></b>
        <pre>(In reply to caguduzexi from <a href=3D"show_bug.cgi?id=3D9863=
1#c6">comment #6</a>)
<span class=3D"quote">&gt; Quote: &quot;After a minute or two, the display =
responds again, but only showing
&gt; a black background with several randomly colored pixels, and some white
&gt; blocks.&quot;
&gt;=20
&gt; Yes, this is exactly what i had on x86_64.
&gt; It would be great if you could create a gdb log. With such a log the
&gt; developers could see if its the same problem like i had here:
&gt;=20
&gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"show_bug.cgi?id=3D102349">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D102349</a>
&gt;=20
&gt; Side note: I had to change from tty to the x-server and move the mouse
&gt; around to cause a segfault error. Then change back to the tty and read=
 out
&gt; the gdb log with &quot;thread apply all bt&quot;
&gt;=20
&gt; Thanks</span >

It will be two weeks before I could get to working with my PowerMac again. =
Will
try and produce one then.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15033851830.ED96F.7142--

--===============0424370733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0424370733==--

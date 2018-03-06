From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105344] Installation bug by video card modules
 conflict (nvidia GTX 950 M)
Date: Tue, 06 Mar 2018 13:04:58 +0000
Message-ID: <bug-105344-8800-S19XLOshEM@http.bugs.freedesktop.org/>
References: <bug-105344-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1511664436=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105344-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1511664436==
Content-Type: multipart/alternative; boundary="15203414980.C86F6.23865"
Content-Transfer-Encoding: 7bit


--15203414980.C86F6.23865
Date: Tue, 6 Mar 2018 13:04:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105344

--- Comment #7 from Yuri Gelsleichter <yuriplanta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Dear all,

thanks for the points.

(In reply to Ilia Mirkin from comment #5)
> (In reply to Emil Velikov from comment #4)
> > Considering that nouveau.modeset=3D0 helps, I'm flipping this to compon=
ent
> > nouveau. Feel free to revert.
>=20
> Hard to imagine why -- intel is primary, and nvidia chip has no outputs.
> Must be something silly in how the distro has things set up.

The point here is that Nvidia has no drivers in use. With nouveau, system
breaks (impossible to boot), with proprietary system get slow and freeze of=
ten
(I am aware that you do not deal with proprietary drivers).

If I boot with "quite splash", the system breaks before boot.
If I boot without any "modeset", the system only get to the terminal.

The only way to get "normal" use is booting with any "nomodeset" (without
proprietary driver for videocard).

I was wondering to understand why the distros (all of them) do not work out=
 of
the box in this machine. As they work great in general in any machine.

I would be glad if one day Linux working smooth out of the box on this
machines.

Thanks for all.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15203414980.C86F6.23865
Date: Tue, 6 Mar 2018 13:04:58 +0000
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
   title=3D"NEW - Installation bug by video card modules conflict (nvidia G=
TX 950 M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105344#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Installation bug by video card modules conflict (nvidia G=
TX 950 M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105344">bug 10534=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yuriplanta&#64;gmail.com" title=3D"Yuri Gelsleichter &lt;yuriplanta&#64;gma=
il.com&gt;"> <span class=3D"fn">Yuri Gelsleichter</span></a>
</span></b>
        <pre>Dear all,

thanks for the points.

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D105344#c5">comme=
nt #5</a>)
<span class=3D"quote">&gt; (In reply to Emil Velikov from <a href=3D"show_b=
ug.cgi?id=3D105344#c4">comment #4</a>)
&gt; &gt; Considering that nouveau.modeset=3D0 helps, I'm flipping this to =
component
&gt; &gt; nouveau. Feel free to revert.
&gt;=20
&gt; Hard to imagine why -- intel is primary, and nvidia chip has no output=
s.
&gt; Must be something silly in how the distro has things set up.</span >

The point here is that Nvidia has no drivers in use. With nouveau, system
breaks (impossible to boot), with proprietary system get slow and freeze of=
ten
(I am aware that you do not deal with proprietary drivers).

If I boot with &quot;quite splash&quot;, the system breaks before boot.
If I boot without any &quot;modeset&quot;, the system only get to the termi=
nal.

The only way to get &quot;normal&quot; use is booting with any &quot;nomode=
set&quot; (without
proprietary driver for videocard).

I was wondering to understand why the distros (all of them) do not work out=
 of
the box in this machine. As they work great in general in any machine.

I would be glad if one day Linux working smooth out of the box on this
machines.

Thanks for all.</pre>
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

--15203414980.C86F6.23865--

--===============1511664436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1511664436==--

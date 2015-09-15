From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91992] [NV4C] computer hangs after few minutes of use
Date: Tue, 15 Sep 2015 04:18:31 +0000
Message-ID: <bug-91992-8800-9jhB14xYU1@http.bugs.freedesktop.org/>
References: <bug-91992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1892486687=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1892486687==
Content-Type: multipart/alternative; boundary="1442290710.Bf6C011.17069"; charset="UTF-8"


--1442290710.Bf6C011.17069
Date: Tue, 15 Sep 2015 04:18:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91992

Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
Hi,

(In reply to Laurent Riffard from comment #4)
> Hi,
>=20
> I=E2=80=99m using Xfce or Cinnamon.
>=20
> As you suggested, I increased the amount of RAM assigned to the video car=
d,
> from 32 Gb to 64 Gb, and I didn=E2=80=99t encounter any new problem.

I assume you mean MB not GB ? Yes 32MB is a very low setting, so this expla=
ins
the original problem quite nicely.

> Shouldn=E2=80=99t this short-memory condition be nicely handled by the dr=
iver ?

In an ideal world it would at least be handled better then crashing, but our
oom handling currently is rather poor (as you've noticed) . Fixing this
unfortunately is quite difficult and currently no one is working on this.

Since changing the setting in the BIOS fixes things, I'm closing this bug.

Regards,

Hans

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442290710.Bf6C011.17069
Date: Tue, 15 Sep 2015 04:18:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jwrdegoed=
e&#64;fedoraproject.org" title=3D"Hans de Goede &lt;jwrdegoede&#64;fedorapr=
oject.org&gt;"> <span class=3D"fn">Hans de Goede</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NV4C] computer hangs after few minutes of use"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91992">bug 91992<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NV4C] computer hangs after few minutes of use"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91992#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NV4C] computer hangs after few minutes of use"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91992">bug 91992<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jwrdegoede&#64;fedoraproject.org" title=3D"Hans de Goede &lt;jwrdegoede&#64=
;fedoraproject.org&gt;"> <span class=3D"fn">Hans de Goede</span></a>
</span></b>
        <pre>Hi,

(In reply to Laurent Riffard from <a href=3D"show_bug.cgi?id=3D91992#c4">co=
mment #4</a>)
<span class=3D"quote">&gt; Hi,
&gt;=20
&gt; I=E2=80=99m using Xfce or Cinnamon.
&gt;=20
&gt; As you suggested, I increased the amount of RAM assigned to the video =
card,
&gt; from 32 Gb to 64 Gb, and I didn=E2=80=99t encounter any new problem.</=
span >

I assume you mean MB not GB ? Yes 32MB is a very low setting, so this expla=
ins
the original problem quite nicely.

<span class=3D"quote">&gt; Shouldn=E2=80=99t this short-memory condition be=
 nicely handled by the driver ?</span >

In an ideal world it would at least be handled better then crashing, but our
oom handling currently is rather poor (as you've noticed) . Fixing this
unfortunately is quite difficult and currently no one is working on this.

Since changing the setting in the BIOS fixes things, I'm closing this bug.

Regards,

Hans</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442290710.Bf6C011.17069--

--===============1892486687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1892486687==--

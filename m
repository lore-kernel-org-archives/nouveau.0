From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98266] Geforce GTX 960: display corruption under KDE
	Plasma
Date: Wed, 26 Oct 2016 05:46:00 +0000
Message-ID: <bug-98266-8800-1H3WFWzRAv@http.bugs.freedesktop.org/>
References: <bug-98266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0054248750=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0054248750==
Content-Type: multipart/alternative; boundary="14774607590.c1a6.26611";
 charset="UTF-8"


--14774607590.c1a6.26611
Date: Wed, 26 Oct 2016 05:45:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98266

peter.eszlari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from peter.eszlari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to Ilia Mirkin from comment #5)
> I just published some patches that allow you to use xf86-video-nouveau
> instead of modesetting for GM20x GPUs. Can you see if using it improves t=
he
> situation at all? You can build it from
>=20
> https://github.com/imirkin/xf86-video-nouveau

This fixes the bug. But from Xorg.log it looks like I was already running
nouveau before.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14774607590.c1a6.26611
Date: Wed, 26 Oct 2016 05:45:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:peter.esz=
lari&#64;gmail.com" title=3D"peter.eszlari&#64;gmail.com">peter.eszlari&#64=
;gmail.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Geforce GTX 960: display corruption under KDE =
Plasma"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98266">bug 98266<=
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
   title=3D"RESOLVED FIXED - Geforce GTX 960: display corruption under KDE =
Plasma"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98266#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Geforce GTX 960: display corruption under KDE =
Plasma"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98266">bug 98266<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter.eszlari&#64;gmail.com" title=3D"peter.eszlari&#64;gmail.com">peter.es=
zlari&#64;gmail.com</a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D982=
66#c5">comment #5</a>)
<span class=3D"quote">&gt; I just published some patches that allow you to =
use xf86-video-nouveau
&gt; instead of modesetting for GM20x GPUs. Can you see if using it improve=
s the
&gt; situation at all? You can build it from
&gt;=20
&gt; <a href=3D"https://github.com/imirkin/xf86-video-nouveau">https://gith=
ub.com/imirkin/xf86-video-nouveau</a></span >

This fixes the bug. But from Xorg.log it looks like I was already running
nouveau before.</pre>
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

--14774607590.c1a6.26611--

--===============0054248750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0054248750==--

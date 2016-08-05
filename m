From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Fri, 05 Aug 2016 08:55:33 +0000
Message-ID: <bug-31122-8800-VKkmVQyS3A@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1878484795=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31122-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1878484795==
Content-Type: multipart/alternative; boundary="14703873334.81afa00.9033";
 charset="UTF-8"


--14703873334.81afa00.9033
Date: Fri, 5 Aug 2016 08:55:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |NEW

--- Comment #10 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
Nice to see a patch :)

However, this patch exposes a backlight even when there is no panel connect=
ed.
Could you come up with an heuristic to detect if there is or not a backligh=
t?

The normal thing to do is to check in the GPIO table of the bios (check it =
out
using envytools's nvbios and nvagetbios).

I can assist a little for this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14703873334.81afa00.9033
Date: Fri, 5 Aug 2016 08:55:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:martin.pe=
res&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <=
span class=3D"fn">Martin Peres</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
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
           <td>NEEDINFO
           </td>
           <td>NEW
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>Nice to see a patch :)

However, this patch exposes a backlight even when there is no panel connect=
ed.
Could you come up with an heuristic to detect if there is or not a backligh=
t?

The normal thing to do is to check in the GPIO table of the bios (check it =
out
using envytools's nvbios and nvagetbios).

I can assist a little for this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14703873334.81afa00.9033--

--===============1878484795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1878484795==--

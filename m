From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91408] Lenovo T440s alternate way to turn off
	discrete GPU
Date: Wed, 24 Aug 2016 14:03:07 +0000
Message-ID: <bug-91408-8800-LHqPsx2wXg@http.bugs.freedesktop.org/>
References: <bug-91408-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2034519786=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91408-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2034519786==
Content-Type: multipart/alternative; boundary="14720473871.FeeB9.9093";
 charset="UTF-8"


--14720473871.FeeB9.9093
Date: Wed, 24 Aug 2016 14:03:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91408

Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org
         Resolution|---                         |FIXED

--- Comment #2 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
Fixed in Linux v4.8-rc1

commit 692a17dcc2922a91c6bcf11b3321503a3377b1b1
Author: Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org>
Date:   Fri Jul 15 15:12:18 2016 +0200

    drm/nouveau/acpi: fix lockup with PCIe runtime PM

Can you validate this?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14720473871.FeeB9.9093
Date: Wed, 24 Aug 2016 14:03:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:peter&#64=
;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"> <span c=
lass=3D"fn">Peter Wu</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Lenovo T440s alternate way to turn off discret=
e GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91408">bug 91408<=
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
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>peter&#64;lekensteyn.nl
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
   title=3D"RESOLVED FIXED - Lenovo T440s alternate way to turn off discret=
e GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91408#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Lenovo T440s alternate way to turn off discret=
e GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91408">bug 91408<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>Fixed in Linux v4.8-rc1

commit 692a17dcc2922a91c6bcf11b3321503a3377b1b1
Author: Peter Wu &lt;<a href=3D"mailto:peter&#64;lekensteyn.nl">peter&#64;l=
ekensteyn.nl</a>&gt;
Date:   Fri Jul 15 15:12:18 2016 +0200

    drm/nouveau/acpi: fix lockup with PCIe runtime PM

Can you validate this?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14720473871.FeeB9.9093--

--===============2034519786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2034519786==--

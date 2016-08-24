From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78530] Memory corruption on Lenovo t440p with runpm
Date: Wed, 24 Aug 2016 14:05:01 +0000
Message-ID: <bug-78530-8800-CcLILNAO4l@http.bugs.freedesktop.org/>
References: <bug-78530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2082058346=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2082058346==
Content-Type: multipart/alternative; boundary="14720475010.1BCCdE.9087";
 charset="UTF-8"


--14720475010.1BCCdE.9087
Date: Wed, 24 Aug 2016 14:05:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D78530

Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
                 CC|                            |peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org
             Status|REOPENED                    |RESOLVED

--- Comment #22 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
Fixed in v4.8-rc1

commit 692a17dcc2922a91c6bcf11b3321503a3377b1b1
Author: Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org>
Date:   Fri Jul 15 15:12:18 2016 +0200

    drm/nouveau/acpi: fix lockup with PCIe runtime PM

It was confirmed to fix the memory corruption, if it still happens, please
re-open.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14720475010.1BCCdE.9087
Date: Wed, 24 Aug 2016 14:05:01 +0000
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
   title=3D"RESOLVED FIXED - Memory corruption on Lenovo t440p with runpm"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78530">bug 78530<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
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
           <td style=3D"text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Memory corruption on Lenovo t440p with runpm"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78530#c22">Commen=
t # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Memory corruption on Lenovo t440p with runpm"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78530">bug 78530<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>Fixed in v4.8-rc1

commit 692a17dcc2922a91c6bcf11b3321503a3377b1b1
Author: Peter Wu &lt;<a href=3D"mailto:peter&#64;lekensteyn.nl">peter&#64;l=
ekensteyn.nl</a>&gt;
Date:   Fri Jul 15 15:12:18 2016 +0200

    drm/nouveau/acpi: fix lockup with PCIe runtime PM

It was confirmed to fix the memory corruption, if it still happens, please
re-open.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14720475010.1BCCdE.9087--

--===============2082058346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2082058346==--

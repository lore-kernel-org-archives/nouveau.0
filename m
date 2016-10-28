From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98398] Acer Aspire V7-582PG (Haswell,
 GTX 750M) fails to power off GPU with runtime PM
Date: Fri, 28 Oct 2016 23:23:18 +0000
Message-ID: <bug-98398-8800-gDnjnc88AV@http.bugs.freedesktop.org/>
References: <bug-98398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0232934760=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0232934760==
Content-Type: multipart/alternative; boundary="14776969972.7Ef122.6594";
 charset="UTF-8"


--14776969972.7Ef122.6594
Date: Fri, 28 Oct 2016 23:23:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98398

Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #12 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
At the moment it looks like an ACPI core bug which manifested in nouveau. S=
ee
https://lists.freedesktop.org/archives/nouveau/2016-October/026395.html and=
 the
replies. I'll post a workaround patch soon.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14776969972.7Ef122.6594
Date: Fri, 28 Oct 2016 23:23:17 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to po=
wer off GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398">bug 98398<=
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
           <td>ASSIGNED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to po=
wer off GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to po=
wer off GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398">bug 98398<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>At the moment it looks like an ACPI core bug which manifested =
in nouveau. See
<a href=3D"https://lists.freedesktop.org/archives/nouveau/2016-October/0263=
95.html">https://lists.freedesktop.org/archives/nouveau/2016-October/026395=
.html</a> and the
replies. I'll post a workaround patch soon.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14776969972.7Ef122.6594--

--===============0232934760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0232934760==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Sat, 02 Sep 2017 18:01:17 +0000
Message-ID: <bug-70972-8800-UL60Xr9sjh@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1288246880=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1288246880==
Content-Type: multipart/alternative; boundary="15043752771.c8beBc.22441";
 charset="UTF-8"


--15043752771.c8beBc.22441
Date: Sat, 2 Sep 2017 18:01:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70972

S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org

--- Comment #35 from S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> ---
OK but you don't test many drive options that you have in nouveau drive [1]=
=20

Option "AccelMethod" 0=20

Option "WrappedFB" 1

              Enable  or  disable  wfb,  only  affects  nv50+. Useful for s=
ome
legacy configurations where high rendering
              latency is perceived.  Default: wfb is disabled.

Option "PageFlip" 0

etc=20

Also in Fedora 25 we got xf86-video-nouveau 1.0.15 last report was 1.0.13

[1]=20
man nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15043752771.c8beBc.22441
Date: Sat, 2 Sep 2017 18:01:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:sergio&#6=
4;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.com&gt;">=
 <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972">bug 70972<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>sergio&#64;serjux.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972#c35">Commen=
t # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972">bug 70972<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio&#64;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.=
com&gt;"> <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span></b>
        <pre>OK but you don't test many drive options that you have in nouv=
eau drive [1]=20

Option &quot;AccelMethod&quot; 0=20

Option &quot;WrappedFB&quot; 1

              Enable  or  disable  wfb,  only  affects  nv50+. Useful for s=
ome
legacy configurations where high rendering
              latency is perceived.  Default: wfb is disabled.

Option &quot;PageFlip&quot; 0

etc=20

Also in Fedora 25 we got xf86-video-nouveau 1.0.15 last report was 1.0.13

[1]=20
man nouveau</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15043752771.c8beBc.22441--

--===============1288246880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1288246880==--

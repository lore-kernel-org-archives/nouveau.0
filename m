From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97065] memory leak under Xwayland with old sdl1
	applications
Date: Mon, 01 Aug 2016 00:51:59 +0000
Message-ID: <bug-97065-8800-pH7u6mcGtL@http.bugs.freedesktop.org/>
References: <bug-97065-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2095952272=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97065-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2095952272==
Content-Type: multipart/alternative; boundary="14700127191.06AA1.21956";
 charset="UTF-8"


--14700127191.06AA1.21956
Date: Mon, 1 Aug 2016 00:51:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97065

Michel D=C3=A4nzer <michel-otUistvHUpPR7s880joybQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Driver/nouveau              |XWayland
            Product|xorg                        |Wayland
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |wayland-bugs-PD4FTy7X32lzq7FAFJ/aeQ@public.gmane.org
                   |rg                          |top.org

--- Comment #12 from Michel D=C3=A4nzer <michel-otUistvHUpPR7s880joybQ@public.gmane.org> ---
Looks like there's a leak between Xwayland and libwayland-client:

=3D=3D6371=3D=3D 803,664 bytes in 11,162 blocks are definitely lost in loss=
 record
3,443 of 3,443
=3D=3D6371=3D=3D    at 0x4C2CA4A: calloc (in
/usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
=3D=3D6371=3D=3D    by 0x5568B72: ??? (in /usr/lib/libwayland-client.so.0.3=
.0)
=3D=3D6371=3D=3D    by 0x5569094: wl_proxy_marshal_array_constructor_versio=
ned (in
/usr/lib/libwayland-client.so.0.3.0)
=3D=3D6371=3D=3D    by 0x55693B9: wl_proxy_marshal_constructor (in
/usr/lib/libwayland-client.so.0.3.0)
=3D=3D6371=3D=3D    by 0x423BDC: ??? (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x5576A0: BlockHandler (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x586DBA: WaitForSomething (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x552A3D: ??? (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x556C62: ??? (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x6F0C740: (below main) (in /usr/lib/libc-2.23.so)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14700127191.06AA1.21956
Date: Mon, 1 Aug 2016 00:51:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:michel&#6=
4;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.net&gt;">=
 <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak under Xwayland with old sdl1 applications"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97065">bug 97065<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Driver/nouveau
           </td>
           <td>XWayland
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Product</td>
           <td>xorg
           </td>
           <td>Wayland
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>wayland-bugs&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak under Xwayland with old sdl1 applications"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97065#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak under Xwayland with old sdl1 applications"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97065">bug 97065<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>Looks like there's a leak between Xwayland and libwayland-clie=
nt:

=3D=3D6371=3D=3D 803,664 bytes in 11,162 blocks are definitely lost in loss=
 record
3,443 of 3,443
=3D=3D6371=3D=3D    at 0x4C2CA4A: calloc (in
/usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
=3D=3D6371=3D=3D    by 0x5568B72: ??? (in /usr/lib/libwayland-client.so.0.3=
.0)
=3D=3D6371=3D=3D    by 0x5569094: wl_proxy_marshal_array_constructor_versio=
ned (in
/usr/lib/libwayland-client.so.0.3.0)
=3D=3D6371=3D=3D    by 0x55693B9: wl_proxy_marshal_constructor (in
/usr/lib/libwayland-client.so.0.3.0)
=3D=3D6371=3D=3D    by 0x423BDC: ??? (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x5576A0: BlockHandler (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x586DBA: WaitForSomething (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x552A3D: ??? (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x556C62: ??? (in /usr/bin/Xwayland)
=3D=3D6371=3D=3D    by 0x6F0C740: (below main) (in /usr/lib/libc-2.23.so)</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14700127191.06AA1.21956--

--===============2095952272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2095952272==--

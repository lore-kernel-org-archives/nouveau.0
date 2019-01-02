From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102349] nv4x crashing with plasmashell - gdb log
 included
Date: Wed, 02 Jan 2019 22:37:47 +0000
Message-ID: <bug-102349-8800-VeEBgVL2Vf@http.bugs.freedesktop.org/>
References: <bug-102349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1484925635=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1484925635==
Content-Type: multipart/alternative; boundary="15464686673.5B2a8.17225"
Content-Transfer-Encoding: 7bit


--15464686673.5B2a8.17225
Date: Wed, 2 Jan 2019 22:37:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102349

Christian Tosta <christian.tosta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|FIXED                       |---
             Status|RESOLVED                    |REOPENED

--- Comment #16 from Christian Tosta <christian.tosta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Not fixed in Mesa 18.2.8 for Fedora 29. Plasmashell keeps segfaulting.
Screen turns black with only the cursor. Konsole and other programs=20
runs fine, except for plasmashell and sddm-greeter.


[  168.028608] plasmashell[2006]: segfault at 0 ip 00007f82250821d9 sp
00007ffc81db2e70 error 4 in nouveau_dri.so[7f8224b6e000+820000]

[   35.532730] nouveau 0000:03:00.0: sddm-greeter[1013]: fail ttm_validate
[   35.532737] nouveau 0000:03:00.0: sddm-greeter[1013]: validating bo list
[   35.532766] nouveau 0000:03:00.0: sddm-greeter[1013]: validate: -12

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15464686673.5B2a8.17225
Date: Wed, 2 Jan 2019 22:37:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:christian=
.tosta&#64;gmail.com" title=3D"Christian Tosta &lt;christian.tosta&#64;gmai=
l.com&gt;"> <span class=3D"fn">Christian Tosta</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349">bug 10234=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349">bug 10234=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
christian.tosta&#64;gmail.com" title=3D"Christian Tosta &lt;christian.tosta=
&#64;gmail.com&gt;"> <span class=3D"fn">Christian Tosta</span></a>
</span></b>
        <pre>Not fixed in Mesa 18.2.8 for Fedora 29. Plasmashell keeps segf=
aulting.
Screen turns black with only the cursor. Konsole and other programs=20
runs fine, except for plasmashell and sddm-greeter.


[  168.028608] plasmashell[2006]: segfault at 0 ip 00007f82250821d9 sp
00007ffc81db2e70 error 4 in nouveau_dri.so[7f8224b6e000+820000]

[   35.532730] nouveau 0000:03:00.0: sddm-greeter[1013]: fail ttm_validate
[   35.532737] nouveau 0000:03:00.0: sddm-greeter[1013]: validating bo list
[   35.532766] nouveau 0000:03:00.0: sddm-greeter[1013]: validate: -12</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15464686673.5B2a8.17225--

--===============1484925635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1484925635==--

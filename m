From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102349] nv4x crashing with plasmashell - gdb log
 included
Date: Fri, 02 Nov 2018 10:52:44 +0000
Message-ID: <bug-102349-8800-qZZouSElrF@http.bugs.freedesktop.org/>
References: <bug-102349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2014719175=="
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


--===============2014719175==
Content-Type: multipart/alternative; boundary="15411559640.50aE6c6.23864"
Content-Transfer-Encoding: 7bit


--15411559640.50aE6c6.23864
Date: Fri, 2 Nov 2018 10:52:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102349

Christian Tosta <christian.tosta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christian.tosta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #12 from Christian Tosta <christian.tosta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 142336
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142336&action=3Dedit
backtrace of plasmashell process

Same problem here using Fedora 29 rpms. Backtrace attached.

Device: NV44 GeForce 6600 LE 512MB DDR2

System: Fedora 29 x86_64
Mesa DRI drivers: 18.2.2-1.fc29
Nouveau: 1.0.15-6.fc29
Plasmashell: 5.13.5-1.fc29

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15411559640.50aE6c6.23864
Date: Fri, 2 Nov 2018 10:52:44 +0000
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
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
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
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>christian.tosta&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349">bug 10234=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
christian.tosta&#64;gmail.com" title=3D"Christian Tosta &lt;christian.tosta=
&#64;gmail.com&gt;"> <span class=3D"fn">Christian Tosta</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142336=
" name=3D"attach_142336" title=3D"backtrace of plasmashell process">attachm=
ent 142336</a> <a href=3D"attachment.cgi?id=3D142336&amp;action=3Dedit" tit=
le=3D"backtrace of plasmashell process">[details]</a></span>
backtrace of plasmashell process

Same problem here using Fedora 29 rpms. Backtrace attached.

Device: NV44 GeForce 6600 LE 512MB DDR2

System: Fedora 29 x86_64
Mesa DRI drivers: 18.2.2-1.fc29
Nouveau: 1.0.15-6.fc29
Plasmashell: 5.13.5-1.fc29</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15411559640.50aE6c6.23864--

--===============2014719175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2014719175==--

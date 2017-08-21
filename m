From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98631] GPU lock ups when starting GDM, SDDM,
	and Plasma Desktop
Date: Mon, 21 Aug 2017 22:50:46 +0000
Message-ID: <bug-98631-8800-bxHWM8GBpB@http.bugs.freedesktop.org/>
References: <bug-98631-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0353302499=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98631-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0353302499==
Content-Type: multipart/alternative; boundary="15033558460.AA15.21243";
 charset="UTF-8"


--15033558460.AA15.21243
Date: Mon, 21 Aug 2017 22:50:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98631

caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #6 from caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org ---
Quote: "After a minute or two, the display responds again, but only showing=
 a
black background with several randomly colored pixels, and some white block=
s."

Yes, this is exactly what i had on x86_64.
It would be great if you could create a gdb log. With such a log the develo=
pers
could see if its the same problem like i had here:

https://bugs.freedesktop.org/show_bug.cgi?id=3D102349

Side note: I had to change from tty to the x-server and move the mouse arou=
nd
to cause a segfault error. Then change back to the tty and read out the gdb=
 log
with "thread apply all bt"

Thanks

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15033558460.AA15.21243
Date: Mon, 21 Aug 2017 22:50:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:caguduzex=
i&#64;go2vpn.net" title=3D"caguduzexi&#64;go2vpn.net">caguduzexi&#64;go2vpn=
.net</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - GPU lock ups when starting GDM, SDDM, and Plasma Des=
ktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631">bug 98631<=
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
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - GPU lock ups when starting GDM, SDDM, and Plasma Des=
ktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - GPU lock ups when starting GDM, SDDM, and Plasma Des=
ktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631">bug 98631<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
caguduzexi&#64;go2vpn.net" title=3D"caguduzexi&#64;go2vpn.net">caguduzexi&#=
64;go2vpn.net</a>
</span></b>
        <pre>Quote: &quot;After a minute or two, the display responds again=
, but only showing a
black background with several randomly colored pixels, and some white block=
s.&quot;

Yes, this is exactly what i had on x86_64.
It would be great if you could create a gdb log. With such a log the develo=
pers
could see if its the same problem like i had here:

<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"show_bug.cgi?id=3D102349">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D102349</a>

Side note: I had to change from tty to the x-server and move the mouse arou=
nd
to cause a segfault error. Then change back to the tty and read out the gdb=
 log
with &quot;thread apply all bt&quot;

Thanks</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15033558460.AA15.21243--

--===============0353302499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0353302499==--

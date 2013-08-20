From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34220] Detects Load on output and blinks screen
	every ~30secs
Date: Tue, 20 Aug 2013 01:56:18 +0000
Message-ID: <bug-34220-8800-tJr4zjw4gV@http.bugs.freedesktop.org/>
References: <bug-34220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1420028950=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1420028950==
Content-Type: multipart/alternative; boundary="1376963778.f8Deba5.31588"; charset="us-ascii"


--1376963778.f8Deba5.31588
Date: Tue, 20 Aug 2013 01:56:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D34220

Gy=C3=B6rgy Ball=C3=B3 <ballogy-HLx8PRj2pn30Br+ELjv3iA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|ballogy-HLx8PRj2pn30Br+ELjv3iA@public.gmane.org        |

--- Comment #10 from Gy=C3=B6rgy Ball=C3=B3 <ballogy-HLx8PRj2pn30Br+ELjv3iA@public.gmane.org> ---
I think it has been fixed in upower with this commit:

 Add an option for polling dock devices in UPower.conf, defaulting to false

http://cgit.freedesktop.org/upower/commit/?id=3D38199e44ff1e87b586d51d30b69=
d1f70e40d27f1

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1376963778.f8Deba5.31588
Date: Tue, 20 Aug 2013 01:56:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ballogy&#=
64;freestart.hu" title=3D"Gy=C3=B6rgy Ball=C3=B3 &lt;ballogy&#64;freestart.=
hu&gt;"> <span class=3D"fn">Gy=C3=B6rgy Ball=C3=B3</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Detects Load on output and blinks screen every ~30sec=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D34220">bug 34220<=
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
           <td>ballogy&#64;freestart.hu
           </td>
           <td>
               &nbsp;
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Detects Load on output and blinks screen every ~30sec=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D34220#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Detects Load on output and blinks screen every ~30sec=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D34220">bug 34220<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ballogy&#64;freestart.hu" title=3D"Gy=C3=B6rgy Ball=C3=B3 &lt;ballogy&#64;f=
reestart.hu&gt;"> <span class=3D"fn">Gy=C3=B6rgy Ball=C3=B3</span></a>
</span></b>
        <pre>I think it has been fixed in upower with this commit:

 Add an option for polling dock devices in UPower.conf, defaulting to false

<a href=3D"http://cgit.freedesktop.org/upower/commit/?id=3D38199e44ff1e87b5=
86d51d30b69d1f70e40d27f1">http://cgit.freedesktop.org/upower/commit/?id=3D3=
8199e44ff1e87b586d51d30b69d1f70e40d27f1</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376963778.f8Deba5.31588--

--===============1420028950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1420028950==--

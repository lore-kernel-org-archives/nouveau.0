From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102349] nv4x crashing with plasmashell - gdb log
 included
Date: Fri, 27 Jul 2018 21:37:26 +0000
Message-ID: <bug-102349-8800-tIgxK3umPd@http.bugs.freedesktop.org/>
References: <bug-102349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1599152625=="
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


--===============1599152625==
Content-Type: multipart/alternative; boundary="15327274451.Eda5a.790"
Content-Transfer-Encoding: 7bit


--15327274451.Eda5a.790
Date: Fri, 27 Jul 2018 21:37:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102349

mirh <mirh-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mirh-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org

--- Comment #10 from mirh <mirh-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org> ---
Ping (and I wonder if this couldn't be any related to Steam segfaults)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15327274451.Eda5a.790
Date: Fri, 27 Jul 2018 21:37:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mirh&#64;=
protonmail.ch" title=3D"mirh &lt;mirh&#64;protonmail.ch&gt;"> <span class=
=3D"fn">mirh</span></a>
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
           <td>mirh&#64;protonmail.ch
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349">bug 10234=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mirh&#64;protonmail.ch" title=3D"mirh &lt;mirh&#64;protonmail.ch&gt;"> <spa=
n class=3D"fn">mirh</span></a>
</span></b>
        <pre>Ping (and I wonder if this couldn't be any related to Steam se=
gfaults)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15327274451.Eda5a.790--

--===============1599152625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1599152625==--

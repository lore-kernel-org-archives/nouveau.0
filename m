From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72943] [NV98] hangs in nvbios_init on probe (worked
	in 3.2)
Date: Mon, 23 Dec 2013 06:25:05 +0000
Message-ID: <bug-72943-8800-rK6BFlW4yu@http.bugs.freedesktop.org/>
References: <bug-72943-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0835615254=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72943-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0835615254==
Content-Type: multipart/alternative; boundary="1387779906.Dd3FDeB1.3354"; charset="us-ascii"


--1387779906.Dd3FDeB1.3354
Date: Mon, 23 Dec 2013 06:25:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D72943

Darcy Br=C3=A1s da Silva <dardevelin-R9hm4oqK0XJGyKhy+UYuEA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #3 from Darcy Br=C3=A1s da Silva <dardevelin-R9hm4oqK0XJGyKhy+UYuEA@public.gmane.org> ---
Hi, sorry for not being able to reply earlier. I am now attaching a syslog.1
with debug=3Dtrace flag.
Feel free to request me any testing/data which may help you help me. :D
A copy of the log may also be found
http://cidadecool.com/z-tunes/debian/problem/syslog.1-debug=3Dtrace

PS: Dec 23 [around 5-6AM]

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1387779906.Dd3FDeB1.3354
Date: Mon, 23 Dec 2013 06:25:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:dardeveli=
n&#64;cidadecool.com" title=3D"Darcy Br=C3=A1s da Silva &lt;dardevelin&#64;=
cidadecool.com&gt;"> <span class=3D"fn">Darcy Br=C3=A1s da Silva</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO --- - [NV98] hangs in nvbios_init on probe (worked in =
3.2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72943">bug 72943<=
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
   title=3D"NEEDINFO --- - [NV98] hangs in nvbios_init on probe (worked in =
3.2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72943#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO --- - [NV98] hangs in nvbios_init on probe (worked in =
3.2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72943">bug 72943<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dardevelin&#64;cidadecool.com" title=3D"Darcy Br=C3=A1s da Silva &lt;dardev=
elin&#64;cidadecool.com&gt;"> <span class=3D"fn">Darcy Br=C3=A1s da Silva</=
span></a>
</span></b>
        <pre>Hi, sorry for not being able to reply earlier. I am now attach=
ing a syslog.1
with debug=3Dtrace flag.
Feel free to request me any testing/data which may help you help me. :D
A copy of the log may also be found
<a href=3D"http://cidadecool.com/z-tunes/debian/problem/syslog.1-debug=3Dtr=
ace">http://cidadecool.com/z-tunes/debian/problem/syslog.1-debug=3Dtrace</a>

PS: Dec 23 [around 5-6AM]</pre>
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

--1387779906.Dd3FDeB1.3354--

--===============0835615254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0835615254==--

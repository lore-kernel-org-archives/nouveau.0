From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72943] [NV98] hangs in nvbios_init on probe (worked
	in 3.2)
Date: Wed, 25 Dec 2013 07:09:20 +0000
Message-ID: <bug-72943-8800-P08GllLkIu@http.bugs.freedesktop.org/>
References: <bug-72943-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0656163979=="
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


--===============0656163979==
Content-Type: multipart/alternative; boundary="1387955360.e5dfF41.26601"; charset="us-ascii"


--1387955360.e5dfF41.26601
Date: Wed, 25 Dec 2013 07:09:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D72943

Darcy Br=C3=A1s da Silva <dardevelin-R9hm4oqK0XJGyKhy+UYuEA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #91141|0                           |1
        is obsolete|                            |

--- Comment #7 from Darcy Br=C3=A1s da Silva <dardevelin-R9hm4oqK0XJGyKhy+UYuEA@public.gmane.org> ---
Created attachment 91182
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D91182&action=3Dedit
syslog with debug=3Dtrace flag, more wait time to hit the disk

I think it hit the disk this time. the date is DEC25.
I am sorry if the process seems slow on getting back to you. but I am getti=
ng
back as fast as I can :) . hope that does not turn you off/down.

As usual the log file is also available under
http://cidadecool.com/z-tunes/debian/problem/syslog.1-debug=3Dtrace-DEC25-

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1387955360.e5dfF41.26601
Date: Wed, 25 Dec 2013 07:09:20 +0000
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
          bz_status_NEW "
   title=3D"NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
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
           <td style=3D"text-align:right;">Attachment #91141 is obsolete</t=
d>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72943#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72943">bug 72943<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dardevelin&#64;cidadecool.com" title=3D"Darcy Br=C3=A1s da Silva &lt;dardev=
elin&#64;cidadecool.com&gt;"> <span class=3D"fn">Darcy Br=C3=A1s da Silva</=
span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D91182"=
 name=3D"attach_91182" title=3D"syslog with debug=3Dtrace flag, more wait t=
ime to hit the disk">attachment 91182</a> <a href=3D"attachment.cgi?id=3D91=
182&amp;action=3Dedit" title=3D"syslog with debug=3Dtrace flag, more wait t=
ime to hit the disk">[details]</a></span>
syslog with debug=3Dtrace flag, more wait time to hit the disk

I think it hit the disk this time. the date is DEC25.
I am sorry if the process seems slow on getting back to you. but I am getti=
ng
back as fast as I can :) . hope that does not turn you off/down.

As usual the log file is also available under
<a href=3D"http://cidadecool.com/z-tunes/debian/problem/syslog.1-debug=3Dtr=
ace-DEC25">http://cidadecool.com/z-tunes/debian/problem/syslog.1-debug=3Dtr=
ace-DEC25</a>-</pre>
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

--1387955360.e5dfF41.26601--

--===============0656163979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0656163979==--

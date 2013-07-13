From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66809] Compiz segfault with latest mesa-git
Date: Sat, 13 Jul 2013 01:14:08 +0000
Message-ID: <bug-66809-8800-5kTx5YTmkA@http.bugs.freedesktop.org/>
References: <bug-66809-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0466328080=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66809-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0466328080==
Content-Type: multipart/alternative; boundary="1373678048.8aB62.1430"; charset="us-ascii"


--1373678048.8aB62.1430
Date: Sat, 13 Jul 2013 01:14:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D66809

Marek Ol=C5=A1=C3=A1k <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |org                         |rg
          Component|Mesa core                   |Drivers/DRI/nouveau

--- Comment #5 from Marek Ol=C5=A1=C3=A1k <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks. The backtrace suggests it's a bug in the nouveau driver and my comm=
it
only uncovered it.

Reassigning to Nouveau.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1373678048.8aB62.1430
Date: Sat, 13 Jul 2013 01:14:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:maraeo&#6=
4;gmail.com" title=3D"Marek Ol=C5=A1=C3=A1k &lt;maraeo&#64;gmail.com&gt;"> =
<span class=3D"fn">Marek Ol=C5=A1=C3=A1k</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Compiz segfault with latest mesa-git"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D66809">bug 66809<=
/a>
        <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Mesa core
           </td>
           <td>Drivers/DRI/nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Compiz segfault with latest mesa-git"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D66809#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Compiz segfault with latest mesa-git"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D66809">bug 66809<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maraeo&#64;gmail.com" title=3D"Marek Ol=C5=A1=C3=A1k &lt;maraeo&#64;gmail.c=
om&gt;"> <span class=3D"fn">Marek Ol=C5=A1=C3=A1k</span></a>
</span></b>
        <pre>Thanks. The backtrace suggests it's a bug in the nouveau drive=
r and my commit
only uncovered it.

Reassigning to Nouveau.</pre>
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

--1373678048.8aB62.1430--

--===============0466328080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0466328080==--

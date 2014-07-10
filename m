From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78530] Memory corruption on Lenovo t440p with runpm
Date: Thu, 10 Jul 2014 14:00:20 +0000
Message-ID: <bug-78530-8800-utDvfrnkux@http.bugs.freedesktop.org/>
References: <bug-78530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2001068107=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2001068107==
Content-Type: multipart/alternative; boundary="1405000820.Afe263.23772"; charset="us-ascii"


--1405000820.Afe263.23772
Date: Thu, 10 Jul 2014 14:00:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78530

--- Comment #9 from Alexander Monakov <amonakov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This problem appears to be fixed in recent kernels after adding "Windows 20=
13"
to kernel built-in ACPI OSI list.  Bisection to resolving kernel commit sho=
ws:

https://github.com/Bumblebee-Project/bbswitch/issues/78#issuecomment-486004=
84

Nikolay =E2=80=94 would you mind closing the bug after verifying it's resol=
ved for you?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1405000820.Afe263.23772
Date: Thu, 10 Jul 2014 14:00:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Memory corruption on Lenovo t440p with runpm"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78530#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Memory corruption on Lenovo t440p with runpm"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78530">bug 78530<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
amonakov&#64;gmail.com" title=3D"Alexander Monakov &lt;amonakov&#64;gmail.c=
om&gt;"> <span class=3D"fn">Alexander Monakov</span></a>
</span></b>
        <pre>This problem appears to be fixed in recent kernels after addin=
g &quot;Windows 2013&quot;
to kernel built-in ACPI OSI list.  Bisection to resolving kernel commit sho=
ws:

<a href=3D"https://github.com/Bumblebee-Project/bbswitch/issues/78#issuecom=
ment-48600484">https://github.com/Bumblebee-Project/bbswitch/issues/78#issu=
ecomment-48600484</a>

Nikolay =E2=80=94 would you mind closing the bug after verifying it's resol=
ved for you?</pre>
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

--1405000820.Afe263.23772--

--===============2001068107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2001068107==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93454] Can't build with LLVM/clang 3.7.0 - SSSE3
 instruction set not enabled
Date: Wed, 23 Dec 2015 10:42:43 +0000
Message-ID: <bug-93454-8800-Id2bAD6sYh@http.bugs.freedesktop.org/>
References: <bug-93454-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0369877759=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93454-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0369877759==
Content-Type: multipart/alternative; boundary="1450867363.ae5DD21.10028"; charset="UTF-8"


--1450867363.ae5DD21.10028
Date: Wed, 23 Dec 2015 10:42:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D93454

Jose Fonseca <jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #8 from Jose Fonseca <jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org> ---
(In reply to Tomasz Pawe=C5=82 Gajc from comment #7)
> Hi, thanks for the workaround
> I found this bug report https://llvm.org/bugs/show_bug.cgi?id=3D24990 and=
 i
> was paring commits for llvm and clang and i did not found anything that
> would corresponds to above bug.

It looks like they had fixed this already before the bug report.

From the git history, the fix is=20

=20
https://github.com/llvm-mirror/clang/commit/41885d36e85ead75a1d18ef7d2f4366=
3f90ed67e

Not sure what clang version got it in the end.

But given this has already been fixed in Clang, I think we shouldn't fix it=
 in
Mesa, otherwise we'll need complex logic to detect exactly which clang vers=
ions
support or not this.

OpenMandriva Cooker made the decision to use LLVM/clang 3.7.0 as default
compiler, so they should crossport any fixes necessary to keep light on.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1450867363.ae5DD21.10028
Date: Wed, 23 Dec 2015 10:42:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jfonseca&=
#64;vmware.com" title=3D"Jose Fonseca &lt;jfonseca&#64;vmware.com&gt;"> <sp=
an class=3D"fn">Jose Fonseca</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Can't build with LLVM/clang 3.7.0 - SSSE3 =
instruction set not enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93454">bug 93454<=
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
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Can't build with LLVM/clang 3.7.0 - SSSE3 =
instruction set not enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93454#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Can't build with LLVM/clang 3.7.0 - SSSE3 =
instruction set not enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93454">bug 93454<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jfonseca&#64;vmware.com" title=3D"Jose Fonseca &lt;jfonseca&#64;vmware.com&=
gt;"> <span class=3D"fn">Jose Fonseca</span></a>
</span></b>
        <pre>(In reply to Tomasz Pawe=C5=82 Gajc from <a href=3D"show_bug.c=
gi?id=3D93454#c7">comment #7</a>)
<span class=3D"quote">&gt; Hi, thanks for the workaround
&gt; I found this bug report <a href=3D"https://llvm.org/bugs/show_bug.cgi?=
id=3D24990">https://llvm.org/bugs/show_bug.cgi?id=3D24990</a> and i
&gt; was paring commits for llvm and clang and i did not found anything that
&gt; would corresponds to above bug.</span >

It looks like they had fixed this already before the bug report.

From the git history, the fix is=20

=20
<a href=3D"https://github.com/llvm-mirror/clang/commit/41885d36e85ead75a1d1=
8ef7d2f43663f90ed67e">https://github.com/llvm-mirror/clang/commit/41885d36e=
85ead75a1d18ef7d2f43663f90ed67e</a>

Not sure what clang version got it in the end.

But given this has already been fixed in Clang, I think we shouldn't fix it=
 in
Mesa, otherwise we'll need complex logic to detect exactly which clang vers=
ions
support or not this.

OpenMandriva Cooker made the decision to use LLVM/clang 3.7.0 as default
compiler, so they should crossport any fixes necessary to keep light on.</p=
re>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450867363.ae5DD21.10028--

--===============0369877759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0369877759==--

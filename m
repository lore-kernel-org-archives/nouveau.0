From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102135] WARN_ON hit when loading G71 with v4.13-rc4
Date: Tue, 30 Jan 2018 21:47:22 +0000
Message-ID: <bug-102135-8800-f57q6OZ8bH@http.bugs.freedesktop.org/>
References: <bug-102135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1916000428=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1916000428==
Content-Type: multipart/alternative; boundary="15173488421.2A6E9DDCe.29905"
Content-Transfer-Encoding: 7bit


--15173488421.2A6E9DDCe.29905
Date: Tue, 30 Jan 2018 21:47:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102135

Ben Crocker <bcrocker-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #4 from Ben Crocker <bcrocker-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
I note that, according to the dmesg output, this is PPC64 big-endian.
Can you provide other hardware specifics?

I see that Ben Skeggs' commit is in the kernel repo as
commit 372aa73e20197d463fc8b34524c20b089a98b1c3;
is anyone equipped to test the fix?

Can we close this as RESOLVED/FIXED?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15173488421.2A6E9DDCe.29905
Date: Tue, 30 Jan 2018 21:47:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:bcrocker&=
#64;redhat.com" title=3D"Ben Crocker &lt;bcrocker&#64;redhat.com&gt;"> <spa=
n class=3D"fn">Ben Crocker</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - WARN_ON hit when loading G71 with v4.13-rc4"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102135">bug 10213=
5</a>
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
   title=3D"NEEDINFO - WARN_ON hit when loading G71 with v4.13-rc4"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102135#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - WARN_ON hit when loading G71 with v4.13-rc4"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102135">bug 10213=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bcrocker&#64;redhat.com" title=3D"Ben Crocker &lt;bcrocker&#64;redhat.com&g=
t;"> <span class=3D"fn">Ben Crocker</span></a>
</span></b>
        <pre>I note that, according to the dmesg output, this is PPC64 big-=
endian.
Can you provide other hardware specifics?

I see that Ben Skeggs' commit is in the kernel repo as
commit 372aa73e20197d463fc8b34524c20b089a98b1c3;
is anyone equipped to test the fix?

Can we close this as RESOLVED/FIXED?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15173488421.2A6E9DDCe.29905--

--===============1916000428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1916000428==--

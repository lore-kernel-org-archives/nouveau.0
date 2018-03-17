From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105174] [GF108][Regression] Unable to handle NULL
 pointer dereference in nouveau_mem_host since kernel 4.15.3
Date: Sat, 17 Mar 2018 14:54:52 +0000
Message-ID: <bug-105174-8800-h8K2eLVmCI@http.bugs.freedesktop.org/>
References: <bug-105174-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1644731721=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105174-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1644731721==
Content-Type: multipart/alternative; boundary="15212984924.e63c.24952"
Content-Transfer-Encoding: 7bit


--15212984924.e63c.24952
Date: Sat, 17 Mar 2018 14:54:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105174

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #14 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Fyi, the attached patch has been submitted along fixes to DRM. It doesn=E2=
=80=99t look
like it has landed yet, but might be part of 4.16-rc6.

(In reply to Philip Raets from comment #13)
> Created attachment 138127 [details]
> Log from patched opensuse
>=20
> I've installed a patched kernel for opensuse (details:
> https://bugzilla.opensuse.org/show_bug.cgi?id=3D1082308)
>=20
> But the problem still occurs when opening JPG's like
> https://www.dropbox.com/s/gex21o67q31aytx/PRP_5808.jpg?dl=3D0
>=20
> This are JPG's that I exported from Darktable
>=20
> attached is the error from journalctl
>=20
> I have to login through ssh with my phone and then I can force a reboot.
> (the graphics freeze, only the cursor is working)

Since the patch works for the bug report author but not for you, I think you
are experiencing another (or an additional) issue. Please open a separate b=
ug
report.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15212984924.e63c.24952
Date: Sat, 17 Mar 2018 14:54:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pierre.mo=
rrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"=
> <span class=3D"fn">Pierre Moreau</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GF108][Regression] Unable to handle NULL poin=
ter dereference in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174">bug 10517=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GF108][Regression] Unable to handle NULL poin=
ter dereference in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GF108][Regression] Unable to handle NULL poin=
ter dereference in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174">bug 10517=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Fyi, the attached patch has been submitted along fixes to DRM.=
 It doesn=E2=80=99t look
like it has landed yet, but might be part of 4.16-rc6.

(In reply to Philip Raets from <a href=3D"show_bug.cgi?id=3D105174#c13">com=
ment #13</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D138127" name=3D"attach_138127" title=3D"Log from patched opensuse">=
attachment 138127</a> <a href=3D"attachment.cgi?id=3D138127&amp;action=3Ded=
it" title=3D"Log from patched opensuse">[details]</a></span>
&gt; Log from patched opensuse
&gt;=20
&gt; I've installed a patched kernel for opensuse (details:
&gt; <a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D1082308">ht=
tps://bugzilla.opensuse.org/show_bug.cgi?id=3D1082308</a>)
&gt;=20
&gt; But the problem still occurs when opening JPG's like
&gt; <a href=3D"https://www.dropbox.com/s/gex21o67q31aytx/PRP_5808.jpg?dl=
=3D0">https://www.dropbox.com/s/gex21o67q31aytx/PRP_5808.jpg?dl=3D0</a>
&gt;=20
&gt; This are JPG's that I exported from Darktable
&gt;=20
&gt; attached is the error from journalctl
&gt;=20
&gt; I have to login through ssh with my phone and then I can force a reboo=
t.
&gt; (the graphics freeze, only the cursor is working)</span >

Since the patch works for the bug report author but not for you, I think you
are experiencing another (or an additional) issue. Please open a separate b=
ug
report.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15212984924.e63c.24952--

--===============1644731721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1644731721==--

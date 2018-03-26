From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105174] [GF108][Regression] Unable to handle NULL
 pointer dereference in nouveau_mem_host since kernel 4.15.3
Date: Mon, 26 Mar 2018 11:01:47 +0000
Message-ID: <bug-105174-8800-2RYVpka1JU@http.bugs.freedesktop.org/>
References: <bug-105174-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1010288622=="
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


--===============1010288622==
Content-Type: multipart/alternative; boundary="15220621070.E317c.29491"
Content-Transfer-Encoding: 7bit


--15220621070.E317c.29491
Date: Mon, 26 Mar 2018 11:01:47 +0000
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
             Status|REOPENED                    |RESOLVED

--- Comment #19 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Stefano Biagiotti from comment #18)
> Created attachment 138354 [details]
> journalctl (kernel-4.15.12-301.fc27.x86_64
>=20
> Fedora kernel-4.15.12-301.fc27.x86_64 from updates-testing repository sti=
ll
> doesn't resolve.
>=20
> Display adapter (from lspci) is:
> 01:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce 8400 GS
> Rev. 2] (rev a1)
>=20
> Attach is an excerpt from "journalctl -k -b -1 --no-pager --no-hostname".

The patch was reported as working by the person who opened this bug report,=
 so
I am changing this bug report back to fixed. Since it does not seem to be t=
he
case for you (and you are using a GPU from a different family, Tesla vs Fer=
mi),
you should open a different bug report.
There has been other reports of the patch not being enough on another Tesla
card (though on a different chipset): you might want to look at
https://bugs.freedesktop.org/show_bug.cgi?id=3D105626 and
https://bugs.freedesktop.org/show_bug.cgi?id=3D105687.

Also, please try to avoid posting excerpts of logs: there can other errors
happening before this NULL pointer dereference, and seeing the different
messages outputed by Nouveau during its initialisation can help shed some l=
ight
on what is going wrong; for example, there is a bug report, also on G98, of=
 EVO
timing out since updating to 4.15
(https://bugs.freedesktop.org/show_bug.cgi?id=3D105319), maybe you are
experiencing that as well?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15220621070.E317c.29491
Date: Mon, 26 Mar 2018 11:01:47 +0000
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
           <td>REOPENED
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174#c19">Comme=
nt # 19</a>
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
        <pre>(In reply to Stefano Biagiotti from <a href=3D"show_bug.cgi?id=
=3D105174#c18">comment #18</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D138354" name=3D"attach_138354" title=3D"journalctl (kernel-4.15.12-=
301.fc27.x86_64">attachment 138354</a> <a href=3D"attachment.cgi?id=3D13835=
4&amp;action=3Dedit" title=3D"journalctl (kernel-4.15.12-301.fc27.x86_64">[=
details]</a></span>
&gt; journalctl (kernel-4.15.12-301.fc27.x86_64
&gt;=20
&gt; Fedora kernel-4.15.12-301.fc27.x86_64 from updates-testing repository =
still
&gt; doesn't resolve.
&gt;=20
&gt; Display adapter (from lspci) is:
&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce 840=
0 GS
&gt; Rev. 2] (rev a1)
&gt;=20
&gt; Attach is an excerpt from &quot;journalctl -k -b -1 --no-pager --no-ho=
stname&quot;.</span >

The patch was reported as working by the person who opened this bug report,=
 so
I am changing this bug report back to fixed. Since it does not seem to be t=
he
case for you (and you are using a GPU from a different family, Tesla vs Fer=
mi),
you should open a different bug report.
There has been other reports of the patch not being enough on another Tesla
card (though on a different chipset): you might want to look at
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GT218][Regression] BUG: unable to handle kernel NULL poi=
nter dereference at 0000000000000040"
   href=3D"show_bug.cgi?id=3D105626">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D105626</a> and
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - BUG: unable to handle kernel NULL pointer dereference at =
0000000000000ca0"
   href=3D"show_bug.cgi?id=3D105687">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D105687</a>.

Also, please try to avoid posting excerpts of logs: there can other errors
happening before this NULL pointer dereference, and seeing the different
messages outputed by Nouveau during its initialisation can help shed some l=
ight
on what is going wrong; for example, there is a bug report, also on G98, of=
 EVO
timing out since updating to 4.15
(<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"show_bug.cgi?id=3D105319">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D105319</a>), maybe you are
experiencing that as well?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15220621070.E317c.29491--

--===============1010288622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1010288622==--

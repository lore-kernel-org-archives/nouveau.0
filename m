From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98457] [NVD9] GPU lockup after resume from
 hibernation with Nouveau driver and firmware-nonfree
Date: Fri, 04 Nov 2016 09:07:08 +0000
Message-ID: <bug-98457-8800-JcDRdzfX1e@http.bugs.freedesktop.org/>
References: <bug-98457-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0627997583=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98457-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0627997583==
Content-Type: multipart/alternative; boundary="14782504281.0a16cb56.31541";
 charset="UTF-8"


--14782504281.0a16cb56.31541
Date: Fri, 4 Nov 2016 09:07:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98457

--- Comment #3 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to wadev from comment #1)
> I tried the trunk (of 2016-10-27) of mesa, libdrm and xf86-video-nouveau,=
 no
> dice.
> I could not, however, try the kernel driver (which I presume is mainly for
> text mode and probably comprises the framebuffer backend of the libdrm), =
as
> I am at 4.8.4 now and the nouveau kernel driver repository is fit for some
> such arcane kernel version that it has been removed even from OpenVZ and
> such. :P
>=20
> If anyone has some ideas on how to find an "edger" repository of the nouv=
eau
> kernel driver object that is ahead of the kernel.org state (if any), plea=
se
> let me know.

You could try https://github.com/skeggsb/linux/tree/linux-4.10 which has the
latest patches, but is not an out-of-tree version. Or the latest image from
https://nouveau.pmoreau.org/ (though it is not as recent as the previous li=
nk,
as the image was generated on Monday).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14782504281.0a16cb56.31541
Date: Fri, 4 Nov 2016 09:07:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] GPU lockup after resume from hibernation with Nouv=
eau driver and firmware-nonfree"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98457#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] GPU lockup after resume from hibernation with Nouv=
eau driver and firmware-nonfree"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98457">bug 98457<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to wadev from <a href=3D"show_bug.cgi?id=3D98457#c1"=
>comment #1</a>)
<span class=3D"quote">&gt; I tried the trunk (of 2016-10-27) of mesa, libdr=
m and xf86-video-nouveau, no
&gt; dice.
&gt; I could not, however, try the kernel driver (which I presume is mainly=
 for
&gt; text mode and probably comprises the framebuffer backend of the libdrm=
), as
&gt; I am at 4.8.4 now and the nouveau kernel driver repository is fit for =
some
&gt; such arcane kernel version that it has been removed even from OpenVZ a=
nd
&gt; such. :P
&gt;=20
&gt; If anyone has some ideas on how to find an &quot;edger&quot; repositor=
y of the nouveau
&gt; kernel driver object that is ahead of the kernel.org state (if any), p=
lease
&gt; let me know.</span >

You could try <a href=3D"https://github.com/skeggsb/linux/tree/linux-4.10">=
https://github.com/skeggsb/linux/tree/linux-4.10</a> which has the
latest patches, but is not an out-of-tree version. Or the latest image from
<a href=3D"https://nouveau.pmoreau.org/">https://nouveau.pmoreau.org/</a> (=
though it is not as recent as the previous link,
as the image was generated on Monday).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14782504281.0a16cb56.31541--

--===============0627997583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0627997583==--

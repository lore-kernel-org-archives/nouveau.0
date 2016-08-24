From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Wed, 24 Aug 2016 20:01:13 +0000
Message-ID: <bug-94990-8800-Si9jVR7WCw@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0196105283=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0196105283==
Content-Type: multipart/alternative; boundary="14720688735.BFfC0ee.18907";
 charset="UTF-8"


--14720688735.BFfC0ee.18907
Date: Wed, 24 Aug 2016 20:01:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #64 from Efrem McCrimon <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have to install the Nvidia driver on on development systems because I am
doing some programming with CUDA.  I use the CUDA Toolkit in C/C++.  I am
converting some of the software over to OpenACC.  OpenACC has it own
compilers but CUDA requires the non-free driver because the tools
communication to the driver with the APIs.

Regards,

Efrem Mc

On Wed, Aug 24, 2016 at 4:35 AM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> *Comment # 63 <https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c63> =
on
> bug 94990 <https://bugs.freedesktop.org/show_bug.cgi?id=3D94990> from Yann
> Golanski <freedesktop-0sa3Xf22Pasdnm+yROfE0A@public.gmane.org> *
>
> (In reply to Efrem McCrimon from comment #62 <https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D94990#c62>)> What version of the non-free Nvidia driver=
 are you using? 370.23 or 367.35?
>
> I do not use the non-free Nvidia driver because it causes many more probl=
ems
> than it solves: every kernel upgrade might break things until a new drive=
r is
> released. At least with the nouveau, it's more in sync.  Well, this bug n=
one
> withstanding :)
>
> ------------------------------
> You are receiving this mail because:
>
>    - You are the assignee for the bug.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14720688735.BFfC0ee.18907
Date: Wed, 24 Aug 2016 20:01:13 +0000
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
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c64">Commen=
t # 64</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
efremmc2&#64;gmail.com" title=3D"Efrem McCrimon &lt;efremmc2&#64;gmail.com&=
gt;"> <span class=3D"fn">Efrem McCrimon</span></a>
</span></b>
        <pre>I have to install the Nvidia driver on on development systems =
because I am
doing some programming with CUDA.  I use the CUDA Toolkit in C/C++.  I am
converting some of the software over to OpenACC.  OpenACC has it own
compilers but CUDA requires the non-free driver because the tools
communication to the driver with the APIs.

Regards,

Efrem Mc

On Wed, Aug 24, 2016 at 4:35 AM, &lt;<a href=3D"mailto:bugzilla-daemon&#64;=
freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class=3D"quote">&gt; *<a href=3D"show_bug.cgi?id=3D94990#c63">Comment=
 # 63</a> &lt;<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990#c63">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D94990#c63</a>&gt; on
&gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990">bug 94990</a> &lt;<a class=3D"bz_bug_li=
nk=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D94990</a>&gt; from Yann
&gt; Golanski &lt;<a href=3D"mailto:freedesktop&#64;kierun.org">freedesktop=
&#64;kierun.org</a>&gt; *</span >
&gt;
<span class=3D"quote">&gt; (In reply to Efrem McCrimon from <a href=3D"show=
_bug.cgi?id=3D94990#c62">comment #62</a> &lt;<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990#c62">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D94990#c62</a>&gt;)&gt; What version of the non-free Nvidia driv=
er are you using? 370.23 or 367.35?</span >
&gt;
<span class=3D"quote">&gt; I do not use the non-free Nvidia driver because =
it causes many more problems
&gt; than it solves: every kernel upgrade might break things until a new dr=
iver is
&gt; released. At least with the nouveau, it's more in sync.  Well, this bu=
g none
&gt; withstanding :)</span >
&gt;
<span class=3D"quote">&gt; ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class=3D"quote">&gt;    - You are the assignee for the bug.</span >
&gt;
&gt;
<span class=3D"quote">&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href=3D"mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists=
.freedesktop.org</a>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a></span >
&gt;
&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14720688735.BFfC0ee.18907--

--===============0196105283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0196105283==--

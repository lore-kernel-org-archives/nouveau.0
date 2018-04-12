From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105884] [GP106] Firefox causes a crash / X lockup in
 the nouveau driver on GTX 1060
Date: Thu, 12 Apr 2018 13:48:14 +0000
Message-ID: <bug-105884-8800-8bSSAJXu6B@http.bugs.freedesktop.org/>
References: <bug-105884-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0657437836=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105884-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0657437836==
Content-Type: multipart/alternative; boundary="15235408941.00653C654.21778"
Content-Transfer-Encoding: 7bit


--15235408941.00653C654.21778
Date: Thu, 12 Apr 2018 13:48:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105884

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Firefox causes a crash / X  |[GP106] Firefox causes a
                   |lockup in the nouveau       |crash / X lockup in the
                   |driver on GTX 1060          |nouveau driver on GTX 1060

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
4.15 had a number of things added to it.

One thing is using hugepages in ttm, which a lot of people have reported is=
sues
with. Try disabling CONFIG_SWIOTLB (not really needed on modern hw, afaik).

Also nouveau's vm got a rewrite. Some fixes needed to be applied, I think
they're all in 4.16, not as sure about 4.15.x.

The start of your errors is

[ 7661.417755] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [PBENTRY] ch 7
[017f3cc000 firefox[19007]] subc 0 mthd 0000 data 00000000
[ 7661.417774] nouveau 0000:01:00.0: gr: TRAP ch 7 [017f3cc000 firefox[1900=
7]]
[ 7661.417780] nouveau 0000:01:00.0: gr: DISPATCH 80000002
[CLASS_SUBCH_MISMATCH]
[ 7661.417793] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[017f3cc000 firefox[19007]] subc 0 mthd 000c data 88888888

which doesn't look extremely familiar. "FIFO is confused", after which
everything goes downhill pretty fast.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15235408941.00653C654.21778
Date: Thu, 12 Apr 2018 13:48:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GP106] Firefox causes a crash / X lockup in the nouveau =
driver on GTX 1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105884">bug 10588=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>Firefox causes a crash / X lockup in the nouveau driver on G=
TX 1060
           </td>
           <td>[GP106] Firefox causes a crash / X lockup in the nouveau dri=
ver on GTX 1060
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GP106] Firefox causes a crash / X lockup in the nouveau =
driver on GTX 1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105884#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GP106] Firefox causes a crash / X lockup in the nouveau =
driver on GTX 1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105884">bug 10588=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>4.15 had a number of things added to it.

One thing is using hugepages in ttm, which a lot of people have reported is=
sues
with. Try disabling CONFIG_SWIOTLB (not really needed on modern hw, afaik).

Also nouveau's vm got a rewrite. Some fixes needed to be applied, I think
they're all in 4.16, not as sure about 4.15.x.

The start of your errors is

[ 7661.417755] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [PBENTRY] ch 7
[017f3cc000 firefox[19007]] subc 0 mthd 0000 data 00000000
[ 7661.417774] nouveau 0000:01:00.0: gr: TRAP ch 7 [017f3cc000 firefox[1900=
7]]
[ 7661.417780] nouveau 0000:01:00.0: gr: DISPATCH 80000002
[CLASS_SUBCH_MISMATCH]
[ 7661.417793] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[017f3cc000 firefox[19007]] subc 0 mthd 000c data 88888888

which doesn't look extremely familiar. &quot;FIFO is confused&quot;, after =
which
everything goes downhill pretty fast.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15235408941.00653C654.21778--

--===============0657437836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0657437836==--

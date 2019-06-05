From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110572] Regularly System Crash: (ca. 1 hour) nouveau
 0000:08:00.0: gr: PGRAPH TLB flush idle timeout fail and nouveau
 0000:08:00.0: mmu: ce0 mmu invalidate timeout
Date: Wed, 05 Jun 2019 08:41:02 +0000
Message-ID: <bug-110572-8800-K0Py7yaRva@http.bugs.freedesktop.org/>
References: <bug-110572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1055884335=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110572-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1055884335==
Content-Type: multipart/alternative; boundary="15597240620.C5E063.1786"
Content-Transfer-Encoding: 7bit


--15597240620.C5E063.1786
Date: Wed, 5 Jun 2019 08:41:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #18 from Linux Freak <Linuxfreak-RbZlAiThDcE@public.gmane.org> ---
Hi,
how can i find out, if i have the correct fbcon module in the kernel?

is this the correct fbcon?

[ 20.468352] fbcon: nouveaufb (fb0) is primary device [ 20.510301] nouveau
0000:08:00.0: fb0: nouveaufb frame buffer device [ 20.527782] [drm] Initial=
ized
nouveau 1.3.1 20120801 for 0000:08:00.0 on minor 0


see:
https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr-pgraph-tlb-flu=
sh-
idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-invalidate-timeout/85154=
/23

+

https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr-pgraph-tlb-flu=
sh-
idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-invalidate-timeout/85154=
/24

LF

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15597240620.C5E063.1786
Date: Wed, 5 Jun 2019 08:41:02 +0000
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
   title=3D"NEW - Regularly System Crash: (ca. 1 hour) nouveau 0000:08:00.0=
: gr: PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0=
 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Regularly System Crash: (ca. 1 hour) nouveau 0000:08:00.0=
: gr: PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0=
 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572">bug 11057=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Linuxfreak&#64;gmx.at" title=3D"Linux Freak &lt;Linuxfreak&#64;gmx.at&gt;">=
 <span class=3D"fn">Linux Freak</span></a>
</span></b>
        <pre>Hi,
how can i find out, if i have the correct fbcon module in the kernel?

is this the correct fbcon?

[ 20.468352] fbcon: nouveaufb (fb0) is primary device [ 20.510301] nouveau
0000:08:00.0: fb0: nouveaufb frame buffer device [ 20.527782] [drm] Initial=
ized
nouveau 1.3.1 20120801 for 0000:08:00.0 on minor 0


see:
<a href=3D"https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr-pgr=
aph-tlb-flush">https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr=
-pgraph-tlb-flush</a>-
idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-invalidate-timeout/85154=
/23

+

<a href=3D"https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr-pgr=
aph-tlb-flush">https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr=
-pgraph-tlb-flush</a>-
idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-invalidate-timeout/85154=
/24

LF</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15597240620.C5E063.1786--

--===============1055884335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1055884335==--

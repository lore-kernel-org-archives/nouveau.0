From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110572] System Crash: nouveau 0000:08:00.0: gr:
 PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0 mmu
 invalidate timeout
Date: Wed, 08 May 2019 22:14:09 +0000
Message-ID: <bug-110572-8800-rhUUEjPEXs@http.bugs.freedesktop.org/>
References: <bug-110572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0338210155=="
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


--===============0338210155==
Content-Type: multipart/alternative; boundary="15573536490.1Ed8.14704"
Content-Transfer-Encoding: 7bit


--15573536490.1Ed8.14704
Date: Wed, 8 May 2019 22:14:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #1 from Linux Freak <Linuxfreak-RbZlAiThDcE@public.gmane.org> ---
Enabling also warnings gives a lot of more useful information:

journalctl -p 4 -b -0

see at:
https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr-pgraph-tlb-flu=
sh-idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-invalidate-timeout/85=
154

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15573536490.1Ed8.14704
Date: Wed, 8 May 2019 22:14:09 +0000
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
   title=3D"NEW - System Crash: nouveau 0000:08:00.0: gr: PGRAPH TLB flush =
idle timeout fail and nouveau 0000:08:00.0: mmu: ce0 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System Crash: nouveau 0000:08:00.0: gr: PGRAPH TLB flush =
idle timeout fail and nouveau 0000:08:00.0: mmu: ce0 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572">bug 11057=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Linuxfreak&#64;gmx.at" title=3D"Linux Freak &lt;Linuxfreak&#64;gmx.at&gt;">=
 <span class=3D"fn">Linux Freak</span></a>
</span></b>
        <pre>Enabling also warnings gives a lot of more useful information:

journalctl -p 4 -b -0

see at:
<a href=3D"https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr-pgr=
aph-tlb-flush-idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-invalidate=
-timeout/85154">https://forum.manjaro.org/t/system-crash-nouveau-000000-0-g=
r-pgraph-tlb-flush-idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-inval=
idate-timeout/85154</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15573536490.1Ed8.14704--

--===============0338210155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0338210155==--

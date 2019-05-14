From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110572] Regularly System Crash: (ca. 1 hour) nouveau
 0000:08:00.0: gr: PGRAPH TLB flush idle timeout fail and nouveau
 0000:08:00.0: mmu: ce0 mmu invalidate timeout
Date: Tue, 14 May 2019 14:57:09 +0000
Message-ID: <bug-110572-8800-1fGbhEQ55u@http.bugs.freedesktop.org/>
References: <bug-110572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1983674297=="
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


--===============1983674297==
Content-Type: multipart/alternative; boundary="15578458280.E80bcabc3.9796"
Content-Transfer-Encoding: 7bit


--15578458280.E80bcabc3.9796
Date: Tue, 14 May 2019 14:57:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #10 from Linux Freak <Linuxfreak-RbZlAiThDcE@public.gmane.org> ---
Created attachment 144262
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144262&action=3Dedit
Crash from 14.05.2019

Call Trace:
Mai 14 15:55:47  kernel:  ? _raw_spin_lock+0x13/0x30
Call Trace:
Mai 14 15:55:55  kernel:  <IRQ>
Mai 14 15:55:55  kernel:  nvkm_pci_intr+0x4c/0x90 [nouveau]
Call Trace:
Mai 14 15:56:00  kernel:  nv50_instobj_release+0x27/0x90 [nouveau]
Call Trace:
Mai 14 15:56:10  kernel:  nvkm_vmm_ptes_get_map+0x246/0x3f0 [nouveau]
Call Trace:
Mai 14 15:56:10  kernel:  nv50_vmm_flush+0x1f2/0x220 [nouveau]

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15578458280.E80bcabc3.9796
Date: Tue, 14 May 2019 14:57:08 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c10">Comme=
nt # 10</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144262=
" name=3D"attach_144262" title=3D"Crash from 14.05.2019">attachment 144262<=
/a> <a href=3D"attachment.cgi?id=3D144262&amp;action=3Dedit" title=3D"Crash=
 from 14.05.2019">[details]</a></span>
Crash from 14.05.2019

Call Trace:
Mai 14 15:55:47  kernel:  ? _raw_spin_lock+0x13/0x30
Call Trace:
Mai 14 15:55:55  kernel:  &lt;IRQ&gt;
Mai 14 15:55:55  kernel:  nvkm_pci_intr+0x4c/0x90 [nouveau]
Call Trace:
Mai 14 15:56:00  kernel:  nv50_instobj_release+0x27/0x90 [nouveau]
Call Trace:
Mai 14 15:56:10  kernel:  nvkm_vmm_ptes_get_map+0x246/0x3f0 [nouveau]
Call Trace:
Mai 14 15:56:10  kernel:  nv50_vmm_flush+0x1f2/0x220 [nouveau]</pre>
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

--15578458280.E80bcabc3.9796--

--===============1983674297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1983674297==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Mon, 20 Aug 2018 13:00:39 +0000
Message-ID: <bug-105319-8800-AamDTGZevS@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2145740774=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2145740774==
Content-Type: multipart/alternative; boundary="15347700400.f482.4037"
Content-Transfer-Encoding: 7bit


--15347700400.f482.4037
Date: Mon, 20 Aug 2018 13:00:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #24 from S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> ---
BTW I started bisect kernel , but we have at least 2 phases , the first pha=
se
the computer hangs but graphics still on [1], this week I hope starting sec=
ond
phase and find the commit where really started EVO timeout, I tested binari=
es
of fedora first and it is between kernel-4.15.0-0.rc4.git4.1.fc28.x86_64 and
kernel-4.15.0-0.rc6.git0.1.fc28.x86_64 (build dates 22 dez 2017 and 01 jan =
2018
) , that is the state of my investigation .

Thanks.



[1]
# bad: [b18d62891aaff49d0ee8367d4b6bb9452469f807] Merge branch
'x86-apic-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/t=
ip
# good: [7d58e1c9059eefe0066c5acf2ffa582f6f0180e3] Merge branch
'smp-hotplug-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect start 'b18d62891aaff49d0ee8367d4b6bb9452469f807'
'7d58e1c9059eefe0066c5acf2ffa582f6f0180e3'
# bad: [331b57d14829c49d75076779cdc54d7e4537bbf0] Merge branch 'irq/urgent'
into x86/apic
git bisect bad 331b57d14829c49d75076779cdc54d7e4537bbf0
# good: [e43b3b58548051f8809391eb7bec7a27ed3003ea] genirq/cpuhotplug: Enfor=
ce
affinity setting on startup of managed irqs
git bisect good e43b3b58548051f8809391eb7bec7a27ed3003ea
# good: [ec0f7cd273dc41ab28bba703cac82690ea5f2863] genirq/matrix: Add
tracepoints
git bisect good ec0f7cd273dc41ab28bba703cac82690ea5f2863
# skip: [f0cc6ccaf7ba42a1247fe5a9244b6009a3beddd5] x86/vector: Simplify the=
 CPU
hotplug vector update
git bisect skip f0cc6ccaf7ba42a1247fe5a9244b6009a3beddd5
# bad: [baab1e84b1124bfd3e40ef6c8e05b2a15136e3d5] x86/apic: Remove unused
callbacks
git bisect bad baab1e84b1124bfd3e40ef6c8e05b2a15136e3d5
# good: [83a105229c59e433409e4d86e9bb915ca281235c] x86/apic: Move common AP=
IC
callbacks
git bisect good 83a105229c59e433409e4d86e9bb915ca281235c
# bad: [3534be05e4adc303d41fae65901598695adea685] x86/ioapic: Mark legacy
vectors at reallocation time
git bisect bad 3534be05e4adc303d41fae65901598695adea685
# bad: [ef9e56d894eab99a33a06b96ba8057afa67d3702] x86/ioapic: Remove obsole=
te
post hotplug update
git bisect bad ef9e56d894eab99a33a06b96ba8057afa67d3702
# good: [c1d1ee9ac1793d939ba1a1322767cc5f77a5b8fe] x86/apic: Get rid of
apic->target_cpus
git bisect good c1d1ee9ac1793d939ba1a1322767cc5f77a5b8fe
# good: [7854f82293e99f6bb3df793a2f579db4670ba71b] x86/vector: Rename
used_vectors to system_vectors
git bisect good 7854f82293e99f6bb3df793a2f579db4670ba71b
# bad: [fdba46ffb4c203b6e6794163493fd310f98bb4be] x86/apic: Get rid of multi
CPU affinity
git bisect bad fdba46ffb4c203b6e6794163493fd310f98bb4be
# first bad commit: [fdba46ffb4c203b6e6794163493fd310f98bb4be] x86/apic: Get
rid of multi CPU affinity

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15347700400.f482.4037
Date: Mon, 20 Aug 2018 13:00:40 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio&#64;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.=
com&gt;"> <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span></b>
        <pre>BTW I started bisect kernel , but we have at least 2 phases , =
the first phase
the computer hangs but graphics still on [1], this week I hope starting sec=
ond
phase and find the commit where really started EVO timeout, I tested binari=
es
of fedora first and it is between kernel-4.15.0-0.rc4.git4.1.fc28.x86_64 and
kernel-4.15.0-0.rc6.git0.1.fc28.x86_64 (build dates 22 dez 2017 and 01 jan =
2018
) , that is the state of my investigation .

Thanks.



[1]
# bad: [b18d62891aaff49d0ee8367d4b6bb9452469f807] Merge branch
'x86-apic-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/t=
ip
# good: [7d58e1c9059eefe0066c5acf2ffa582f6f0180e3] Merge branch
'smp-hotplug-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect start 'b18d62891aaff49d0ee8367d4b6bb9452469f807'
'7d58e1c9059eefe0066c5acf2ffa582f6f0180e3'
# bad: [331b57d14829c49d75076779cdc54d7e4537bbf0] Merge branch 'irq/urgent'
into x86/apic
git bisect bad 331b57d14829c49d75076779cdc54d7e4537bbf0
# good: [e43b3b58548051f8809391eb7bec7a27ed3003ea] genirq/cpuhotplug: Enfor=
ce
affinity setting on startup of managed irqs
git bisect good e43b3b58548051f8809391eb7bec7a27ed3003ea
# good: [ec0f7cd273dc41ab28bba703cac82690ea5f2863] genirq/matrix: Add
tracepoints
git bisect good ec0f7cd273dc41ab28bba703cac82690ea5f2863
# skip: [f0cc6ccaf7ba42a1247fe5a9244b6009a3beddd5] x86/vector: Simplify the=
 CPU
hotplug vector update
git bisect skip f0cc6ccaf7ba42a1247fe5a9244b6009a3beddd5
# bad: [baab1e84b1124bfd3e40ef6c8e05b2a15136e3d5] x86/apic: Remove unused
callbacks
git bisect bad baab1e84b1124bfd3e40ef6c8e05b2a15136e3d5
# good: [83a105229c59e433409e4d86e9bb915ca281235c] x86/apic: Move common AP=
IC
callbacks
git bisect good 83a105229c59e433409e4d86e9bb915ca281235c
# bad: [3534be05e4adc303d41fae65901598695adea685] x86/ioapic: Mark legacy
vectors at reallocation time
git bisect bad 3534be05e4adc303d41fae65901598695adea685
# bad: [ef9e56d894eab99a33a06b96ba8057afa67d3702] x86/ioapic: Remove obsole=
te
post hotplug update
git bisect bad ef9e56d894eab99a33a06b96ba8057afa67d3702
# good: [c1d1ee9ac1793d939ba1a1322767cc5f77a5b8fe] x86/apic: Get rid of
apic-&gt;target_cpus
git bisect good c1d1ee9ac1793d939ba1a1322767cc5f77a5b8fe
# good: [7854f82293e99f6bb3df793a2f579db4670ba71b] x86/vector: Rename
used_vectors to system_vectors
git bisect good 7854f82293e99f6bb3df793a2f579db4670ba71b
# bad: [fdba46ffb4c203b6e6794163493fd310f98bb4be] x86/apic: Get rid of multi
CPU affinity
git bisect bad fdba46ffb4c203b6e6794163493fd310f98bb4be
# first bad commit: [fdba46ffb4c203b6e6794163493fd310f98bb4be] x86/apic: Get
rid of multi CPU affinity</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15347700400.f482.4037--

--===============2145740774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2145740774==--

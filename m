From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93934] DRI_PRIME=1: DeadIsland crash
Date: Sat, 30 Jan 2016 02:40:16 +0000
Message-ID: <bug-93934-8800-HZ6BHtYmjA@http.bugs.freedesktop.org/>
References: <bug-93934-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1929731561=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93934-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1929731561==
Content-Type: multipart/alternative; boundary="14541216160.B2E5.31703";
 charset="UTF-8"


--14541216160.B2E5.31703
Date: Sat, 30 Jan 2016 02:40:16 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93934

--- Comment #1 from Marcos Souza <marcos.souza.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I don't know if this helps, but this is some output of demsg while running the
game:

[ 5604.958910] nouveau 0000:04:00.0: DRM: resuming kernel object tree...
[ 5605.066267] nouveau 0000:04:00.0: DRM: resuming client object trees...
[ 5612.931359] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5612.931715] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
[ 5612.931720] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5612.931881] nouveau 0000:04:00.0: DRM: evicting buffers...
[ 5612.971139] nouveau 0000:04:00.0: DRM: waiting for kernel channels to go
idle...
[ 5612.971174] nouveau 0000:04:00.0: DRM: suspending client object trees...
[ 5612.971546] nouveau 0000:04:00.0: DRM: suspending kernel object tree...
[ 5614.303597] nouveau 0000:04:00.0: DRM: resuming kernel object tree...
[ 5614.419667] nouveau 0000:04:00.0: DRM: resuming client object trees...
[ 5633.956289] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5633.956562] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
[ 5633.956566] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5633.956702] nouveau 0000:04:00.0: DRM: evicting buffers...
[ 5634.304888] nouveau 0000:04:00.0: DRM: waiting for kernel channels to go
idle...
[ 5634.304927] nouveau 0000:04:00.0: DRM: suspending client object trees...
[ 5634.305325] nouveau 0000:04:00.0: DRM: suspending kernel object tree...
[ 5636.107703] nouveau 0000:04:00.0: DRM: resuming kernel object tree...
[ 5636.233536] nouveau 0000:04:00.0: DRM: resuming client object trees...
[ 5705.167328] DeadIslandGame[6952]: segfault at 0 ip 00000000f6f8a106 sp
00000000ffe1ec88 error 4 in libc-2.22.so[f6ef2000+1c7000]
[ 5710.009638] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5710.010004] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
[ 5710.010010] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5710.010213] nouveau 0000:04:00.0: DRM: evicting buffers...
[ 5711.269442] nouveau 0000:04:00.0: DRM: waiting for kernel channels to go
idle...
[ 5711.269481] nouveau 0000:04:00.0: DRM: suspending client object trees...
[ 5711.269903] nouveau 0000:04:00.0: DRM: suspending kernel object tree...
[ 5721.336572] nouveau 0000:04:00.0: DRM: resuming kernel object tree...
[ 5721.472976] nouveau 0000:04:00.0: DRM: resuming client object trees...

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14541216160.B2E5.31703
Date: Sat, 30 Jan 2016 02:40:16 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DRI_PRIME=1: DeadIsland crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93934#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DRI_PRIME=1: DeadIsland crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93934">bug 93934</a>
              from <span class="vcard"><a class="email" href="mailto:marcos.souza.org&#64;gmail.com" title="Marcos Souza &lt;marcos.souza.org&#64;gmail.com&gt;"> <span class="fn">Marcos Souza</span></a>
</span></b>
        <pre>I don't know if this helps, but this is some output of demsg while running the
game:

[ 5604.958910] nouveau 0000:04:00.0: DRM: resuming kernel object tree...
[ 5605.066267] nouveau 0000:04:00.0: DRM: resuming client object trees...
[ 5612.931359] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5612.931715] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
[ 5612.931720] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5612.931881] nouveau 0000:04:00.0: DRM: evicting buffers...
[ 5612.971139] nouveau 0000:04:00.0: DRM: waiting for kernel channels to go
idle...
[ 5612.971174] nouveau 0000:04:00.0: DRM: suspending client object trees...
[ 5612.971546] nouveau 0000:04:00.0: DRM: suspending kernel object tree...
[ 5614.303597] nouveau 0000:04:00.0: DRM: resuming kernel object tree...
[ 5614.419667] nouveau 0000:04:00.0: DRM: resuming client object trees...
[ 5633.956289] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5633.956562] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
[ 5633.956566] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5633.956702] nouveau 0000:04:00.0: DRM: evicting buffers...
[ 5634.304888] nouveau 0000:04:00.0: DRM: waiting for kernel channels to go
idle...
[ 5634.304927] nouveau 0000:04:00.0: DRM: suspending client object trees...
[ 5634.305325] nouveau 0000:04:00.0: DRM: suspending kernel object tree...
[ 5636.107703] nouveau 0000:04:00.0: DRM: resuming kernel object tree...
[ 5636.233536] nouveau 0000:04:00.0: DRM: resuming client object trees...
[ 5705.167328] DeadIslandGame[6952]: segfault at 0 ip 00000000f6f8a106 sp
00000000ffe1ec88 error 4 in libc-2.22.so[f6ef2000+1c7000]
[ 5710.009638] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5710.010004] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
[ 5710.010010] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[ 5710.010213] nouveau 0000:04:00.0: DRM: evicting buffers...
[ 5711.269442] nouveau 0000:04:00.0: DRM: waiting for kernel channels to go
idle...
[ 5711.269481] nouveau 0000:04:00.0: DRM: suspending client object trees...
[ 5711.269903] nouveau 0000:04:00.0: DRM: suspending kernel object tree...
[ 5721.336572] nouveau 0000:04:00.0: DRM: resuming kernel object tree...
[ 5721.472976] nouveau 0000:04:00.0: DRM: resuming client object trees...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14541216160.B2E5.31703--

--===============1929731561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1929731561==--

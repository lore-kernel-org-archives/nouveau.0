From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Sat, 07 Nov 2015 19:12:05 +0000
Message-ID: <bug-90626-8800-G15RFKtCB4@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0568605778=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0568605778==
Content-Type: multipart/alternative; boundary="1446923525.0AAdb2053.6509"; charset="UTF-8"


--1446923525.0AAdb2053.6509
Date: Sat, 7 Nov 2015 19:12:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90626

--- Comment #41 from vdanjean-GANU6spQydw@public.gmane.org <vdanjean.ml-GANU6spQydw@public.gmane.org> ---
I just want to report that the fix work also for me :
$ xrandr --listproviders 
Providers: number : 2
Provider 0: id: 0x8d cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 3 associated providers: 0 name:Intel
Provider 1: id: 0x66 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 3 associated providers: 0 name:nouveau

I still have ACPI warnings when enabling or disabling the NVidia card but it
seems to work nevertheless:
[23693.512790] ACPI Warning: \_SB_.PCI0.PEGP.DGFX._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[23693.513206] ACPI: \_SB_.PCI0.PEGP.DGFX: failed to evaluate _DSM
[23693.513209] ACPI Warning: \_SB_.PCI0.PEGP.DGFX._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)

Thank you very much
  Vincent

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446923525.0AAdb2053.6509
Date: Sat, 7 Nov 2015 19:12:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626#c41">Comment # 41</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626">bug 90626</a>
              from <span class="vcard"><a class="email" href="mailto:vdanjean.ml&#64;free.fr" title="vdanjean&#64;free.fr &lt;vdanjean.ml&#64;free.fr&gt;"> <span class="fn">vdanjean&#64;free.fr</span></a>
</span></b>
        <pre>I just want to report that the fix work also for me :
$ xrandr --listproviders 
Providers: number : 2
Provider 0: id: 0x8d cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 3 associated providers: 0 name:Intel
Provider 1: id: 0x66 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 3 associated providers: 0 name:nouveau

I still have ACPI warnings when enabling or disabling the NVidia card but it
seems to work nevertheless:
[23693.512790] ACPI Warning: \_SB_.PCI0.PEGP.DGFX._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[23693.513206] ACPI: \_SB_.PCI0.PEGP.DGFX: failed to evaluate _DSM
[23693.513209] ACPI Warning: \_SB_.PCI0.PEGP.DGFX._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)

Thank you very much
  Vincent</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446923525.0AAdb2053.6509--

--===============0568605778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0568605778==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92727] [NVC1] PFIFO not accessible when coming out
 of runtime pm
Date: Thu, 29 Oct 2015 17:44:08 +0000
Message-ID: <bug-92727-8800-H7n1UoCVjF@http.bugs.freedesktop.org/>
References: <bug-92727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1161869617=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1161869617==
Content-Type: multipart/alternative; boundary="1446140649.D600a42.5965"; charset="UTF-8"


--1446140649.D600a42.5965
Date: Thu, 29 Oct 2015 17:44:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92727

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|nouveau E[                  |[NVC1] PFIFO not accessible
                   |PBUS][0000:01:00.0] MMIO    |when coming out of runtime
                   |read of 0x00000000 FAULT at |pm
                   |0x002140 [ !ENGINE ]        |

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
... gpu comes ok ...

[  133.975729] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20141107/nsarguments-95)
[  133.975805] ACPI: \_SB_.PCI0.PEG0.PEGP: failed to evaluate _DSM
[  133.975809] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20141107/nsarguments-95)
[  149.703743] r8169 0000:03:00.0 eth0: link down
[  163.217080] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20141107/nsarguments-95)
[  163.217166] ACPI: \_SB_.PCI0.PEG0.PEGP: failed to evaluate _DSM
[  163.217170] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20141107/nsarguments-95)
[  163.227218] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x002140 [ !ENGINE ]

Weird, I guess it doesn't come out of runpm sometimes? You can workaround this
by booting with nouveau.runpm=0 but it will leave the nvidia gpu on the whole
time.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446140649.D600a42.5965
Date: Thu, 29 Oct 2015 17:44:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] PFIFO not accessible when coming out of runtime pm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92727">bug 92727</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>nouveau E[ PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT at 0x002140 [ !ENGINE ]
           </td>
           <td>[NVC1] PFIFO not accessible when coming out of runtime pm
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] PFIFO not accessible when coming out of runtime pm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92727#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] PFIFO not accessible when coming out of runtime pm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92727">bug 92727</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>... gpu comes ok ...

[  133.975729] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20141107/nsarguments-95)
[  133.975805] ACPI: \_SB_.PCI0.PEG0.PEGP: failed to evaluate _DSM
[  133.975809] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20141107/nsarguments-95)
[  149.703743] r8169 0000:03:00.0 eth0: link down
[  163.217080] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20141107/nsarguments-95)
[  163.217166] ACPI: \_SB_.PCI0.PEG0.PEGP: failed to evaluate _DSM
[  163.217170] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20141107/nsarguments-95)
[  163.227218] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x002140 [ !ENGINE ]

Weird, I guess it doesn't come out of runpm sometimes? You can workaround this
by booting with nouveau.runpm=0 but it will leave the nvidia gpu on the whole
time.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446140649.D600a42.5965--

--===============1161869617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1161869617==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Sat, 27 Jun 2015 16:21:18 +0000
Message-ID: <bug-70972-8800-S1LyTsmQPF@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0946573253=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0946573253==
Content-Type: multipart/alternative; boundary="1435422078.43Ec2.32226"; charset="UTF-8"


--1435422078.43Ec2.32226
Date: Sat, 27 Jun 2015 16:21:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70972

--- Comment #21 from Viktor Sidochenko <clicman-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
I have laptop with NVIDIA Corporation C67 [GeForce 7150M / nForce 630M]
[10de:0531] (rev a2) card onboard and native 1280x800 resolution. And it shows
broken picture with nouveau. 

Full info with  lspci -nnv:

00:12.0 VGA compatible controller [0300]: NVIDIA Corporation C67 [GeForce 7150M
/ nForce 630M] [10de:0531] (rev a2) (prog-if 00 [VGA controller])
    Subsystem: Hewlett-Packard Company Device [103c:30cf]
    Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 16
    Memory at f5000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Memory at f4000000 (64-bit, non-prefetchable) [size=16M]
    [virtual] Expansion ROM at f6280000 [disabled] [size=128K]
    Capabilities: [48] Power Management version 2
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
    Kernel driver in use: nvidia

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435422078.43Ec2.32226
Date: Sat, 27 Jun 2015 16:21:18 +0000
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
   title="NEW - [NV67] Modesetting failure at 1280x800"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV67] Modesetting failure at 1280x800"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972">bug 70972</a>
              from <span class="vcard"><a class="email" href="mailto:clicman&#64;yandex.ru" title="Viktor Sidochenko &lt;clicman&#64;yandex.ru&gt;"> <span class="fn">Viktor Sidochenko</span></a>
</span></b>
        <pre>I have laptop with NVIDIA Corporation C67 [GeForce 7150M / nForce 630M]
[10de:0531] (rev a2) card onboard and native 1280x800 resolution. And it shows
broken picture with nouveau. 

Full info with  lspci -nnv:

00:12.0 VGA compatible controller [0300]: NVIDIA Corporation C67 [GeForce 7150M
/ nForce 630M] [10de:0531] (rev a2) (prog-if 00 [VGA controller])
    Subsystem: Hewlett-Packard Company Device [103c:30cf]
    Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 16
    Memory at f5000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Memory at f4000000 (64-bit, non-prefetchable) [size=16M]
    [virtual] Expansion ROM at f6280000 [disabled] [size=128K]
    Capabilities: [48] Power Management version 2
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
    Kernel driver in use: nvidia</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435422078.43Ec2.32226--

--===============0946573253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0946573253==--

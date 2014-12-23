From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Tue, 23 Dec 2014 22:00:29 +0000
Message-ID: <bug-80901-8800-M3V81eVlmH@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0283001210=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0283001210==
Content-Type: multipart/alternative; boundary="1419372029.DF72e3A2.30182"; charset="UTF-8"


--1419372029.DF72e3A2.30182
Date: Tue, 23 Dec 2014 22:00:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #26 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to K.-P. Schrage from comment #25)
> It seems that I am struck by this very bug as well since several months now.
> 
> Fedora 21, kernel-3.17.7-300.fc21.x86_64 (but it started on Fedora 20,
> around kernel-3.15.5-200.fc20.x86_64)
> 
> Graphics card:
> 01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 630]
> (rev a1) (prog-if 00 [VGA controller])
>         Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a90
>         Flags: bus master, fast devsel, latency 0, IRQ 43
>         Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
>         Memory at e8000000 (64-bit, prefetchable) [size=128M]
>         Memory at f0000000 (64-bit, prefetchable) [size=32M]
>         I/O ports at e000 [size=128]
>         Expansion ROM at f7000000 [disabled] [size=512K]
>         Capabilities: [60] Power Management version 3
>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Capabilities: [78] Express Endpoint, MSI 00
>         Capabilities: [b4] Vendor Specific Information: Len=14 <?>
>         Capabilities: [100] Virtual Channel
>         Capabilities: [128] Power Budgeting <?>
>         Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1
> Len=024 <?>
>         Kernel driver in use: nouveau
>         Kernel modules: nouveau
> 
> It seems as if problems started with this commit:
> http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html
> At least reverting this patch to the nouveau source is a workaround, see
> discussion on Redhat bugzilla:
> https://bugzilla.redhat.com/show_bug.cgi?id=1121331
> 
> BTW, isn't bug 84721 a duplicate of this one? It is the very same NVIDIA
> controller as mine that is affected.

It depends on your problem. If by "too high", you mean fan at 100% constantly,
then the bug is a duplicate. If you mean the default fan speed is 35% instead
of 30%, then the bugs are not related and this is a bug hijacking :p Please
send your vbios in your answer and I'll or will not advise you to open a new
bug report.

I am currently in the process of moving to another home, but I can still write
code for you to try :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419372029.DF72e3A2.30182
Date: Tue, 23 Dec 2014 22:00:29 +0000
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
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to K.-P. Schrage from <a href="show_bug.cgi?id=80901#c25">comment #25</a>)
<span class="quote">&gt; It seems that I am struck by this very bug as well since several months now.
&gt; 
&gt; Fedora 21, kernel-3.17.7-300.fc21.x86_64 (but it started on Fedora 20,
&gt; around kernel-3.15.5-200.fc20.x86_64)
&gt; 
&gt; Graphics card:
&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 630]
&gt; (rev a1) (prog-if 00 [VGA controller])
&gt;         Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a90
&gt;         Flags: bus master, fast devsel, latency 0, IRQ 43
&gt;         Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
&gt;         Memory at e8000000 (64-bit, prefetchable) [size=128M]
&gt;         Memory at f0000000 (64-bit, prefetchable) [size=32M]
&gt;         I/O ports at e000 [size=128]
&gt;         Expansion ROM at f7000000 [disabled] [size=512K]
&gt;         Capabilities: [60] Power Management version 3
&gt;         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
&gt;         Capabilities: [78] Express Endpoint, MSI 00
&gt;         Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
&gt;         Capabilities: [100] Virtual Channel
&gt;         Capabilities: [128] Power Budgeting &lt;?&gt;
&gt;         Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1
&gt; Len=024 &lt;?&gt;
&gt;         Kernel driver in use: nouveau
&gt;         Kernel modules: nouveau
&gt; 
&gt; It seems as if problems started with this commit:
&gt; <a href="http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html">http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html</a>
&gt; At least reverting this patch to the nouveau source is a workaround, see
&gt; discussion on Redhat bugzilla:
&gt; <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1121331">https://bugzilla.redhat.com/show_bug.cgi?id=1121331</a>
&gt; 
&gt; BTW, isn't <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="show_bug.cgi?id=84721">bug 84721</a> a duplicate of this one? It is the very same NVIDIA
&gt; controller as mine that is affected.</span >

It depends on your problem. If by &quot;too high&quot;, you mean fan at 100% constantly,
then the bug is a duplicate. If you mean the default fan speed is 35% instead
of 30%, then the bugs are not related and this is a bug hijacking :p Please
send your vbios in your answer and I'll or will not advise you to open a new
bug report.

I am currently in the process of moving to another home, but I can still write
code for you to try :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419372029.DF72e3A2.30182--

--===============0283001210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0283001210==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Wed, 06 Apr 2016 02:38:35 +0000
Message-ID: <bug-93629-8800-GH3bia7TMo@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1026454288=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1026454288==
Content-Type: multipart/alternative; boundary="14599103162.CfBa2dbA.24509";
 charset="UTF-8"


--14599103162.CfBa2dbA.24509
Date: Wed, 6 Apr 2016 02:38:36 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93629

--- Comment #15 from Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think I am facing this issue.

Kernel 4.4.5, Arch Linux, GeForce GTX 650 Ti Boost (first time using it).

X will freeze almost immediately (typically right after my KDE session has
loaded) with the following message:

nouveau 0000:01:00.0: fifo: write fault at 00002a2000 engine 00 [GR] client 0f
[GPC1/PROP_0] reason 02 [PTE] on channel 2 [023faf0000 Xorg[666]]
nouveau 0000:01:00.0: fifo: gr engine fault on channel 2, recovering...

If have just booted using the NVIDIA firmware (NvGrUseFW=1), and X is working
fine so far. Will perform a few more boots and spend some time on it to confirm
the issue is solved.

This seems to be a GR firmware issue, any guidance on how I can help fixing it?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14599103162.CfBa2dbA.24509
Date: Wed, 6 Apr 2016 02:38:36 +0000
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
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
              from <span class="vcard"><a class="email" href="mailto:gnurou&#64;gmail.com" title="Alexandre Courbot &lt;gnurou&#64;gmail.com&gt;"> <span class="fn">Alexandre Courbot</span></a>
</span></b>
        <pre>I think I am facing this issue.

Kernel 4.4.5, Arch Linux, GeForce GTX 650 Ti Boost (first time using it).

X will freeze almost immediately (typically right after my KDE session has
loaded) with the following message:

nouveau 0000:01:00.0: fifo: write fault at 00002a2000 engine 00 [GR] client 0f
[GPC1/PROP_0] reason 02 [PTE] on channel 2 [023faf0000 Xorg[666]]
nouveau 0000:01:00.0: fifo: gr engine fault on channel 2, recovering...

If have just booted using the NVIDIA firmware (NvGrUseFW=1), and X is working
fine so far. Will perform a few more boots and spend some time on it to confirm
the issue is solved.

This seems to be a GR firmware issue, any guidance on how I can help fixing it?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14599103162.CfBa2dbA.24509--

--===============1026454288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1026454288==--

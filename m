From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75569] [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044
 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000
Date: Sat, 01 Mar 2014 06:36:23 +0000
Message-ID: <bug-75569-8800-0sXGJL9cM9@http.bugs.freedesktop.org/>
References: <bug-75569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870780867=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75569-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1870780867==
Content-Type: multipart/alternative; boundary="1393655783.67D0ADA1.11688"; charset="us-ascii"


--1393655783.67D0ADA1.11688
Date: Sat, 1 Mar 2014 06:36:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75569

--- Comment #3 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It hanged again albeit maybe less I don't know. I think it's better to close
this post. I think this might be the age of the card (10 years of service).

[root@delta gebruiker]# dmesg | grep -i agp
[    0.000000] Kernel command line: BOOT_IMAGE=/bzImage quiet
xt_recent.ip_list_tot=6400 xt_recent.ip_pkt_list_tot=1 zswap.enabled=1
nouveau.agpmode=2
[    1.889562] Linux agpgart interface v0.103
[    1.889590] agpgart: Detected VIA KT400/KT400A/KT600 chipset
[    1.910421] agpgart-via 0000:00:00.0: AGP aperture is 256M @ 0xe0000000
[    1.958357] agpgart-via 0000:00:00.0: AGP 3.5 bridge
[    1.958370] agpgart: swapper tried to set rate=x0. Setting to AGP3 x4 mode.
[    1.958380] agpgart-via 0000:00:00.0: putting AGP V3 device into 4x mode
[    1.958430] nouveau 0000:01:00.0: putting AGP V3 device into 4x mode

It seems that I cannot set it lower than 4x mode -> nouveau.agpmode=2

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393655783.67D0ADA1.11688
Date: Sat, 1 Mar 2014 06:36:23 +0000
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
   title="NEW --- - [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75569#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75569">bug 75569</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>It hanged again albeit maybe less I don't know. I think it's better to close
this post. I think this might be the age of the card (10 years of service).

[root&#64;delta gebruiker]# dmesg | grep -i agp
[    0.000000] Kernel command line: BOOT_IMAGE=/bzImage quiet
xt_recent.ip_list_tot=6400 xt_recent.ip_pkt_list_tot=1 zswap.enabled=1
nouveau.agpmode=2
[    1.889562] Linux agpgart interface v0.103
[    1.889590] agpgart: Detected VIA KT400/KT400A/KT600 chipset
[    1.910421] agpgart-via 0000:00:00.0: AGP aperture is 256M &#64; 0xe0000000
[    1.958357] agpgart-via 0000:00:00.0: AGP 3.5 bridge
[    1.958370] agpgart: swapper tried to set rate=x0. Setting to AGP3 x4 mode.
[    1.958380] agpgart-via 0000:00:00.0: putting AGP V3 device into 4x mode
[    1.958430] nouveau 0000:01:00.0: putting AGP V3 device into 4x mode

It seems that I cannot set it lower than 4x mode -&gt; nouveau.agpmode=2</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393655783.67D0ADA1.11688--

--===============1870780867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1870780867==--

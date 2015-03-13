From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Fri, 13 Mar 2015 18:51:40 +0000
Message-ID: <bug-80901-8800-kVkTOEmwrQ@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0626105196=="
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


--===============0626105196==
Content-Type: multipart/alternative; boundary="1426272700.8056f58F3.20149"; charset="UTF-8"


--1426272700.8056f58F3.20149
Date: Fri, 13 Mar 2015 18:51:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #44 from K.-P. Schrage <kpschrage-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to poma from comment #43)

> There is no the GPU fan here, so I tested the CPU fan, and this is how it
> works:
> /etc/udev/rules.d/10-cpu-fan-manual-mode.rules
> RUN+="/bin/sh -c '/bin/echo 1 > /sys/devices/platform/it87.656/pwm1_enable'"
> 
> Therefore remove ACTION & ATTRS part, so it runs unconditionally.
> 
> Before you reboot, check with:
> # udevadm trigger

Now my 10-...rules files in /etc/udev/rules.d/ looks like this:
RUN+="/bin/sh -c '/bin/echo 1 >
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'",
RUN+="/usr/local/bin/nvapoke e118 80000002"

During boot, it sounds as if it gets triggered several times
(noise-silence-noise-silence), but it ends up with a silent gpu fan when the
graphical desktop has started.
Startup logs are flooded with messages like:

nvapoke:473 conflicting memory types e8000000-f0000000
uncached-minus<->write-combining
reserve_memtype failed [mem 0xe8000000-0xefffffff], track uncached-minus, req
uncached-minus

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426272700.8056f58F3.20149
Date: Fri, 13 Mar 2015 18:51:40 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c44">Comment # 44</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:kpschrage&#64;gmx.de" title="K.-P. Schrage &lt;kpschrage&#64;gmx.de&gt;"> <span class="fn">K.-P. Schrage</span></a>
</span></b>
        <pre>(In reply to poma from <a href="show_bug.cgi?id=80901#c43">comment #43</a>)

<span class="quote">&gt; There is no the GPU fan here, so I tested the CPU fan, and this is how it
&gt; works:
&gt; /etc/udev/rules.d/10-cpu-fan-manual-mode.rules
&gt; RUN+=&quot;/bin/sh -c '/bin/echo 1 &gt; /sys/devices/platform/it87.656/pwm1_enable'&quot;
&gt; 
&gt; Therefore remove ACTION &amp; ATTRS part, so it runs unconditionally.
&gt; 
&gt; Before you reboot, check with:
&gt; # udevadm trigger</span >

Now my 10-...rules files in /etc/udev/rules.d/ looks like this:
RUN+=&quot;/bin/sh -c '/bin/echo 1 &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'&quot;,
RUN+=&quot;/usr/local/bin/nvapoke e118 80000002&quot;

During boot, it sounds as if it gets triggered several times
(noise-silence-noise-silence), but it ends up with a silent gpu fan when the
graphical desktop has started.
Startup logs are flooded with messages like:

nvapoke:473 conflicting memory types e8000000-f0000000
uncached-minus&lt;-&gt;write-combining
reserve_memtype failed [mem 0xe8000000-0xefffffff], track uncached-minus, req
uncached-minus</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426272700.8056f58F3.20149--

--===============0626105196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0626105196==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Fri, 13 Mar 2015 16:05:11 +0000
Message-ID: <bug-80901-8800-segwkW0las@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1616523703=="
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


--===============1616523703==
Content-Type: multipart/alternative; boundary="1426262711.BA7cd3.27449"; charset="UTF-8"


--1426262711.BA7cd3.27449
Date: Fri, 13 Mar 2015 16:05:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #43 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to K.-P. Schrage from comment #42)
> (In reply to poma from comment #40)
> 
> > /etc/udev/rules.d/10-unladen-swallow.rules
> > ACTION=="add", ATTRS{vendor}=="0x1234", ATTRS{device}=="0xabcd",
> > RUN+="/bin/sh -c '/bin/echo 1 >
> > /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'",
> > RUN+="/usr/local/bin/nvapoke e118 80000002"
> 
> Thanks, Poma, this rule (all in one line, with my appropriate device and
> vendor id's) seems to work correctly, but it only reduces fan speed for a
> second or so during the boot process, then speed is up again, and the value
> that nvapoke writes is overwritten (800000d8 instead of 80000002).
> Perhaps this rule comes up too early, but changing the prefix number from 10
> to e. g. 99 doesn't help.


Exactly, these are oneliners.

There is no the GPU fan here, so I tested the CPU fan, and this is how it
works:
/etc/udev/rules.d/10-cpu-fan-manual-mode.rules
RUN+="/bin/sh -c '/bin/echo 1 > /sys/devices/platform/it87.656/pwm1_enable'"

Therefore remove ACTION & ATTRS part, so it runs unconditionally.

Before you reboot, check with:
# udevadm trigger

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426262711.BA7cd3.27449
Date: Fri, 13 Mar 2015 16:05:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>(In reply to K.-P. Schrage from <a href="show_bug.cgi?id=80901#c42">comment #42</a>)
<span class="quote">&gt; (In reply to poma from <a href="show_bug.cgi?id=80901#c40">comment #40</a>)
&gt; 
&gt; &gt; /etc/udev/rules.d/10-unladen-swallow.rules
&gt; &gt; ACTION==&quot;add&quot;, ATTRS{vendor}==&quot;0x1234&quot;, ATTRS{device}==&quot;0xabcd&quot;,
&gt; &gt; RUN+=&quot;/bin/sh -c '/bin/echo 1 &gt;
&gt; &gt; /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'&quot;,
&gt; &gt; RUN+=&quot;/usr/local/bin/nvapoke e118 80000002&quot;
&gt; 
&gt; Thanks, Poma, this rule (all in one line, with my appropriate device and
&gt; vendor id's) seems to work correctly, but it only reduces fan speed for a
&gt; second or so during the boot process, then speed is up again, and the value
&gt; that nvapoke writes is overwritten (800000d8 instead of 80000002).
&gt; Perhaps this rule comes up too early, but changing the prefix number from 10
&gt; to e. g. 99 doesn't help.</span >


Exactly, these are oneliners.

There is no the GPU fan here, so I tested the CPU fan, and this is how it
works:
/etc/udev/rules.d/10-cpu-fan-manual-mode.rules
RUN+=&quot;/bin/sh -c '/bin/echo 1 &gt; /sys/devices/platform/it87.656/pwm1_enable'&quot;

Therefore remove ACTION &amp; ATTRS part, so it runs unconditionally.

Before you reboot, check with:
# udevadm trigger</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426262711.BA7cd3.27449--

--===============1616523703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1616523703==--

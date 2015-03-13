From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Fri, 13 Mar 2015 12:36:46 +0000
Message-ID: <bug-80901-8800-ZNh4RmBXz4@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0891747795=="
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


--===============0891747795==
Content-Type: multipart/alternative; boundary="1426250205.Fe8F43.17288"; charset="UTF-8"


--1426250205.Fe8F43.17288
Date: Fri, 13 Mar 2015 12:36:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #42 from K.-P. Schrage <kpschrage-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to poma from comment #40)

> /etc/udev/rules.d/10-unladen-swallow.rules
> ACTION=="add", ATTRS{vendor}=="0x1234", ATTRS{device}=="0xabcd",
> RUN+="/bin/sh -c '/bin/echo 1 >
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'",
> RUN+="/usr/local/bin/nvapoke e118 80000002"

Thanks, Poma, this rule (all in one line, with my appropriate device and vendor
id's) seems to work correctly, but it only reduces fan speed for a second or so
during the boot process, then speed is up again, and the value that nvapoke
writes is overwritten (800000d8 instead of 80000002).
Perhaps this rule comes up too early, but changing the prefix number from 10 to
e. g. 99 doesn't help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426250205.Fe8F43.17288
Date: Fri, 13 Mar 2015 12:36:45 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c42">Comment # 42</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:kpschrage&#64;gmx.de" title="K.-P. Schrage &lt;kpschrage&#64;gmx.de&gt;"> <span class="fn">K.-P. Schrage</span></a>
</span></b>
        <pre>(In reply to poma from <a href="show_bug.cgi?id=80901#c40">comment #40</a>)

<span class="quote">&gt; /etc/udev/rules.d/10-unladen-swallow.rules
&gt; ACTION==&quot;add&quot;, ATTRS{vendor}==&quot;0x1234&quot;, ATTRS{device}==&quot;0xabcd&quot;,
&gt; RUN+=&quot;/bin/sh -c '/bin/echo 1 &gt;
&gt; /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'&quot;,
&gt; RUN+=&quot;/usr/local/bin/nvapoke e118 80000002&quot;</span >

Thanks, Poma, this rule (all in one line, with my appropriate device and vendor
id's) seems to work correctly, but it only reduces fan speed for a second or so
during the boot process, then speed is up again, and the value that nvapoke
writes is overwritten (800000d8 instead of 80000002).
Perhaps this rule comes up too early, but changing the prefix number from 10 to
e. g. 99 doesn't help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426250205.Fe8F43.17288--

--===============0891747795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0891747795==--

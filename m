From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Wed, 11 Mar 2015 15:59:41 +0000
Message-ID: <bug-80901-8800-EsAohUznv4@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1914918032=="
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


--===============1914918032==
Content-Type: multipart/alternative; boundary="1426089581.c62364D3.23961"; charset="UTF-8"


--1426089581.c62364D3.23961
Date: Wed, 11 Mar 2015 15:59:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #40 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to K.-P. Schrage from comment #38)
...
> I put the two lines
> echo 1 >
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable
> /usr/local/bin/nvapoke e118 80000002
> into /etc/rc.d/rc.local (don't know any other way to make this workaround
> permanent).
> 

$ udevadm info -a -p /sys/class/drm/card0 | grep -m2
'ATTRS{device}\|ATTRS{vendor}'
    ATTRS{device}=="0xabcd"
    ATTRS{vendor}=="0x1234"

/etc/udev/rules.d/10-unladen-swallow.rules
ACTION=="add", ATTRS{vendor}=="0x1234", ATTRS{device}=="0xabcd", RUN+="/bin/sh
-c '/bin/echo 1 >
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'",
RUN+="/usr/local/bin/nvapoke e118 80000002"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426089581.c62364D3.23961
Date: Wed, 11 Mar 2015 15:59:41 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c40">Comment # 40</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>(In reply to K.-P. Schrage from <a href="show_bug.cgi?id=80901#c38">comment #38</a>)
...
<span class="quote">&gt; I put the two lines
&gt; echo 1 &gt;
&gt; /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable
&gt; /usr/local/bin/nvapoke e118 80000002
&gt; into /etc/rc.d/rc.local (don't know any other way to make this workaround
&gt; permanent).
&gt; </span >

$ udevadm info -a -p /sys/class/drm/card0 | grep -m2
'ATTRS{device}\|ATTRS{vendor}'
    ATTRS{device}==&quot;0xabcd&quot;
    ATTRS{vendor}==&quot;0x1234&quot;

/etc/udev/rules.d/10-unladen-swallow.rules
ACTION==&quot;add&quot;, ATTRS{vendor}==&quot;0x1234&quot;, ATTRS{device}==&quot;0xabcd&quot;, RUN+=&quot;/bin/sh
-c '/bin/echo 1 &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'&quot;,
RUN+=&quot;/usr/local/bin/nvapoke e118 80000002&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426089581.c62364D3.23961--

--===============1914918032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1914918032==--

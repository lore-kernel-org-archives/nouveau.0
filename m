From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Fri, 13 Mar 2015 21:16:10 +0000
Message-ID: <bug-80901-8800-1wMAyPYIkH@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0409392259=="
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


--===============0409392259==
Content-Type: multipart/alternative; boundary="1426281369.5716BE3.16308"; charset="UTF-8"


--1426281369.5716BE3.16308
Date: Fri, 13 Mar 2015 21:16:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #45 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to K.-P. Schrage from comment #44)

> Now my 10-...rules file in /etc/udev/rules.d/ looks like this:
> RUN+="/bin/sh -c '/bin/echo 1 >
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'",
> RUN+="/usr/local/bin/nvapoke e118 80000002"
> 
> During boot, it sounds as if it gets triggered several times
> (noise-silence-noise-silence), but it ends up with a silent gpu fan when the
> graphical desktop has started.
> Startup logs are flooded with messages like:
> 
> nvapoke:473 conflicting memory types e8000000-f0000000
> uncached-minus<->write-combining
> reserve_memtype failed [mem 0xe8000000-0xefffffff], track uncached-minus,
> req uncached-minus


# rm /etc/udev/rules.d/10-gpu-fan.rules

And try this:
/etc/systemd/system/gpu-fan.service 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[Unit]
Description=GPU fan lower speed

[Service]
Type=oneshot
ExecStart=/bin/sh -c '/bin/echo 1 >
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'
ExecStart=/usr/local/bin/nvapoke e118 80000002
StandardOutput=null
StandardError=null

[Install]
WantedBy=basic.target
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# systemctl enable gpu-fan.service
# systemctl start gpu-fan.service
# systemctl status gpu-fan.service

If everything is OK:
# systemctl reboot
...

BOOT
...
# systemctl status gpu-fan.service

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426281369.5716BE3.16308
Date: Fri, 13 Mar 2015 21:16:09 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c45">Comment # 45</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>(In reply to K.-P. Schrage from <a href="show_bug.cgi?id=80901#c44">comment #44</a>)

<span class="quote">&gt; Now my 10-...rules file in /etc/udev/rules.d/ looks like this:
&gt; RUN+=&quot;/bin/sh -c '/bin/echo 1 &gt;
&gt; /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'&quot;,
&gt; RUN+=&quot;/usr/local/bin/nvapoke e118 80000002&quot;
&gt; 
&gt; During boot, it sounds as if it gets triggered several times
&gt; (noise-silence-noise-silence), but it ends up with a silent gpu fan when the
&gt; graphical desktop has started.
&gt; Startup logs are flooded with messages like:
&gt; 
&gt; nvapoke:473 conflicting memory types e8000000-f0000000
&gt; uncached-minus&lt;-&gt;write-combining
&gt; reserve_memtype failed [mem 0xe8000000-0xefffffff], track uncached-minus,
&gt; req uncached-minus</span >


# rm /etc/udev/rules.d/10-gpu-fan.rules

And try this:
/etc/systemd/system/gpu-fan.service 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[Unit]
Description=GPU fan lower speed

[Service]
Type=oneshot
ExecStart=/bin/sh -c '/bin/echo 1 &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable'
ExecStart=/usr/local/bin/nvapoke e118 80000002
StandardOutput=null
StandardError=null

[Install]
WantedBy=basic.target
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# systemctl enable gpu-fan.service
# systemctl start gpu-fan.service
# systemctl status gpu-fan.service

If everything is OK:
# systemctl reboot
...

BOOT
...
# systemctl status gpu-fan.service</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426281369.5716BE3.16308--

--===============0409392259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0409392259==--

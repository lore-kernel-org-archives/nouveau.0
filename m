From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Mon, 16 Feb 2015 21:40:08 +0000
Message-ID: <bug-87885-8800-o53TmjVwR3@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1946872176=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87885-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1946872176==
Content-Type: multipart/alternative; boundary="1424122808.0D1c1.31266"; charset="UTF-8"


--1424122808.0D1c1.31266
Date: Mon, 16 Feb 2015 21:40:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #17 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to TM from comment #13)
> Quick update, not sure if valuable or not:
> I changed some Xorg config, therefore remembered this thread, and just went
> and tried the last advice concerning the situation using nouveau again. Here
> are the steps:
> 
> # ./nvapoke e120 830000bd
> # cd /sys/class/drm/card0/device/hwmon/hwmon0
> # echo 1 > pwm1_enable
> # echo 65 > pwm1
> # cat pwm1_min
> 65
> 
> # cd /path/to/envytools/nva
> # ./nvapoke e120 830000bd
> # cd /sys/class/drm/card0/device/hwmon/hwmon0
> # cat pwm1_min 
> 35
> # cat pwm1
> 14
> 
> I found it odd that the state of pwm1 is below the min after issuing the
> nvapoke command.
> Apart from that, the fan speed again didn't change :/
> Hope it helps, if not: sorry for the noise.

I'm very sorry for not giving you any feedback on this. I don't understand what
is going on now but that's very helpful! I'll spend my wednesday evening on
this!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424122808.0D1c1.31266
Date: Mon, 16 Feb 2015 21:40:08 +0000
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
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;free.fr" title="Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to TM from <a href="show_bug.cgi?id=87885#c13">comment #13</a>)
<span class="quote">&gt; Quick update, not sure if valuable or not:
&gt; I changed some Xorg config, therefore remembered this thread, and just went
&gt; and tried the last advice concerning the situation using nouveau again. Here
&gt; are the steps:
&gt; 
&gt; # ./nvapoke e120 830000bd
&gt; # cd /sys/class/drm/card0/device/hwmon/hwmon0
&gt; # echo 1 &gt; pwm1_enable
&gt; # echo 65 &gt; pwm1
&gt; # cat pwm1_min
&gt; 65
&gt; 
&gt; # cd /path/to/envytools/nva
&gt; # ./nvapoke e120 830000bd
&gt; # cd /sys/class/drm/card0/device/hwmon/hwmon0
&gt; # cat pwm1_min 
&gt; 35
&gt; # cat pwm1
&gt; 14
&gt; 
&gt; I found it odd that the state of pwm1 is below the min after issuing the
&gt; nvapoke command.
&gt; Apart from that, the fan speed again didn't change :/
&gt; Hope it helps, if not: sorry for the noise.</span >

I'm very sorry for not giving you any feedback on this. I don't understand what
is going on now but that's very helpful! I'll spend my wednesday evening on
this!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424122808.0D1c1.31266--

--===============1946872176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1946872176==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Mon, 16 Feb 2015 20:28:10 +0000
Message-ID: <bug-87885-8800-1uscjPjkZf@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1174817542=="
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


--===============1174817542==
Content-Type: multipart/alternative; boundary="1424118490.505b7D1.19499"; charset="UTF-8"


--1424118490.505b7D1.19499
Date: Mon, 16 Feb 2015 20:28:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #16 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to JonS from comment #14)
> Hi all,
> 
> Came across this thread while googling for a similar problem on a CentOS 7
> install.
> 
> I have a solution.
> 
> echo 10000 >
> /sys/class/drm/controlD64/device/hwmon/hwmon0/temp1_auto_point1_temp
> 
> echo 50000 >
> /sys/class/drm/controlD64/device/hwmon/hwmon0/temp1_auto_point1_temp
> 
> Worth noting that 50000 is a custom value, but you could use the 90000 it is
> originally set to.
> 
> I put that in rc.local
> 
> Anyway, it does the trick for me.
> 
> Not sure why it is necessary, but I'm sure nouveau people upstream might be
> able to identify why it's necessary and code a proper fix. In the mean-time
> this solves the issue for me.

Hey,

Seems like your vbios is broken. Please open another bug report as it is not
the same bug as this one. I will have a look at it!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424118490.505b7D1.19499
Date: Mon, 16 Feb 2015 20:28:10 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;free.fr" title="Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to JonS from <a href="show_bug.cgi?id=87885#c14">comment #14</a>)
<span class="quote">&gt; Hi all,
&gt; 
&gt; Came across this thread while googling for a similar problem on a CentOS 7
&gt; install.
&gt; 
&gt; I have a solution.
&gt; 
&gt; echo 10000 &gt;
&gt; /sys/class/drm/controlD64/device/hwmon/hwmon0/temp1_auto_point1_temp
&gt; 
&gt; echo 50000 &gt;
&gt; /sys/class/drm/controlD64/device/hwmon/hwmon0/temp1_auto_point1_temp
&gt; 
&gt; Worth noting that 50000 is a custom value, but you could use the 90000 it is
&gt; originally set to.
&gt; 
&gt; I put that in rc.local
&gt; 
&gt; Anyway, it does the trick for me.
&gt; 
&gt; Not sure why it is necessary, but I'm sure nouveau people upstream might be
&gt; able to identify why it's necessary and code a proper fix. In the mean-time
&gt; this solves the issue for me.</span >

Hey,

Seems like your vbios is broken. Please open another bug report as it is not
the same bug as this one. I will have a look at it!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424118490.505b7D1.19499--

--===============1174817542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1174817542==--

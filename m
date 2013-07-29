From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60704] [nouveau,
 git regression] - I2C PWM fan control broken on nv50 adt7475 on
 kernels 3.3.x+
Date: Mon, 29 Jul 2013 23:32:40 +0000
Message-ID: <bug-60704-8800-UBhRxu56Tl@http.bugs.freedesktop.org/>
References: <bug-60704-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1378388527=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60704-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1378388527==
Content-Type: multipart/alternative; boundary="1375140760.58FCc41.4885"; charset="us-ascii"


--1375140760.58FCc41.4885
Date: Mon, 29 Jul 2013 23:32:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60704

--- Comment #13 from Marc Meledandri <m.meledandri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
FWIW, on kernel series 3.10.x, adjusting the i2c datarate still provides a
working solution on my nv50 hardware. Sensors detect properly and fan control
is enabled. The necessary patch has changed again:

--- a/drivers/gpu/drm/nouveau/core/subdev/i2cbase.c    2013-07-25
18:16:45.000000000 -0400
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2cbase.c.patched    2013-07-29
19:26:09.393689862 -0400
@@ -122,7 +122,7 @@
         if (!bit)
             return -ENOMEM;

-        bit->udelay = 10;
+        bit->udelay = 20;
         bit->timeout = usecs_to_jiffies(2200);
         bit->data = port;
         bit->pre_xfer = nouveau_i2c_pre_xfer;

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375140760.58FCc41.4885
Date: Mon, 29 Jul 2013 23:32:40 +0000
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
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704">bug 60704</a>
              from <span class="vcard"><a class="email" href="mailto:m.meledandri&#64;gmail.com" title="Marc Meledandri &lt;m.meledandri&#64;gmail.com&gt;"> <span class="fn">Marc Meledandri</span></a>
</span></b>
        <pre>FWIW, on kernel series 3.10.x, adjusting the i2c datarate still provides a
working solution on my nv50 hardware. Sensors detect properly and fan control
is enabled. The necessary patch has changed again:

--- a/drivers/gpu/drm/nouveau/core/subdev/i2cbase.c    2013-07-25
18:16:45.000000000 -0400
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2cbase.c.patched    2013-07-29
19:26:09.393689862 -0400
&#64;&#64; -122,7 +122,7 &#64;&#64;
         if (!bit)
             return -ENOMEM;

-        bit-&gt;udelay = 10;
+        bit-&gt;udelay = 20;
         bit-&gt;timeout = usecs_to_jiffies(2200);
         bit-&gt;data = port;
         bit-&gt;pre_xfer = nouveau_i2c_pre_xfer;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375140760.58FCc41.4885--

--===============1378388527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1378388527==--

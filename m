From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60704] [nouveau,
 git regression] - I2C PWM fan control broken on nv50 adt7475 on
 kernels 3.3.x+
Date: Wed, 31 Jul 2013 12:34:55 +0000
Message-ID: <bug-60704-8800-FPoQtbFClH@http.bugs.freedesktop.org/>
References: <bug-60704-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1266177838=="
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


--===============1266177838==
Content-Type: multipart/alternative; boundary="1375274095.fEa28BcC2.4089"; charset="us-ascii"


--1375274095.fEa28BcC2.4089
Date: Wed, 31 Jul 2013 12:34:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60704

--- Comment #15 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
To make things even better adt7473 seems to load fine in some cases :)

User has the original nv50, running a 3.9.x kernel.

[  DEVICE][0000:01:00.0] BOOT0  : 0x450300a2
[  DEVICE][0000:01:00.0] Chipset: G80 (NV50)
...
adt7475 4-002e: ADT7473 device, revision 0
adt7475 4-002e: Optional features: fan4
[  PTHERM][0000:01:00.0] Found an adt7473 at address 0x2e (controlled by
lm_sensors, temp offset +0 C)
[     I2C][0000:01:00.0] detected monitoring device: adt7473

https://bugs.freedesktop.org/show_bug.cgi?id=67382

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375274095.fEa28BcC2.4089
Date: Wed, 31 Jul 2013 12:34:55 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704">bug 60704</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>To make things even better adt7473 seems to load fine in some cases :)

User has the original nv50, running a 3.9.x kernel.

[  DEVICE][0000:01:00.0] BOOT0  : 0x450300a2
[  DEVICE][0000:01:00.0] Chipset: G80 (NV50)
...
adt7475 4-002e: ADT7473 device, revision 0
adt7475 4-002e: Optional features: fan4
[  PTHERM][0000:01:00.0] Found an adt7473 at address 0x2e (controlled by
lm_sensors, temp offset +0 C)
[     I2C][0000:01:00.0] detected monitoring device: adt7473

<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="show_bug.cgi?id=67382">https://bugs.freedesktop.org/show_bug.cgi?id=67382</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375274095.fEa28BcC2.4089--

--===============1266177838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1266177838==--

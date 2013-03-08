From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Fri, 08 Mar 2013 16:33:35 +0000
Message-ID: <bug-61731-8800-BTYCAvg78a@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0682388768=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61731-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0682388768==
Content-Type: multipart/alternative; boundary="1362760415.3ED0cac11.23898"; charset="us-ascii"


--1362760415.3ED0cac11.23898
Date: Fri, 8 Mar 2013 16:33:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

--- Comment #10 from Ronald <rvhbox-freedesktop-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
Well,

i think i have now completely uninstalled all nvidia packages (eventhough I
still find nvidia files):

/lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia
/lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia/forcedeth.ko
/lib/modules/3.5.0-25-generic/kernel/drivers/video/nvidia
/lib/modules/3.5.0-25-generic/kernel/drivers/video/nvidia/nvidiafb.ko
/usr/lib/xorg/modules/libnvidia-wfb.so.1
/usr/lib/xorg/modules/libnvidia-wfb.so.295.20
/usr/lib/xorg/modules/drivers/nvidia_drv.so

I as long as I keep my power-plug UNPLUGGED during boot the nouveau driver
loads as normal.

But when the power-cord is PLUGGED I get this error in xorg.0.log:

[    1.328023] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    1.328497] [drm] nouveau 0000:01:00.0: unsupported chipset 0xffffffff
[    1.330177] nouveau: probe of 0000:01:00.0 failed with error -22

What can cause this?
How can I solve this?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362760415.3ED0cac11.23898
Date: Fri, 8 Mar 2013 16:33:35 +0000
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
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:rvhbox-freedesktop&#64;yahoo.com" title="Ronald &lt;rvhbox-freedesktop&#64;yahoo.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Well,

i think i have now completely uninstalled all nvidia packages (eventhough I
still find nvidia files):

/lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia
/lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia/forcedeth.ko
/lib/modules/3.5.0-25-generic/kernel/drivers/video/nvidia
/lib/modules/3.5.0-25-generic/kernel/drivers/video/nvidia/nvidiafb.ko
/usr/lib/xorg/modules/libnvidia-wfb.so.1
/usr/lib/xorg/modules/libnvidia-wfb.so.295.20
/usr/lib/xorg/modules/drivers/nvidia_drv.so

I as long as I keep my power-plug UNPLUGGED during boot the nouveau driver
loads as normal.

But when the power-cord is PLUGGED I get this error in xorg.0.log:

[    1.328023] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)
[    1.328497] [drm] nouveau 0000:01:00.0: unsupported chipset 0xffffffff
[    1.330177] nouveau: probe of 0000:01:00.0 failed with error -22

What can cause this?
How can I solve this?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362760415.3ED0cac11.23898--

--===============0682388768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0682388768==--

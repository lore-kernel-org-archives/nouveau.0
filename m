From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Sun, 03 Mar 2013 15:53:21 +0000
Message-ID: <bug-61731-8800-RoY2bOuooU@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0290948554=="
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


--===============0290948554==
Content-Type: multipart/alternative; boundary="1362326001.eEaA2e1.20038"; charset="us-ascii"


--1362326001.eEaA2e1.20038
Date: Sun, 3 Mar 2013 15:53:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

--- Comment #9 from Ronald <rvhbox-freedesktop-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
Well, no the binary driver does not work properly as well. besides I prefer the
nouveau driver.

Reading the nouveau wiki I am pretty sure that my system is not properly
cleaned from previously installed drivers like:

/lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia
/lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia/forcedeth.ko
/lib/modules/3.5.0-25-generic/kernel/drivers/video/nvidia
/lib/modules/3.5.0-25-generic/kernel/drivers/video/nvidia/nvidiafb.ko
/usr/lib/xorg/modules/libnvidia-wfb.so.1
/usr/lib/xorg/modules/libnvidia-wfb.so.295.20
/usr/lib/xorg/modules/drivers/nvidia_drv.so

But I am unsure how to remove them (other then apt-get remove) withotu breaking
anything vital. Can't really find any info on the ubuntu help pages.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362326001.eEaA2e1.20038
Date: Sun, 3 Mar 2013 15:53:21 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:rvhbox-freedesktop&#64;yahoo.com" title="Ronald &lt;rvhbox-freedesktop&#64;yahoo.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Well, no the binary driver does not work properly as well. besides I prefer the
nouveau driver.

Reading the nouveau wiki I am pretty sure that my system is not properly
cleaned from previously installed drivers like:

/lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia
/lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia/forcedeth.ko
/lib/modules/3.5.0-25-generic/kernel/drivers/video/nvidia
/lib/modules/3.5.0-25-generic/kernel/drivers/video/nvidia/nvidiafb.ko
/usr/lib/xorg/modules/libnvidia-wfb.so.1
/usr/lib/xorg/modules/libnvidia-wfb.so.295.20
/usr/lib/xorg/modules/drivers/nvidia_drv.so

But I am unsure how to remove them (other then apt-get remove) withotu breaking
anything vital. Can't really find any info on the ubuntu help pages.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362326001.eEaA2e1.20038--

--===============0290948554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0290948554==--

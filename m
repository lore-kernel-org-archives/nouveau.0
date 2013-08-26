From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33165] [NVA3, NVA8] gpu lockup during driver probe
Date: Mon, 26 Aug 2013 17:27:35 +0000
Message-ID: <bug-33165-8800-5MWdPaf0Iq@http.bugs.freedesktop.org/>
References: <bug-33165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1624882372=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1624882372==
Content-Type: multipart/alternative; boundary="1377538055.0a2a54.2064"; charset="us-ascii"


--1377538055.0a2a54.2064
Date: Mon, 26 Aug 2013 17:27:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=33165

--- Comment #22 from Kevin Martin <ktmdms-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I no longer have accel turned off but I have had to add:

        Option     "ShadowFB" "1"               # [<bool>]

to get mine to work.  

Xorg.0.log:
[   140.225] Current Operating System: Linux ktmtoshiba
3.11.0-0.rc6.git2.1.fc21.x86_64 #1 SMP Thu Aug 22 21:02:34 UTC 2013 x86_
64
[   140.225] Kernel command line:
BOOT_IMAGE=/vmlinuz-3.11.0-0.rc6.git2.1.fc21.x86_64
root=UUID=895ff4c3-db90-4071-aeab-a0ec2d6b
94cf ro rd.md=0 rd.lvm=0 rd.dm=0 rd.luks=0 ipv6.disable=1 rhgb quiet
acpi_backlight=vendor acpi_osi=Linux
[   140.225] Build Date: 30 July 2013  06:10:29AM
[   140.225] Build ID: xorg-x11-server 1.14.2-9.fc20 
[   140.225] Current version of pixman: 0.30.0

[   140.567] (II) Module nouveau: vendor="X.Org Foundation"
[   140.567]     compiled for 1.14.2, module version = 1.0.9
[   140.567]     Module class: X.Org Video Driver
[   140.567]     ABI class: X.Org Video Driver, version 14.1

dmesg:
[    4.516476] fbcon: nouveaufb (fb0) is primary device
[    6.059440] nouveau E[     DRM] GPU lockup - switching to software fbcon
[    6.072773] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    6.072776] nouveau 0000:01:00.0: registered panic notifier
[    6.072852] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377538055.0a2a54.2064
Date: Mon, 26 Aug 2013 17:27:35 +0000
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
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165">bug 33165</a>
              from <span class="vcard"><a class="email" href="mailto:ktmdms&#64;gmail.com" title="Kevin Martin &lt;ktmdms&#64;gmail.com&gt;"> <span class="fn">Kevin Martin</span></a>
</span></b>
        <pre>I no longer have accel turned off but I have had to add:

        Option     &quot;ShadowFB&quot; &quot;1&quot;               # [&lt;bool&gt;]

to get mine to work.  

Xorg.0.log:
[   140.225] Current Operating System: Linux ktmtoshiba
3.11.0-0.rc6.git2.1.fc21.x86_64 #1 SMP Thu Aug 22 21:02:34 UTC 2013 x86_
64
[   140.225] Kernel command line:
BOOT_IMAGE=/vmlinuz-3.11.0-0.rc6.git2.1.fc21.x86_64
root=UUID=895ff4c3-db90-4071-aeab-a0ec2d6b
94cf ro rd.md=0 rd.lvm=0 rd.dm=0 rd.luks=0 ipv6.disable=1 rhgb quiet
acpi_backlight=vendor acpi_osi=Linux
[   140.225] Build Date: 30 July 2013  06:10:29AM
[   140.225] Build ID: xorg-x11-server 1.14.2-9.fc20 
[   140.225] Current version of pixman: 0.30.0

[   140.567] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[   140.567]     compiled for 1.14.2, module version = 1.0.9
[   140.567]     Module class: X.Org Video Driver
[   140.567]     ABI class: X.Org Video Driver, version 14.1

dmesg:
[    4.516476] fbcon: nouveaufb (fb0) is primary device
[    6.059440] nouveau E[     DRM] GPU lockup - switching to software fbcon
[    6.072773] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    6.072776] nouveau 0000:01:00.0: registered panic notifier
[    6.072852] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377538055.0a2a54.2064--

--===============1624882372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1624882372==--

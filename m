From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69952] [NVAA] Xorg crash+restart after glxgears on
	3.12-rc2
Date: Fri, 22 Nov 2013 11:10:36 +0000
Message-ID: <bug-69952-8800-tsg4pZSSv6@http.bugs.freedesktop.org/>
References: <bug-69952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1042834747=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1042834747==
Content-Type: multipart/alternative; boundary="1385118636.2E27831.31532"; charset="us-ascii"


--1385118636.2E27831.31532
Date: Fri, 22 Nov 2013 11:10:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69952

--- Comment #3 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
I enabled posting via kernel cmdline.

cat /proc/cmdline:

BOOT_IMAGE=/vmlinuz-3.12.0 root=UUID=c52e229d-be9c-4d85-b262-5085459dc2d9 ro
rootflags=subvol=@ sysrq_always_enabled ignore_loglevel debug log_buf_len=5M
nouveau.config=NvMSI=0 nouveau.config=NvForcePost=1 sysrq_always_enabled


The crash still occurs:
- LXDE running glxgears
- XFCE running glxgears

Running on KDE : running glxgears "freezes" / makes the Desktop very slow but
it does not crash Xorg there.

System:
-Linux Mint 15 (Ubuntu 13.04)
-NVAA (Geforce 8200) onboard (Jetway JNC62K)
-dual monitor setup (HDMI+VGA)

-Kernel 3.12.0

Steps to replicate this time:
- Login to desktop (XFCE, dual screen)
- in open terminal window : run glxgears
- switch to other virtual desktop
- Xorg hangs, crash (login screen reappers)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385118636.2E27831.31532
Date: Fri, 22 Nov 2013 11:10:36 +0000
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
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952">bug 69952</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>I enabled posting via kernel cmdline.

cat /proc/cmdline:

BOOT_IMAGE=/vmlinuz-3.12.0 root=UUID=c52e229d-be9c-4d85-b262-5085459dc2d9 ro
rootflags=subvol=&#64; sysrq_always_enabled ignore_loglevel debug log_buf_len=5M
nouveau.config=NvMSI=0 nouveau.config=NvForcePost=1 sysrq_always_enabled


The crash still occurs:
- LXDE running glxgears
- XFCE running glxgears

Running on KDE : running glxgears &quot;freezes&quot; / makes the Desktop very slow but
it does not crash Xorg there.

System:
-Linux Mint 15 (Ubuntu 13.04)
-NVAA (Geforce 8200) onboard (Jetway JNC62K)
-dual monitor setup (HDMI+VGA)

-Kernel 3.12.0

Steps to replicate this time:
- Login to desktop (XFCE, dual screen)
- in open terminal window : run glxgears
- switch to other virtual desktop
- Xorg hangs, crash (login screen reappers)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385118636.2E27831.31532--

--===============1042834747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1042834747==--

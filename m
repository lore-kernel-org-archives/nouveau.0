From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55227] GeForce GTX 560 Ti fails to resume
Date: Fri, 05 Oct 2012 02:23:18 +0000
Message-ID: <bug-55227-8800-DSOspRhyva@http.bugs.freedesktop.org/>
References: <bug-55227-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0779562538=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55227-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0779562538==
Content-Type: multipart/alternative; boundary="1349403797.E3b6Fa32.21133"; charset="us-ascii"


--1349403797.E3b6Fa32.21133
Date: Fri, 5 Oct 2012 02:23:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55227

--- Comment #1 from YAFU <yafulinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have this problem in Kubuntu (ubuntu) 12.04 64 bits. nVidia GT430
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 430]
(rev a1)
$ uname -r
3.2.0-31-generic

xserver-xorg-video-nouveau - 1:0.0.16+git20111201+b5534a1-1build2
libdrm-nouveau2 - 2.4.39+git20120918.2426a6a7-0ubuntu0ricotz2~precise


The problem does not always occur immediately after waking up from sleep to
RAM. Sometimes I can still use the system a few minutes after resuming, until
the system freezes. Only the mouse moves. I can reboot with Alt + SysRq RSEIUB.
After freezing always get messages about "drm" and "nouveau" in kern.log:

===============
Sep 23 20:40:18 yafu kernel: [ 5656.008485] PM: Finishing wakeup.
Sep 23 20:40:18 yafu kernel: [ 5656.008487] Restarting tasks ... done.
Sep 23 20:40:19 yafu kernel: [ 5656.285891] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:40:21 yafu kernel: [ 5658.640519] ADDRCONF(NETDEV_UP): wlan0: link is
not ready
Sep 23 20:40:21 yafu kernel: [ 5658.737552] r8169 0000:02:00.0: eth0: link down
Sep 23 20:40:21 yafu kernel: [ 5658.738248] ADDRCONF(NETDEV_UP): eth0: link is
not ready
Sep 23 20:40:24 yafu kernel: [ 5661.340950] ADDRCONF(NETDEV_UP): wlan0: link is
not ready
Sep 23 20:40:24 yafu kernel: [ 5661.513512] r8169 0000:02:00.0: eth0: link down
Sep 23 20:40:24 yafu kernel: [ 5661.514405] ADDRCONF(NETDEV_UP): eth0: link is
not ready
Sep 23 20:40:24 yafu kernel: [ 5661.840834] ADDRCONF(NETDEV_UP): wlan0: link is
not ready
Sep 23 20:40:26 yafu kernel: [ 5664.028541] wlan0: authenticate with
30:39:f2:01:81:65
Sep 23 20:40:26 yafu kernel: [ 5664.036186] wlan0: send auth to
30:39:f2:01:81:65 (try 1/3)
Sep 23 20:40:26 yafu kernel: [ 5664.038007] wlan0: authenticated
Sep 23 20:40:26 yafu kernel: [ 5664.048061] wlan0: associate with
30:39:f2:01:81:65 (try 1/3)
Sep 23 20:40:26 yafu kernel: [ 5664.050513] wlan0: RX AssocResp from
30:39:f2:01:81:65 (capab=0x411 status=0 aid=1)
Sep 23 20:40:26 yafu kernel: [ 5664.050523] wlan0: associated
Sep 23 20:40:26 yafu kernel: [ 5664.051615] ADDRCONF(NETDEV_CHANGE): wlan0:
link becomes ready
Sep 23 20:40:37 yafu kernel: [ 5674.800036] wlan0: no IPv6 routers present
Sep 23 20:45:43 yafu kernel: [ 5981.225699] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:45:58 yafu kernel: [ 5995.352503] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:46:04 yafu kernel: [ 6001.512805] [drm] nouveau 0000:01:00.0:
PMFB0_SUBP0: 0x037f0040
Sep 23 20:46:04 yafu kernel: [ 6001.512811] [drm] nouveau 0000:01:00.0:
PMFB0_SUBP1: 0x037f0000
Sep 23 20:46:50 yafu kernel: [ 6048.184954] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:47:50 yafu kernel: [ 6108.196017] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:47:50 yafu kernel: [ 6108.196017] [drm] nouveau 0000:01:00.0: PFIFO:
unhandled status 0x00800000
====================
====================
Sep 25 10:59:45 yafu kernel: [ 7205.739725] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.739736] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.739762] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.856639] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.856651] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.856673] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.875555] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.875567] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.875590] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.885346] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.885358] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.885381] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.914156] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.914168] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.914190] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.935033] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.935046] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.935067] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.940093] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.940111] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.940135] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.951218] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.951230] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.951253] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.971454] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.971466] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.971486] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.981017] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.981030] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.981052] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.000106] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.000118] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.000139] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.012955] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.012968] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.012992] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.033133] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.033140] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.033149] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.041898] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.041906] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.041914] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.054946] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.054952] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.054961] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.066027] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.066033] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.066042] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.077169] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.077175] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.077184] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.088264] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.088270] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.088279] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.099255] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.099260] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.099270] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.110403] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.110410] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.110419] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.124644] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.124649] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.124658] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.136181] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.136188] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.136201] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.136583] [drm] nouveau 0000:01:00.0: PFIFO:
read fault at 0x000d052000 [PAGE_NOT_PRESENT] from PGRAPH/GPC0/TEX on channel
0x0001ac0000
Sep 25 10:59:45 yafu kernel: [ 7206.136592] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 25 10:59:45 yafu kernel: [ 7206.136617] [drm] nouveau 0000:01:00.0: PGRAPH:
TRAP ch 3 status 0x01000000
Sep 25 10:59:51 yafu kernel: [ 7211.439193] [drm] nouveau 0000:01:00.0: PGRAPH:
TRAP ch 3 status 0x02000000

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349403797.E3b6Fa32.21133
Date: Fri, 5 Oct 2012 02:23:17 +0000
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
   title="NEW --- - GeForce GTX 560 Ti fails to resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55227#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GeForce GTX 560 Ti fails to resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55227">bug 55227</a>
              from <span class="vcard"><a class="email" href="mailto:yafulinux&#64;gmail.com" title="YAFU &lt;yafulinux&#64;gmail.com&gt;"> <span class="fn">YAFU</span></a>
</span></b>
        <pre>I have this problem in Kubuntu (ubuntu) 12.04 64 bits. nVidia GT430
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 430]
(rev a1)
$ uname -r
3.2.0-31-generic

xserver-xorg-video-nouveau - 1:0.0.16+git20111201+b5534a1-1build2
libdrm-nouveau2 - 2.4.39+git20120918.2426a6a7-0ubuntu0ricotz2~precise


The problem does not always occur immediately after waking up from sleep to
RAM. Sometimes I can still use the system a few minutes after resuming, until
the system freezes. Only the mouse moves. I can reboot with Alt + SysRq RSEIUB.
After freezing always get messages about &quot;drm&quot; and &quot;nouveau&quot; in kern.log:

===============
Sep 23 20:40:18 yafu kernel: [ 5656.008485] PM: Finishing wakeup.
Sep 23 20:40:18 yafu kernel: [ 5656.008487] Restarting tasks ... done.
Sep 23 20:40:19 yafu kernel: [ 5656.285891] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:40:21 yafu kernel: [ 5658.640519] ADDRCONF(NETDEV_UP): wlan0: link is
not ready
Sep 23 20:40:21 yafu kernel: [ 5658.737552] r8169 0000:02:00.0: eth0: link down
Sep 23 20:40:21 yafu kernel: [ 5658.738248] ADDRCONF(NETDEV_UP): eth0: link is
not ready
Sep 23 20:40:24 yafu kernel: [ 5661.340950] ADDRCONF(NETDEV_UP): wlan0: link is
not ready
Sep 23 20:40:24 yafu kernel: [ 5661.513512] r8169 0000:02:00.0: eth0: link down
Sep 23 20:40:24 yafu kernel: [ 5661.514405] ADDRCONF(NETDEV_UP): eth0: link is
not ready
Sep 23 20:40:24 yafu kernel: [ 5661.840834] ADDRCONF(NETDEV_UP): wlan0: link is
not ready
Sep 23 20:40:26 yafu kernel: [ 5664.028541] wlan0: authenticate with
30:39:f2:01:81:65
Sep 23 20:40:26 yafu kernel: [ 5664.036186] wlan0: send auth to
30:39:f2:01:81:65 (try 1/3)
Sep 23 20:40:26 yafu kernel: [ 5664.038007] wlan0: authenticated
Sep 23 20:40:26 yafu kernel: [ 5664.048061] wlan0: associate with
30:39:f2:01:81:65 (try 1/3)
Sep 23 20:40:26 yafu kernel: [ 5664.050513] wlan0: RX AssocResp from
30:39:f2:01:81:65 (capab=0x411 status=0 aid=1)
Sep 23 20:40:26 yafu kernel: [ 5664.050523] wlan0: associated
Sep 23 20:40:26 yafu kernel: [ 5664.051615] ADDRCONF(NETDEV_CHANGE): wlan0:
link becomes ready
Sep 23 20:40:37 yafu kernel: [ 5674.800036] wlan0: no IPv6 routers present
Sep 23 20:45:43 yafu kernel: [ 5981.225699] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:45:58 yafu kernel: [ 5995.352503] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:46:04 yafu kernel: [ 6001.512805] [drm] nouveau 0000:01:00.0:
PMFB0_SUBP0: 0x037f0040
Sep 23 20:46:04 yafu kernel: [ 6001.512811] [drm] nouveau 0000:01:00.0:
PMFB0_SUBP1: 0x037f0000
Sep 23 20:46:50 yafu kernel: [ 6048.184954] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:47:50 yafu kernel: [ 6108.196017] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 23 20:47:50 yafu kernel: [ 6108.196017] [drm] nouveau 0000:01:00.0: PFIFO:
unhandled status 0x00800000
====================
====================
Sep 25 10:59:45 yafu kernel: [ 7205.739725] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.739736] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.739762] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.856639] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.856651] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.856673] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.875555] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.875567] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.875590] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.885346] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.885358] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.885381] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.914156] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.914168] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.914190] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.935033] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.935046] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.935067] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.940093] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.940111] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.940135] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.951218] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.951230] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.951253] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.971454] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.971466] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.971486] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7205.981017] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7205.981030] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7205.981052] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.000106] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.000118] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.000139] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.012955] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.012968] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.012992] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.033133] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.033140] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.033149] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.041898] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.041906] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.041914] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.054946] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.054952] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.054961] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.066027] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.066033] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.066042] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.077169] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.077175] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.077184] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.088264] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.088270] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.088279] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.099255] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.099260] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.099270] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.110403] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.110410] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.110419] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.124644] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.124649] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.124658] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.136181] [drm] nouveau 0000:01:00.0: fail
set_domain
Sep 25 10:59:45 yafu kernel: [ 7206.136188] [drm] nouveau 0000:01:00.0:
validate gart_list
Sep 25 10:59:45 yafu kernel: [ 7206.136201] [drm] nouveau 0000:01:00.0:
validate: -22
Sep 25 10:59:45 yafu kernel: [ 7206.136583] [drm] nouveau 0000:01:00.0: PFIFO:
read fault at 0x000d052000 [PAGE_NOT_PRESENT] from PGRAPH/GPC0/TEX on channel
0x0001ac0000
Sep 25 10:59:45 yafu kernel: [ 7206.136592] [drm] nouveau 0000:01:00.0: PFIFO:
unknown status 0x40000000
Sep 25 10:59:45 yafu kernel: [ 7206.136617] [drm] nouveau 0000:01:00.0: PGRAPH:
TRAP ch 3 status 0x01000000
Sep 25 10:59:51 yafu kernel: [ 7211.439193] [drm] nouveau 0000:01:00.0: PGRAPH:
TRAP ch 3 status 0x02000000</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349403797.E3b6Fa32.21133--

--===============0779562538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0779562538==--

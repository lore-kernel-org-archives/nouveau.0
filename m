From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70875] [NVC1] NOUVEAU(0): [drm] failed to set drm
 interface version
Date: Fri, 29 Nov 2013 23:23:57 +0000
Message-ID: <bug-70875-8800-cVXwckgmHz@http.bugs.freedesktop.org/>
References: <bug-70875-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1477936367=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70875-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1477936367==
Content-Type: multipart/alternative; boundary="1385767436.dF7C281.21665"; charset="us-ascii"


--1385767436.dF7C281.21665
Date: Fri, 29 Nov 2013 23:23:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70875

--- Comment #12 from Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> ---
I managed to build and install 3.13-rc1 with CONFIG_PM_RUNTIME on my Fedora,
but I have two issues.

1. I can't determine if NVidia card is disabled when become not used (basing on
a system temperature it's not). vga_switchero always returns DynPwr - can
vgaswitcheroo be more verbose?

$ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynPwr:0000:01:00.0

I need to build and install patched for 3.13 bbswitch version which shows:
$ cat /proc/acpi/bbswitch
0000:01:00.0 ON

and I cannot disable it using bbswitch.
bbswitch: device 0000:01:00.0 is in use by driver 'nouveau', refusing OFF

I also cannot unload nouveau driver. There is nothing more in the kernel log.

2. I tried to boot with bbswitch (then vgaswitcheroo become disabled) and a
discrete is turn off. Unfortunately and cannot tell Prime to use it for
offloading because xrandr --listproviders returns only Intel card. Even when I
manually enable discrete card and later load nouveau driver xrandr returns the
second card with modesetting instead of nouveau (can I do something in that
case?)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385767436.dF7C281.21665
Date: Fri, 29 Nov 2013 23:23:56 +0000
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
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875">bug 70875</a>
              from <span class="vcard"><a class="email" href="mailto:mszpak&#64;wp.pl" title="Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <span class="fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>I managed to build and install 3.13-rc1 with CONFIG_PM_RUNTIME on my Fedora,
but I have two issues.

1. I can't determine if NVidia card is disabled when become not used (basing on
a system temperature it's not). vga_switchero always returns DynPwr - can
vgaswitcheroo be more verbose?

$ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynPwr:0000:01:00.0

I need to build and install patched for 3.13 bbswitch version which shows:
$ cat /proc/acpi/bbswitch
0000:01:00.0 ON

and I cannot disable it using bbswitch.
bbswitch: device 0000:01:00.0 is in use by driver 'nouveau', refusing OFF

I also cannot unload nouveau driver. There is nothing more in the kernel log.

2. I tried to boot with bbswitch (then vgaswitcheroo become disabled) and a
discrete is turn off. Unfortunately and cannot tell Prime to use it for
offloading because xrandr --listproviders returns only Intel card. Even when I
manually enable discrete card and later load nouveau driver xrandr returns the
second card with modesetting instead of nouveau (can I do something in that
case?)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385767436.dF7C281.21665--

--===============1477936367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1477936367==--

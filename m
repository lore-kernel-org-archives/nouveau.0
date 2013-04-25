From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39980] freezing nouveau
Date: Thu, 25 Apr 2013 13:56:46 +0000
Message-ID: <bug-39980-8800-CPhB2OENQX@http.bugs.freedesktop.org/>
References: <bug-39980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1581092183=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1581092183==
Content-Type: multipart/alternative; boundary="1366898206.eDEdB7c2.11800"; charset="us-ascii"


--1366898206.eDEdB7c2.11800
Date: Thu, 25 Apr 2013 13:56:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=39980

--- Comment #7 from freeclimbing-Mmb7MZpHnFY@public.gmane.org ---
Hello,

I have the same problem: X freezes, mouse is working, keyboard does (mostly)
not work. But: I can still switch to console with Ctrl+Alt+F1 or sth like that. 

In my syslog i find messages like that:

Apr 25 14:27:05 foo kernel: [1390386.065164] [drm] nouveau 0000:0f:00.0: fail
ttm_validate
Apr 25 14:27:05 foo kernel: [1390386.065168] [drm] nouveau 0000:0f:00.0:
validate vram_list
Apr 25 14:27:05 foo kernel: [1390386.065177] [drm] nouveau 0000:0f:00.0:
validate: -12
Apr 25 14:28:00 foo kernel: [1390440.453306] [drm] nouveau 0000:0f:00.0: fail
ttm_validate
Apr 25 14:28:00 foo kernel: [1390440.453310] [drm] nouveau 0000:0f:00.0:
validate vram_list
Apr 25 14:28:00 foo kernel: [1390440.453337] [drm] nouveau 0000:0f:00.0:
validate: -12
Apr 25 14:28:54 foo kernel: [1390494.359876] [drm] nouveau 0000:0f:00.0: fail
ttm_validate
Apr 25 14:28:54 foo kernel: [1390494.359880] [drm] nouveau 0000:0f:00.0:
validate vram_list
Apr 25 14:28:54 foo kernel: [1390494.359887] [drm] nouveau 0000:0f:00.0:
validate: -12
Apr 25 14:34:01 foo gdm3][17808]: GLib-GIO-WARNING: Dropping signal
ActiveSessionChanged of type (s) since the type from the expected interface is
(o)
Apr 25 14:34:03 foo acpid: client 17732[0:0] has disconnected

My solution is then normally to restart gdm, then its working again (for some
time). Its absolutely not reproducable, for me its totally random occurance.

Some of my system settings:
Debian testing
% uname -a
Linux foo 3.2.0-4-amd64 #1 SMP Debian 3.2.41-2 x86_64 GNU/Linux
% lspci G NVIDIA
0f:00.0 VGA compatible controller: NVIDIA Corporation G98 [Quadro NVS 295] (rev
a1)
% show xserver-xorg G Version
Version: 1:7.7+2
% show xserver-xorg-core G Version
Version: 2:1.12.4-6
% show xserver-xorg-video-nouveau G Version
Version: 1:1.0.1-5
% show libdrm-nouveau1a G Version
Version: 2.4.40-1~deb7u2
% show libgl1-mesa-dri-experimental G Version
Version: 8.0.5-4

I try to give any information you need! Thx for any help!
Markus

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1366898206.eDEdB7c2.11800
Date: Thu, 25 Apr 2013 13:56:46 +0000
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
   title="NEW --- - freezing nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39980#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - freezing nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39980">bug 39980</a>
              from <span class="vcard"><a class="email" href="mailto:freeclimbing&#64;gmx.de" title="freeclimbing&#64;gmx.de">freeclimbing&#64;gmx.de</a>
</span></b>
        <pre>Hello,

I have the same problem: X freezes, mouse is working, keyboard does (mostly)
not work. But: I can still switch to console with Ctrl+Alt+F1 or sth like that. 

In my syslog i find messages like that:

Apr 25 14:27:05 foo kernel: [1390386.065164] [drm] nouveau 0000:0f:00.0: fail
ttm_validate
Apr 25 14:27:05 foo kernel: [1390386.065168] [drm] nouveau 0000:0f:00.0:
validate vram_list
Apr 25 14:27:05 foo kernel: [1390386.065177] [drm] nouveau 0000:0f:00.0:
validate: -12
Apr 25 14:28:00 foo kernel: [1390440.453306] [drm] nouveau 0000:0f:00.0: fail
ttm_validate
Apr 25 14:28:00 foo kernel: [1390440.453310] [drm] nouveau 0000:0f:00.0:
validate vram_list
Apr 25 14:28:00 foo kernel: [1390440.453337] [drm] nouveau 0000:0f:00.0:
validate: -12
Apr 25 14:28:54 foo kernel: [1390494.359876] [drm] nouveau 0000:0f:00.0: fail
ttm_validate
Apr 25 14:28:54 foo kernel: [1390494.359880] [drm] nouveau 0000:0f:00.0:
validate vram_list
Apr 25 14:28:54 foo kernel: [1390494.359887] [drm] nouveau 0000:0f:00.0:
validate: -12
Apr 25 14:34:01 foo gdm3][17808]: GLib-GIO-WARNING: Dropping signal
ActiveSessionChanged of type (s) since the type from the expected interface is
(o)
Apr 25 14:34:03 foo acpid: client 17732[0:0] has disconnected

My solution is then normally to restart gdm, then its working again (for some
time). Its absolutely not reproducable, for me its totally random occurance.

Some of my system settings:
Debian testing
% uname -a
Linux foo 3.2.0-4-amd64 #1 SMP Debian 3.2.41-2 x86_64 GNU/Linux
% lspci G NVIDIA
0f:00.0 VGA compatible controller: NVIDIA Corporation G98 [Quadro NVS 295] (rev
a1)
% show xserver-xorg G Version
Version: 1:7.7+2
% show xserver-xorg-core G Version
Version: 2:1.12.4-6
% show xserver-xorg-video-nouveau G Version
Version: 1:1.0.1-5
% show libdrm-nouveau1a G Version
Version: 2.4.40-1~deb7u2
% show libgl1-mesa-dri-experimental G Version
Version: 8.0.5-4

I try to give any information you need! Thx for any help!
Markus</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1366898206.eDEdB7c2.11800--

--===============1581092183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1581092183==--

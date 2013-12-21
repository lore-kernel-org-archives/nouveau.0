From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Sat, 21 Dec 2013 13:02:46 +0000
Message-ID: <bug-70390-8800-zpw7D2IBMt@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0118577145=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0118577145==
Content-Type: multipart/alternative; boundary="1387630966.7BC4BBaE3.22698"; charset="us-ascii"


--1387630966.7BC4BBaE3.22698
Date: Sat, 21 Dec 2013 13:02:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #15 from Niels <nem42-yrwVVJnAJyJ/SzgSGea1oA@public.gmane.org> ---
I'm seeing this bug a lot. I think it's the same bug, but it rarely shows in
any of my logs, because the machine locks. It can happen with web browsing,
movie watching or just about anything. Since I'm getting these crashes at least
once a day on my main computer, I'm very much interested in solving the
problem.

What I sometimes get are (the numbers vary, except for the last one):

kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[1232]] get
0x002002b03c put 0x002002cca0 ib_get 0x0000015d ib_put 0x00000162 state
0x80004861 (err: INVALID_CMD) push 0x00406040

I'm seeing this on two different machines.

Machine 1: Gentoo with "NVIDIA NV96"
------------------------------------
sys-kernel/vanilla-sources-3.12.4
x11-base/xorg-server-1.14.3-r2
x11-drivers/xf86-video-nouveau-1.0.10
x11-libs/libdrm-2.4.50
media-libs/mesa-10.0.1

Machine 2: Fedora with "NVIDIA NV84"
------------------------------------
kernel: 3.11.10-200.fc19.x86_64
xorg-x11-server-Xorg: 1.14.4.3.fc19
xorg-x11-drv-nouveau: 1.0.9.1.fc19
libdrm: 2.4.49.2.fc19
mesa-libGL: 9.2.4.1.20131128.fc19


I can't do any major debugging, but if there's anything simple I can do to
help, please let me know.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387630966.7BC4BBaE3.22698
Date: Sat, 21 Dec 2013 13:02:46 +0000
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
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:nem42&#64;get2net.dk" title="Niels &lt;nem42&#64;get2net.dk&gt;"> <span class="fn">Niels</span></a>
</span></b>
        <pre>I'm seeing this bug a lot. I think it's the same bug, but it rarely shows in
any of my logs, because the machine locks. It can happen with web browsing,
movie watching or just about anything. Since I'm getting these crashes at least
once a day on my main computer, I'm very much interested in solving the
problem.

What I sometimes get are (the numbers vary, except for the last one):

kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[1232]] get
0x002002b03c put 0x002002cca0 ib_get 0x0000015d ib_put 0x00000162 state
0x80004861 (err: INVALID_CMD) push 0x00406040

I'm seeing this on two different machines.

Machine 1: Gentoo with &quot;NVIDIA NV96&quot;
------------------------------------
sys-kernel/vanilla-sources-3.12.4
x11-base/xorg-server-1.14.3-r2
x11-drivers/xf86-video-nouveau-1.0.10
x11-libs/libdrm-2.4.50
media-libs/mesa-10.0.1

Machine 2: Fedora with &quot;NVIDIA NV84&quot;
------------------------------------
kernel: 3.11.10-200.fc19.x86_64
xorg-x11-server-Xorg: 1.14.4.3.fc19
xorg-x11-drv-nouveau: 1.0.9.1.fc19
libdrm: 2.4.49.2.fc19
mesa-libGL: 9.2.4.1.20131128.fc19


I can't do any major debugging, but if there's anything simple I can do to
help, please let me know.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387630966.7BC4BBaE3.22698--

--===============0118577145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0118577145==--

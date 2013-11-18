From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Mon, 18 Nov 2013 20:36:02 +0000
Message-ID: <bug-58556-8800-aETgYHwv98@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0357782014=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0357782014==
Content-Type: multipart/alternative; boundary="1384806962.a8D56D3.26221"; charset="us-ascii"


--1384806962.a8D56D3.26221
Date: Mon, 18 Nov 2013 20:36:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #20 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Here are some news about my small progresses.

I found out why commit 20abd1634a6e2eedb84ca977adea56b8aa06cc3e introduced a
bug: it would init the psw->vblank field only if acceleration is enabled even
if it is used in both cases; calling nv50_software_create even with
acceleration solves the problem.

I reverted a few more commits, however I'm stuck on

  commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 
  Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
  Date:   Thu, 19 Jul 2012 22:17:34 +0000

It seems like the init issue was fixed, but the screen stays scrambled. After
some testing, it seems some of the work done by nouveau_channel_new (which is
only called when acceleration is enabled) is needed, and therefore also
n84_fence_create, but I couldn't find which parts. When enabling
nv84_fence_create and nouveau_channel_new for the NVAC card (boot hangs if
enabling it for the NV96 card), nv50_disp_intr spams lots of

  nouveau E[PFB][0000:03:00:0] trapped write at 0x0000546000 on channel
0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT

but it seems harmless, apart from getting a really big dmesg and, some times,
hanging on boot.


Booting with 'nouveau.accel=0 nouveau.modeset=0 3' results in a clean console
mode, and running startx manually after boot will also give a clean GUI.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384806962.a8D56D3.26221
Date: Mon, 18 Nov 2013 20:36:02 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Here are some news about my small progresses.

I found out why commit 20abd1634a6e2eedb84ca977adea56b8aa06cc3e introduced a
bug: it would init the psw-&gt;vblank field only if acceleration is enabled even
if it is used in both cases; calling nv50_software_create even with
acceleration solves the problem.

I reverted a few more commits, however I'm stuck on

  commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 
  Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
  Date:   Thu, 19 Jul 2012 22:17:34 +0000

It seems like the init issue was fixed, but the screen stays scrambled. After
some testing, it seems some of the work done by nouveau_channel_new (which is
only called when acceleration is enabled) is needed, and therefore also
n84_fence_create, but I couldn't find which parts. When enabling
nv84_fence_create and nouveau_channel_new for the NVAC card (boot hangs if
enabling it for the NV96 card), nv50_disp_intr spams lots of

  nouveau E[PFB][0000:03:00:0] trapped write at 0x0000546000 on channel
0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT

but it seems harmless, apart from getting a really big dmesg and, some times,
hanging on boot.


Booting with 'nouveau.accel=0 nouveau.modeset=0 3' results in a clean console
mode, and running startx manually after boot will also give a clean GUI.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384806962.a8D56D3.26221--

--===============0357782014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0357782014==--

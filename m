From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Fri, 26 Jul 2013 20:34:59 +0000
Message-ID: <bug-67315-8800-I6R1H3d05w@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1456071390=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1456071390==
Content-Type: multipart/alternative; boundary="1374870898.AeF7Fc22.8967"; charset="us-ascii"


--1374870898.AeF7Fc22.8967
Date: Fri, 26 Jul 2013 20:34:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Now this is interesting

[19.600630]
Initially the kernel "drm" seems to pass NULL pointer to the card, while doing
nv50_fbcon_imageblit()

ch 1 [0x0007cb0000 DRM] subc 3 class 0x502d mthd 0x0860 data 0x00000000

The way I see it, after this point we're on the mercy of the hardware

[19.627513]
X/the ddx
MP is still funny and fails to execute/set EDGEFLAG_ENABLE to 1 (which for the
sake of me I cannot find in the ddx code?) 

[55.041877]
At this point the GPU is completely stuffed fails to execute/set
NV50_2D_BLIT_SRC_Y_INT, (coming from X).

After that hell breaks loose :P


Rick a few interesting notes
In the last attachment Xorg.log claims that it's starts at ~81.456, whereas
dmesg states that X was running ~19.627541.
* Are those logs matching (ie. captured from the same boot/system startup)
I'm assuming that you've started your screensaver ~55.041877. Is that correct ?
* Do you recall when did your nouveau started started reporting errors (nouveau
E) ?

Note: the following messages are harmless
nouveau E[    PBUS][0000:02:00.0] MMIO read of * FAULT at 0x1002**

Cheers
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374870898.AeF7Fc22.8967
Date: Fri, 26 Jul 2013 20:34:58 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Now this is interesting

[19.600630]
Initially the kernel &quot;drm&quot; seems to pass NULL pointer to the card, while doing
nv50_fbcon_imageblit()

ch 1 [0x0007cb0000 DRM] subc 3 class 0x502d mthd 0x0860 data 0x00000000

The way I see it, after this point we're on the mercy of the hardware

[19.627513]
X/the ddx
MP is still funny and fails to execute/set EDGEFLAG_ENABLE to 1 (which for the
sake of me I cannot find in the ddx code?) 

[55.041877]
At this point the GPU is completely stuffed fails to execute/set
NV50_2D_BLIT_SRC_Y_INT, (coming from X).

After that hell breaks loose :P


Rick a few interesting notes
In the last attachment Xorg.log claims that it's starts at ~81.456, whereas
dmesg states that X was running ~19.627541.
* Are those logs matching (ie. captured from the same boot/system startup)
I'm assuming that you've started your screensaver ~55.041877. Is that correct ?
* Do you recall when did your nouveau started started reporting errors (nouveau
E) ?

Note: the following messages are harmless
nouveau E[    PBUS][0000:02:00.0] MMIO read of * FAULT at 0x1002**

Cheers
Emil</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374870898.AeF7Fc22.8967--

--===============1456071390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1456071390==--

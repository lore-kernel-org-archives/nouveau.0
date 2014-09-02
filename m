From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
Date: Tue, 02 Sep 2014 19:47:57 +0000
Message-ID: <bug-70388-8800-yzgo2vqeXo@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1297767383=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1297767383==
Content-Type: multipart/alternative; boundary="1409687277.E313B1.28300"; charset="us-ascii"


--1409687277.E313B1.28300
Date: Tue, 2 Sep 2014 19:47:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #19 from Linas Vepstas <linasvepstas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
FWIW, I am hitting a similar or the same bug.  Let me keep the report brief:

-- In my case, its an NV44A
-- OS is Ubuntu 12.04 with this weeks latest, brand-new kernel: 3.16.1
-- X seems to hang/crash once/twice right after boot, and then the following
kern messages start showing up:

[  168.871453] nouveau  [     DRM] 0xD2C1: Parsing digital output script table
[  168.934091] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 1 [Xorg[2278]]
get 0x00010000 put 0x00010090 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[  200.472639] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 2 [Xorg[2278]]
get 0x01033000 put 0x01033088 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[  215.472015] nouveau E[Xorg[2278]] failed to idle channel 0xcccc0001
[Xorg[2278]]
[  215.472066] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 2 [Xorg[2278]]
get 0x01033088 put 0x01033090 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[  230.472014] nouveau E[Xorg[2278]] failed to idle channel 0xcccc0001
[Xorg[2278]]
[  245.472044] nouveau E[Xorg[2278]] failed to idle channel 0xcccc0000
[Xorg[2278]]
[  260.472018] nouveau E[Xorg[2278]] failed to idle channel 0xcccc0000
[Xorg[2278]]
[  261.637808] nouveau  [     DRM] 0xC633: Parsing digital output script table
[  261.787097] nouveau  [     DRM] 0xD2C1: Parsing digital output script table
[  261.849926] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 1 [Xorg[2373]] 

-- Note above is almost 3 minutes after boot!
-- Note the 'fielded to idle channel' are exactly 15 seconds apart.
-- Xorg is still crashing/hanging at this point.
 Basically, it starts, the mouse pointer works fine, the lightdm tries to paint
the login dialog, the painting never completes (just a square of grey), some
timer kicks in, and then things repeat again.  Typically one Xorg hang +
autorestart every 3 minutes, repeating 8 to 12 times (about 1/2 hour) when one
of them finally, magically "just works", after which I can log in and use the
machine as normal.  (OK, I have not yet tried watching youtube or doing 3D
yet...)

During later attempts, I get showers of the PFIFO DMA_PUSHER errors,  then 7
minutes in, I start getting this for the first time:

[  431.120645] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 1 [Xorg[2455]]
get 0xbc882d90 put 0x00010130 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
[  431.120704] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x193c data 0x3e998b7a
[  431.120727] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1940 data 0x5e07b578
[  431.120751] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1944 data 0x3df04d6e
[  431.120995] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1948 data 0xd4a617e5
[  431.121017] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x194c data 0x92b307e9
[  431.121039] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1950 data 0x05d62b60
[  431.121061] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1954 data 0x42e9cdfa

which goes on a good while. ... then the cycle repeats, as described above. 
Never quite exactly the same way twice, but similar each time.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409687277.E313B1.28300
Date: Tue, 2 Sep 2014 19:47:57 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:linasvepstas&#64;gmail.com" title="Linas Vepstas &lt;linasvepstas&#64;gmail.com&gt;"> <span class="fn">Linas Vepstas</span></a>
</span></b>
        <pre>FWIW, I am hitting a similar or the same bug.  Let me keep the report brief:

-- In my case, its an NV44A
-- OS is Ubuntu 12.04 with this weeks latest, brand-new kernel: 3.16.1
-- X seems to hang/crash once/twice right after boot, and then the following
kern messages start showing up:

[  168.871453] nouveau  [     DRM] 0xD2C1: Parsing digital output script table
[  168.934091] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 1 [Xorg[2278]]
get 0x00010000 put 0x00010090 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[  200.472639] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 2 [Xorg[2278]]
get 0x01033000 put 0x01033088 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[  215.472015] nouveau E[Xorg[2278]] failed to idle channel 0xcccc0001
[Xorg[2278]]
[  215.472066] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 2 [Xorg[2278]]
get 0x01033088 put 0x01033090 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[  230.472014] nouveau E[Xorg[2278]] failed to idle channel 0xcccc0001
[Xorg[2278]]
[  245.472044] nouveau E[Xorg[2278]] failed to idle channel 0xcccc0000
[Xorg[2278]]
[  260.472018] nouveau E[Xorg[2278]] failed to idle channel 0xcccc0000
[Xorg[2278]]
[  261.637808] nouveau  [     DRM] 0xC633: Parsing digital output script table
[  261.787097] nouveau  [     DRM] 0xD2C1: Parsing digital output script table
[  261.849926] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 1 [Xorg[2373]] 

-- Note above is almost 3 minutes after boot!
-- Note the 'fielded to idle channel' are exactly 15 seconds apart.
-- Xorg is still crashing/hanging at this point.
 Basically, it starts, the mouse pointer works fine, the lightdm tries to paint
the login dialog, the painting never completes (just a square of grey), some
timer kicks in, and then things repeat again.  Typically one Xorg hang +
autorestart every 3 minutes, repeating 8 to 12 times (about 1/2 hour) when one
of them finally, magically &quot;just works&quot;, after which I can log in and use the
machine as normal.  (OK, I have not yet tried watching youtube or doing 3D
yet...)

During later attempts, I get showers of the PFIFO DMA_PUSHER errors,  then 7
minutes in, I start getting this for the first time:

[  431.120645] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 1 [Xorg[2455]]
get 0xbc882d90 put 0x00010130 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
[  431.120704] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x193c data 0x3e998b7a
[  431.120727] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1940 data 0x5e07b578
[  431.120751] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1944 data 0x3df04d6e
[  431.120995] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1948 data 0xd4a617e5
[  431.121017] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x194c data 0x92b307e9
[  431.121039] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1950 data 0x05d62b60
[  431.121061] nouveau E[   PFIFO][0000:01:06.0] CACHE_ERROR - ch 1
[Xorg[2455]] subc 7 mthd 0x1954 data 0x42e9cdfa

which goes on a good while. ... then the cycle repeats, as described above. 
Never quite exactly the same way twice, but similar each time.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409687277.E313B1.28300--

--===============1297767383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1297767383==--

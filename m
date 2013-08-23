From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] NV31 lockup
Date: Fri, 23 Aug 2013 08:05:52 +0000
Message-ID: <bug-20341-8800-DLUv3IfzgL@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0793930680=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0793930680==
Content-Type: multipart/alternative; boundary="1377245152.B66281.5873"; charset="us-ascii"


--1377245152.B66281.5873
Date: Fri, 23 Aug 2013 08:05:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Don't worry about the WARN -- that should get fixed in -rc7 (or you can grab
nouveau/master).

[ 5096.360378] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x00037be4 put 0x0001d690 state 0x2000a428 (err: CALL_SUBR_ACTIVE) push
0x00000000

This is bad. Once this happens, I guess the fifo is out of sync, and that is a
recipe for bad times.

From
https://github.com/envytools/envytools/blob/master/hwdocs/fifo/dma-pusher.txt:

"""
The call command copies dma_get to subr_return, sets subr_active to 1, and
sets dma_get to the target. If subr_active is already set before the call, the
DMA_PUSHER error of type CALL_SUBR_ACTIVE is raised.

The return command copies subr_return to dma_get and clears subr_active. If
subr_active isn't set, it instead raises DMA_PUSHER error of type
RET_SUBR_INACTIVE.
"""

And it looks like we make use of the call functionality in
nouveau_gem_ioctl_pushbuf. The whole scheme seems a bit fragile since we do the
call to some new pushbuf, and then tell userspace to write a return at the
beginning of its next pushbuf. However we might need to do a call in order to
get to that pushbuf, thus causing this condition. But... this code is very
subtle so perhaps I'm missing why this can't happen.

Another thing to try is nouveau.vram_pushbuf on the kernel cmdline -- this
might be what the old CBLocation thing did, not sure.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377245152.B66281.5873
Date: Fri, 23 Aug 2013 08:05:52 +0000
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
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Don't worry about the WARN -- that should get fixed in -rc7 (or you can grab
nouveau/master).

[ 5096.360378] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x00037be4 put 0x0001d690 state 0x2000a428 (err: CALL_SUBR_ACTIVE) push
0x00000000

This is bad. Once this happens, I guess the fifo is out of sync, and that is a
recipe for bad times.

From
<a href="https://github.com/envytools/envytools/blob/master/hwdocs/fifo/dma-pusher.txt">https://github.com/envytools/envytools/blob/master/hwdocs/fifo/dma-pusher.txt</a>:

&quot;&quot;&quot;
The call command copies dma_get to subr_return, sets subr_active to 1, and
sets dma_get to the target. If subr_active is already set before the call, the
DMA_PUSHER error of type CALL_SUBR_ACTIVE is raised.

The return command copies subr_return to dma_get and clears subr_active. If
subr_active isn't set, it instead raises DMA_PUSHER error of type
RET_SUBR_INACTIVE.
&quot;&quot;&quot;

And it looks like we make use of the call functionality in
nouveau_gem_ioctl_pushbuf. The whole scheme seems a bit fragile since we do the
call to some new pushbuf, and then tell userspace to write a return at the
beginning of its next pushbuf. However we might need to do a call in order to
get to that pushbuf, thus causing this condition. But... this code is very
subtle so perhaps I'm missing why this can't happen.

Another thing to try is nouveau.vram_pushbuf on the kernel cmdline -- this
might be what the old CBLocation thing did, not sure.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377245152.B66281.5873--

--===============0793930680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0793930680==--

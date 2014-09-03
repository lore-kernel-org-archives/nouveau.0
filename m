From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Wed, 03 Sep 2014 00:03:48 +0000
Message-ID: <bug-82835-8800-57z0idyM5g@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1362863337=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1362863337==
Content-Type: multipart/alternative; boundary="1409702628.EB1d62.17045"; charset="us-ascii"


--1409702628.EB1d62.17045
Date: Wed, 3 Sep 2014 00:03:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #7)
> (In reply to comment #6)
> > Hm, just noticed this (same as last time, but I guess I wasn't paying enough
> > attention):
> > 
> > nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[1645]] subc 3
> > class 0x8297 mthd 0x1b0c data 0x1000f010
> > nouveau E[     PFB][0000:05:00.0] trapped write at 0x00204050c0 on channel
> > 0x000178fb [mplayer[1645]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
> > 
> > method 1b0c == QUERY_GET. However the data is 0x1000f010, not 0xf010, which
> > means it's not coming from the video stuff or the screen fence stuff, but
> > rather is a PIPE_QUERY_GPU_FINISHED query. Which is interesting, because
> > nothing appears to actually use that PIPE_QUERY type...
> > 
> > Could you stick a assert(0) right before
> > 
> >       nv50_query_get(push, q, 0, 0x1000f010);
> > 
> > in nv50_query.c and see if it triggers (make sure to use a debug build... or
> > make it something nastier than assert), and get a backtrace from gdb? (Or
> > actually just set a breakpoint on that line and see if gdb hits it...)
> 
> No, I tried  to add assert :
> 
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_query.c
> b/src/gallium/drivers/nouveau/nv50/nv50_query.c
> index a373dc6..23f5eaf 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_query.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_query.c
> @@ -222,6 +222,7 @@ nv50_query_end(struct pipe_context *pipe, struct
> pipe_query *pq)
>        break;
>     case PIPE_QUERY_GPU_FINISHED:
>        q->sequence++;
> +      assert(0);
>        nv50_query_get(push, q, 0, 0x1000f010);
>        break;
>     case NVA0_QUERY_STREAM_OUTPUT_BUFFER_OFFSET:
> 
> on top of mesa-git-454aab4 and it doesn't trigger  during mplayer's run
> (resulted in usual hang).

Can you confirm that you built this with --enable-debug? And you saw the
0x1000f010 value in your dmesg?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409702628.EB1d62.17045
Date: Wed, 3 Sep 2014 00:03:48 +0000
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
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=82835#c7">comment #7</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=82835#c6">comment #6</a>)
&gt; &gt; Hm, just noticed this (same as last time, but I guess I wasn't paying enough
&gt; &gt; attention):
&gt; &gt; 
&gt; &gt; nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[1645]] subc 3
&gt; &gt; class 0x8297 mthd 0x1b0c data 0x1000f010
&gt; &gt; nouveau E[     PFB][0000:05:00.0] trapped write at 0x00204050c0 on channel
&gt; &gt; 0x000178fb [mplayer[1645]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
&gt; &gt; 
&gt; &gt; method 1b0c == QUERY_GET. However the data is 0x1000f010, not 0xf010, which
&gt; &gt; means it's not coming from the video stuff or the screen fence stuff, but
&gt; &gt; rather is a PIPE_QUERY_GPU_FINISHED query. Which is interesting, because
&gt; &gt; nothing appears to actually use that PIPE_QUERY type...
&gt; &gt; 
&gt; &gt; Could you stick a assert(0) right before
&gt; &gt; 
&gt; &gt;       nv50_query_get(push, q, 0, 0x1000f010);
&gt; &gt; 
&gt; &gt; in nv50_query.c and see if it triggers (make sure to use a debug build... or
&gt; &gt; make it something nastier than assert), and get a backtrace from gdb? (Or
&gt; &gt; actually just set a breakpoint on that line and see if gdb hits it...)
&gt; 
&gt; No, I tried  to add assert :
&gt; 
&gt; diff --git a/src/gallium/drivers/nouveau/nv50/nv50_query.c
&gt; b/src/gallium/drivers/nouveau/nv50/nv50_query.c
&gt; index a373dc6..23f5eaf 100644
&gt; --- a/src/gallium/drivers/nouveau/nv50/nv50_query.c
&gt; +++ b/src/gallium/drivers/nouveau/nv50/nv50_query.c
&gt; &#64;&#64; -222,6 +222,7 &#64;&#64; nv50_query_end(struct pipe_context *pipe, struct
&gt; pipe_query *pq)
&gt;        break;
&gt;     case PIPE_QUERY_GPU_FINISHED:
&gt;        q-&gt;sequence++;
&gt; +      assert(0);
&gt;        nv50_query_get(push, q, 0, 0x1000f010);
&gt;        break;
&gt;     case NVA0_QUERY_STREAM_OUTPUT_BUFFER_OFFSET:
&gt; 
&gt; on top of mesa-git-454aab4 and it doesn't trigger  during mplayer's run
&gt; (resulted in usual hang).</span >

Can you confirm that you built this with --enable-debug? And you saw the
0x1000f010 value in your dmesg?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409702628.EB1d62.17045--

--===============1362863337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1362863337==--

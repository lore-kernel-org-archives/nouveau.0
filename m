From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58087] [-next] nouveau corrupts kernel mm allocator
Date: Wed, 12 Dec 2012 21:14:33 +0000
Message-ID: <bug-58087-8800-hYNicyhfGu@http.bugs.freedesktop.org/>
References: <bug-58087-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1312685936=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58087-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1312685936==
Content-Type: multipart/alternative; boundary="1355346873.180DD6D31.17145"; charset="us-ascii"


--1355346873.180DD6D31.17145
Date: Wed, 12 Dec 2012 21:14:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58087

--- Comment #2 from Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> ---
(In reply to comment #1)
> Created attachment 71290 [details] [review]
> fix

-    vm = *pvm = kzalloc(sizeof(*vm), GFP_KERNEL);
+    vm = kzalloc(sizeof(*vm), GFP_KERNEL);

How/why *not* setting cli->base.vm to NULL fixes this?

Also, this assignment idiom is common in the nouveau driver code. Is the above
fix just one of many necessary?

core/subdev/vm/base.c:    vm = *pvm = kzalloc(sizeof(*vm), GFP_KERNEL);
core/core/object.c:    object = *pobject = kzalloc(size, GFP_KERNEL);
core/core/ramht.c:    co = ho = nouveau_ramht_hash(ramht, chid, handle);
core/core/handle.c:    handle = *phandle = kzalloc(sizeof(*handle),
GFP_KERNEL);
nouveau_abi16.c:        cli->abi16 = abi16 = kzalloc(sizeof(*abi16),
GFP_KERNEL);
nouveau_bo.c:    struct nouveau_channel *chan = chan = drm->channel;  /*
COMMENT: THIS ONE IS INTERESTING */
nouveau_chan.c:    chan = *pchan = kzalloc(sizeof(*chan), GFP_KERNEL);
nouveau_display.c:    disp = drm->display = kzalloc(sizeof(*disp), GFP_KERNEL);
nouveau_pm.c:    pm = drm->pm = kzalloc(sizeof(*pm), GFP_KERNEL);
nv04_fence.c:    priv = drm->fence = kzalloc(sizeof(*priv), GFP_KERNEL);
nv10_fence.c:    fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
nv10_fence.c:    priv = drm->fence = kzalloc(sizeof(*priv), GFP_KERNEL);
nv50_fence.c:    fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
nv50_fence.c:    priv = drm->fence = kzalloc(sizeof(*priv), GFP_KERNEL);
nv84_fence.c:    fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
nv84_fence.c:    priv = drm->fence = kzalloc(sizeof(*priv), GFP_KERNEL);
nvc0_fence.c:    fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
nvc0_fence.c:    priv = drm->fence = kzalloc(sizeof(*priv), GFP_KERNEL);

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355346873.180DD6D31.17145
Date: Wed, 12 Dec 2012 21:14:33 +0000
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
   title="NEW --- - [-next] nouveau corrupts kernel mm allocator"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58087#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [-next] nouveau corrupts kernel mm allocator"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58087">bug 58087</a>
              from <span class="vcard"><a class="email" href="mailto:peter&#64;hurleysoftware.com" title="Peter Hurley &lt;peter&#64;hurleysoftware.com&gt;"> <span class="fn">Peter Hurley</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58087#c1">comment #1</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=71290" name="attach_71290" title="fix">attachment 71290</a> <a href="attachment.cgi?id=71290&amp;action=edit" title="fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=58087&amp;attachment=71290'>[review]</a> [review]
&gt; fix</span >

-    vm = *pvm = kzalloc(sizeof(*vm), GFP_KERNEL);
+    vm = kzalloc(sizeof(*vm), GFP_KERNEL);

How/why *not* setting cli-&gt;base.vm to NULL fixes this?

Also, this assignment idiom is common in the nouveau driver code. Is the above
fix just one of many necessary?

core/subdev/vm/base.c:    vm = *pvm = kzalloc(sizeof(*vm), GFP_KERNEL);
core/core/object.c:    object = *pobject = kzalloc(size, GFP_KERNEL);
core/core/ramht.c:    co = ho = nouveau_ramht_hash(ramht, chid, handle);
core/core/handle.c:    handle = *phandle = kzalloc(sizeof(*handle),
GFP_KERNEL);
nouveau_abi16.c:        cli-&gt;abi16 = abi16 = kzalloc(sizeof(*abi16),
GFP_KERNEL);
nouveau_bo.c:    struct nouveau_channel *chan = chan = drm-&gt;channel;  /*
COMMENT: THIS ONE IS INTERESTING */
nouveau_chan.c:    chan = *pchan = kzalloc(sizeof(*chan), GFP_KERNEL);
nouveau_display.c:    disp = drm-&gt;display = kzalloc(sizeof(*disp), GFP_KERNEL);
nouveau_pm.c:    pm = drm-&gt;pm = kzalloc(sizeof(*pm), GFP_KERNEL);
nv04_fence.c:    priv = drm-&gt;fence = kzalloc(sizeof(*priv), GFP_KERNEL);
nv10_fence.c:    fctx = chan-&gt;fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
nv10_fence.c:    priv = drm-&gt;fence = kzalloc(sizeof(*priv), GFP_KERNEL);
nv50_fence.c:    fctx = chan-&gt;fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
nv50_fence.c:    priv = drm-&gt;fence = kzalloc(sizeof(*priv), GFP_KERNEL);
nv84_fence.c:    fctx = chan-&gt;fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
nv84_fence.c:    priv = drm-&gt;fence = kzalloc(sizeof(*priv), GFP_KERNEL);
nvc0_fence.c:    fctx = chan-&gt;fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
nvc0_fence.c:    priv = drm-&gt;fence = kzalloc(sizeof(*priv), GFP_KERNEL);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355346873.180DD6D31.17145--

--===============1312685936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1312685936==--

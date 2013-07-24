From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Wed, 24 Jul 2013 09:02:05 +0000
Message-ID: <bug-54700-8800-NtjWYSbbBN@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0450550870=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0450550870==
Content-Type: multipart/alternative; boundary="1374656525.bEDbc5c1.21322"; charset="us-ascii"


--1374656525.bEDbc5c1.21322
Date: Wed, 24 Jul 2013 09:02:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #34 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi Emil (just for you because not really intersting for the bucg tracker) 

I can try what you ask this week end (than I will be on vacation for 15 days
without internet).

Some questions

> As mentioned it seems like the tiling (pitch) is misset by ~64 (after a quick
> look at the attached picture)

I'll look around for a doc to understand what you're saying...

> Can you do try and establish if the issue happens in or outside of X, and in
> which cases

what do you mean by outside X? Framebuffer terminal seemed ok, how can I show a
graphic without X?

>i.e. in X only when drawing an image of dimensions x1 & y1, or
> less than x2 & greater than y2

You mean rescaling a single image or showing images of different pixel size?

And you really mean drawing (e.g. with office draw) or just showing existing
images?

> Meanwhile I'll prep some debug patches (note you may need to rebuild
> xf86-video-nouveau, libdrm and/or nouveau) :)

Just explain me what to do and I'll do it, I'm happy to help.

Cheers
ric


On 2013-07-24 02:55:04 bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org wrote:
> https://bugs.freedesktop.org/show_bug.cgi?id=54700
> 
> --- Comment #33 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> Unfortunately the blob (proprietary driver) does not provide any useful
> information in these logs.
> 
> As mentioned it seems like the tiling (pitch) is misset by ~64 (after a quick
> look at the attached picture)
> 
> Can you do try and establish if the issue happens in or outside of X, and in
> which cases - i.e. in X only when drawing an image of dimensions x1 & y1, or
> less than x2 & greater than y2
> 
> Meanwhile I'll prep some debug patches (note you may need to rebuild
> xf86-video-nouveau, libdrm and/or nouveau) :)
> 
>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374656525.bEDbc5c1.21322
Date: Wed, 24 Jul 2013 09:02:05 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>Hi Emil (just for you because not really intersting for the bucg tracker) 

I can try what you ask this week end (than I will be on vacation for 15 days
without internet).

Some questions

<span class="quote">&gt; As mentioned it seems like the tiling (pitch) is misset by ~64 (after a quick
&gt; look at the attached picture)</span >

I'll look around for a doc to understand what you're saying...

<span class="quote">&gt; Can you do try and establish if the issue happens in or outside of X, and in
&gt; which cases</span >

what do you mean by outside X? Framebuffer terminal seemed ok, how can I show a
graphic without X?

<span class="quote">&gt;i.e. in X only when drawing an image of dimensions x1 &amp; y1, or
&gt; less than x2 &amp; greater than y2</span >

You mean rescaling a single image or showing images of different pixel size?

And you really mean drawing (e.g. with office draw) or just showing existing
images?

<span class="quote">&gt; Meanwhile I'll prep some debug patches (note you may need to rebuild
&gt; xf86-video-nouveau, libdrm and/or nouveau) :)</span >

Just explain me what to do and I'll do it, I'm happy to help.

Cheers
ric


On 2013-07-24 02:55:04 <a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a> wrote:
<span class="quote">&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="show_bug.cgi?id=54700">https://bugs.freedesktop.org/show_bug.cgi?id=54700</a>
&gt; 
&gt; --- <a href="show_bug.cgi?id=54700#c33">Comment #33</a> from Emil Velikov &lt;<a href="mailto:emil.l.velikov&#64;gmail.com">emil.l.velikov&#64;gmail.com</a>&gt; ---
&gt; Unfortunately the blob (proprietary driver) does not provide any useful
&gt; information in these logs.
&gt; 
&gt; As mentioned it seems like the tiling (pitch) is misset by ~64 (after a quick
&gt; look at the attached picture)
&gt; 
&gt; Can you do try and establish if the issue happens in or outside of X, and in
&gt; which cases - i.e. in X only when drawing an image of dimensions x1 &amp; y1, or
&gt; less than x2 &amp; greater than y2
&gt; 
&gt; Meanwhile I'll prep some debug patches (note you may need to rebuild
&gt; xf86-video-nouveau, libdrm and/or nouveau) :)
&gt; </span >
&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374656525.bEDbc5c1.21322--

--===============0450550870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0450550870==--

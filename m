From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92306] GL Excess demo renders incorrectly on nv43
Date: Tue, 13 Oct 2015 06:29:01 +0000
Message-ID: <bug-92306-8800-XMIzJ8S5VG@http.bugs.freedesktop.org/>
References: <bug-92306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1621214309=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1621214309==
Content-Type: multipart/alternative; boundary="1444717741.637ba1.4869"; charset="UTF-8"


--1444717741.637ba1.4869
Date: Tue, 13 Oct 2015 06:29:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92306

--- Comment #17 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #14)
> (In reply to Andrew Randrianasulu from comment #13)
> > (In reply to Ilia Mirkin from comment #12)
> > > (In reply to Andrew Randrianasulu from comment #11)
> > > > "Mismatched color and zeta formats, ignoring zeta."
> > > 
> > > Yeah, as I suspected... unfortunately there's not a ton you can do besides
> > > fixing the issue. The problem is that you can't render to a 32-bit color
> > > format (e.g. RGBA8) while using a 16-bit zeta (Z16), and conversely you
> > > can't render to a 16-bit color format (e.g. RGB565) while using a 32-bit
> > > zeta (Z24S8).
> > > 
> > > My current solution to this problem is to just not set the zeta buffer and
> > > move on with life. This leads to incorrect rendering, but at least no hangs.
> > > 
> > > The proper solution is to have 2 depth textures that you copy to and fro and
> > > set the "right" one for the given color format. Ideally while minimizing the
> > > number of copies.
> > 
> > Hm, but in my case it apparently worked fine... so, may be check is
> > overrestrictive?
> > 
> > I also tried to apply this path on top of mesa version indicated above
> > ((git-93161be)
> > 
> > ----patch---
> > diff --git a/src/gallium/drivers/nouveau/nv30/nv30_state.c
> > b/src/gallium/drivers/nouveau/nv30/nv30_state.c
> > index fd604c2..cceedfd 100644
> > --- a/src/gallium/drivers/nouveau/nv30/nv30_state.c
> > +++ b/src/gallium/drivers/nouveau/nv30/nv30_state.c
> > @@ -382,7 +382,7 @@ nv30_set_framebuffer_state(struct pipe_context *pipe,
> >             (util_format_get_blocksize(fb->zsbuf->format) > 2) !=
> >             (util_format_get_blocksize(fb->cbufs[0]->format) > 2)) {
> >            nv30->framebuffer.zsbuf = NULL;
> > -          debug_printf("Mismatched color and zeta formats, ignoring
> > zeta.\n");
> > +          debug_printf("Mismatched color %d and zeta %d formats, ignoring
> > zeta.\n", fb->cbufs[0]->format, fb->zsbuf->format);
> >         }
> >      }
> >  }
> > --------end-----
> > 
> > and got this in terminal:
> > "Mismatched color 1 and zeta 16 formats, ignoring zeta."
> > 
> > This is a bit strange, this demo from ~2002 era, and apparently was  working
> > fine on older nvidia hardware. And on nouveau, until this  commit.  I will
> > retest just for making sure it doesn't flood my dmesg with errors ....
> 
> You should be seeing errors about invalid values in dmesg for 0208 or some
> similar method. I'm guessing that the zeta buffer is used in such a way that
> things happen to work out, but the card doesn't really support it.
> 
> src/gallium/include/pipe/p_format.h:   PIPE_FORMAT_B8G8R8A8_UNORM          =
> 1,
> src/gallium/include/pipe/p_format.h:   PIPE_FORMAT_Z16_UNORM               =
> 16,
> 
> Not a valid combo, AFAIK.

I believe that restriction might only apply to swizzled surfaces.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444717741.637ba1.4869
Date: Tue, 13 Oct 2015 06:29:01 +0000
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
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306">bug 92306</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92306#c14">comment #14</a>)
<span class="quote">&gt; (In reply to Andrew Randrianasulu from <a href="show_bug.cgi?id=92306#c13">comment #13</a>)
&gt; &gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92306#c12">comment #12</a>)
&gt; &gt; &gt; (In reply to Andrew Randrianasulu from <a href="show_bug.cgi?id=92306#c11">comment #11</a>)
&gt; &gt; &gt; &gt; &quot;Mismatched color and zeta formats, ignoring zeta.&quot;
&gt; &gt; &gt; 
&gt; &gt; &gt; Yeah, as I suspected... unfortunately there's not a ton you can do besides
&gt; &gt; &gt; fixing the issue. The problem is that you can't render to a 32-bit color
&gt; &gt; &gt; format (e.g. RGBA8) while using a 16-bit zeta (Z16), and conversely you
&gt; &gt; &gt; can't render to a 16-bit color format (e.g. RGB565) while using a 32-bit
&gt; &gt; &gt; zeta (Z24S8).
&gt; &gt; &gt; 
&gt; &gt; &gt; My current solution to this problem is to just not set the zeta buffer and
&gt; &gt; &gt; move on with life. This leads to incorrect rendering, but at least no hangs.
&gt; &gt; &gt; 
&gt; &gt; &gt; The proper solution is to have 2 depth textures that you copy to and fro and
&gt; &gt; &gt; set the &quot;right&quot; one for the given color format. Ideally while minimizing the
&gt; &gt; &gt; number of copies.
&gt; &gt; 
&gt; &gt; Hm, but in my case it apparently worked fine... so, may be check is
&gt; &gt; overrestrictive?
&gt; &gt; 
&gt; &gt; I also tried to apply this path on top of mesa version indicated above
&gt; &gt; ((git-93161be)
&gt; &gt; 
&gt; &gt; ----patch---
&gt; &gt; diff --git a/src/gallium/drivers/nouveau/nv30/nv30_state.c
&gt; &gt; b/src/gallium/drivers/nouveau/nv30/nv30_state.c
&gt; &gt; index fd604c2..cceedfd 100644
&gt; &gt; --- a/src/gallium/drivers/nouveau/nv30/nv30_state.c
&gt; &gt; +++ b/src/gallium/drivers/nouveau/nv30/nv30_state.c
&gt; &gt; &#64;&#64; -382,7 +382,7 &#64;&#64; nv30_set_framebuffer_state(struct pipe_context *pipe,
&gt; &gt;             (util_format_get_blocksize(fb-&gt;zsbuf-&gt;format) &gt; 2) !=
&gt; &gt;             (util_format_get_blocksize(fb-&gt;cbufs[0]-&gt;format) &gt; 2)) {
&gt; &gt;            nv30-&gt;framebuffer.zsbuf = NULL;
&gt; &gt; -          debug_printf(&quot;Mismatched color and zeta formats, ignoring
&gt; &gt; zeta.\n&quot;);
&gt; &gt; +          debug_printf(&quot;Mismatched color %d and zeta %d formats, ignoring
&gt; &gt; zeta.\n&quot;, fb-&gt;cbufs[0]-&gt;format, fb-&gt;zsbuf-&gt;format);
&gt; &gt;         }
&gt; &gt;      }
&gt; &gt;  }
&gt; &gt; --------end-----
&gt; &gt; 
&gt; &gt; and got this in terminal:
&gt; &gt; &quot;Mismatched color 1 and zeta 16 formats, ignoring zeta.&quot;
&gt; &gt; 
&gt; &gt; This is a bit strange, this demo from ~2002 era, and apparently was  working
&gt; &gt; fine on older nvidia hardware. And on nouveau, until this  commit.  I will
&gt; &gt; retest just for making sure it doesn't flood my dmesg with errors ....
&gt; 
&gt; You should be seeing errors about invalid values in dmesg for 0208 or some
&gt; similar method. I'm guessing that the zeta buffer is used in such a way that
&gt; things happen to work out, but the card doesn't really support it.
&gt; 
&gt; src/gallium/include/pipe/p_format.h:   PIPE_FORMAT_B8G8R8A8_UNORM          =
&gt; 1,
&gt; src/gallium/include/pipe/p_format.h:   PIPE_FORMAT_Z16_UNORM               =
&gt; 16,
&gt; 
&gt; Not a valid combo, AFAIK.</span >

I believe that restriction might only apply to swizzled surfaces.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444717741.637ba1.4869--

--===============1621214309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1621214309==--

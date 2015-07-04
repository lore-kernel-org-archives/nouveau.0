From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91171] Space Rangers 2 (in Wine) shows only black
	screen
Date: Sat, 04 Jul 2015 20:23:05 +0000
Message-ID: <bug-91171-8800-C3uV5zwJcz@http.bugs.freedesktop.org/>
References: <bug-91171-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0333990941=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91171-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0333990941==
Content-Type: multipart/alternative; boundary="1436041384.Bc8D5F412.29347"; charset="UTF-8"


--1436041384.Bc8D5F412.29347
Date: Sat, 4 Jul 2015 20:23:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91171

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Ah yeah, nouveau fails pretty substantially at multiple concurrent GL contexts
used simultaneously from different threads (this is a nouveau shortcoming, not
a mesa one). Multiple contexts that are switched around with glXMakeCurrent
from a single thread should operate fine though.

Indeed looking at the trace, I see

79407 glBindFramebuffer(target = GL_DRAW_FRAMEBUFFER, framebuffer = 0)
79409 glReadBuffer(mode = GL_COLOR_ATTACHMENT0)
79412 glDrawBuffer(mode = GL_FRONT)
79417 glBlitFramebuffer(srcX0 = 0, srcY0 = 0, srcX1 = 1024, srcY1 = 768, dstX0
= 0, dstY0 = 768, dstX1 = 1024, dstY1 = 0, mask = 
GL_COLOR_BUFFER_BIT, filter = GL_NEAREST)
79419 glFlush()

followed immediately by creating a (actually two!) new contexts, and discarding
the old stuff. [Looks like it does both glXCreateContext *and*
glXCreateContextAttribsARB, and discards the first one of those.]

I was looking over what flush did, and it does indeed explicitly flush the
frontbuffer to screen if it's the current drawbuffer. [or something along those
lines]. Tracing through that flow, it's entirely over my head... interactions
between multiple modules of which I know nothing. I don't see anywhere where
it'd be waiting for that blit to complete either, but that doesn't mean it's
not there. Perhaps this should be a glFinish()?

I'm afraid this will have to wait for someone to understand what the issue is
before it can be fixed.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436041384.Bc8D5F412.29347
Date: Sat, 4 Jul 2015 20:23:04 +0000
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
   title="NEW - Space Rangers 2 (in Wine) shows only black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91171#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Space Rangers 2 (in Wine) shows only black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91171">bug 91171</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Ah yeah, nouveau fails pretty substantially at multiple concurrent GL contexts
used simultaneously from different threads (this is a nouveau shortcoming, not
a mesa one). Multiple contexts that are switched around with glXMakeCurrent
from a single thread should operate fine though.

Indeed looking at the trace, I see

79407 glBindFramebuffer(target = GL_DRAW_FRAMEBUFFER, framebuffer = 0)
79409 glReadBuffer(mode = GL_COLOR_ATTACHMENT0)
79412 glDrawBuffer(mode = GL_FRONT)
79417 glBlitFramebuffer(srcX0 = 0, srcY0 = 0, srcX1 = 1024, srcY1 = 768, dstX0
= 0, dstY0 = 768, dstX1 = 1024, dstY1 = 0, mask = 
GL_COLOR_BUFFER_BIT, filter = GL_NEAREST)
79419 glFlush()

followed immediately by creating a (actually two!) new contexts, and discarding
the old stuff. [Looks like it does both glXCreateContext *and*
glXCreateContextAttribsARB, and discards the first one of those.]

I was looking over what flush did, and it does indeed explicitly flush the
frontbuffer to screen if it's the current drawbuffer. [or something along those
lines]. Tracing through that flow, it's entirely over my head... interactions
between multiple modules of which I know nothing. I don't see anywhere where
it'd be waiting for that blit to complete either, but that doesn't mean it's
not there. Perhaps this should be a glFinish()?

I'm afraid this will have to wait for someone to understand what the issue is
before it can be fixed.</pre>
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

--1436041384.Bc8D5F412.29347--

--===============0333990941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0333990941==--

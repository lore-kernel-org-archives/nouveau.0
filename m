From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73459] nv10 get_rt_format: Assertion `0' failed.
Date: Fri, 10 Jan 2014 06:57:48 +0000
Message-ID: <bug-73459-8800-Y4AeRo0A9L@http.bugs.freedesktop.org/>
References: <bug-73459-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2137607959=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73459-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2137607959==
Content-Type: multipart/alternative; boundary="1389337068.cFA551.27510"; charset="us-ascii"


--1389337068.cFA551.27510
Date: Fri, 10 Jan 2014 06:57:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73459

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, 32855 corresponds to GL_RGB5_A1. And mesa format 16 corresponds to
MESA_FORMAT_ARGB1555, which isn't one of the supported render target formats.
So that's all good. (So to speak.) Although it _is_ a supported texture format.

But I'm guessing there should be some logic somewhere that errors that out or
creates some sort of conversion thing. Or glFramebufferTexture2D should fail.

Looking at the code, _mesa_FramebufferTexture2D calls framebuffer_texture,
which in turn checks a few things about the params but never calls out to the
driver, and then just sets the attachment. And all the completeness stuff
largely ignores this stuff. I don't see how the driver is supposed to refuse...
maybe it has to be done a different way.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389337068.cFA551.27510
Date: Fri, 10 Jan 2014 06:57:48 +0000
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
   title="NEW --- - nv10 get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73459#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv10 get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73459">bug 73459</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, 32855 corresponds to GL_RGB5_A1. And mesa format 16 corresponds to
MESA_FORMAT_ARGB1555, which isn't one of the supported render target formats.
So that's all good. (So to speak.) Although it _is_ a supported texture format.

But I'm guessing there should be some logic somewhere that errors that out or
creates some sort of conversion thing. Or glFramebufferTexture2D should fail.

Looking at the code, _mesa_FramebufferTexture2D calls framebuffer_texture,
which in turn checks a few things about the params but never calls out to the
driver, and then just sets the attachment. And all the completeness stuff
largely ignores this stuff. I don't see how the driver is supposed to refuse...
maybe it has to be done a different way.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389337068.cFA551.27510--

--===============2137607959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2137607959==--

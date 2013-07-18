From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Thu, 18 Jul 2013 22:25:25 +0000
Message-ID: <bug-67051-8800-PqHgFYK7Rt@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0662576806=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0662576806==
Content-Type: multipart/alternative; boundary="1374186325.80adDAA1.4691"; charset="us-ascii"


--1374186325.80adDAA1.4691
Date: Thu, 18 Jul 2013 22:25:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There shouldn't be anything in the DDX that affects HDMI audio (or, indeed,
HDMI). All modesetting is done by the kernel ("KMS"), and that includes setting
up all the proper audio stuff.

So... two questions that I don't feel were fully answered:

(a) Does HDMI video work fine with nouveau in the kernels that you've tried?

(b) Can you test out a 3.7-based kernel (3.7.x should all be fine for this
exercise, the "refactor" patches are generally not backported into the stable
series) and see if HDMI audio works there?

And a fresh question:

(c) Can you try unplugging and then re-plugging the HDMI cable after the
computer is all booted up and check the ELD status then? There's an old bug
that alludes to a timing issue between nvidia and alsa loading, and I have no
idea if it's fixed (bug #32406).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374186325.80adDAA1.4691
Date: Thu, 18 Jul 2013 22:25:25 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There shouldn't be anything in the DDX that affects HDMI audio (or, indeed,
HDMI). All modesetting is done by the kernel (&quot;KMS&quot;), and that includes setting
up all the proper audio stuff.

So... two questions that I don't feel were fully answered:

(a) Does HDMI video work fine with nouveau in the kernels that you've tried?

(b) Can you test out a 3.7-based kernel (3.7.x should all be fine for this
exercise, the &quot;refactor&quot; patches are generally not backported into the stable
series) and see if HDMI audio works there?

And a fresh question:

(c) Can you try unplugging and then re-plugging the HDMI cable after the
computer is all booted up and check the ELD status then? There's an old bug
that alludes to a timing issue between nvidia and alsa loading, and I have no
idea if it's fixed (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau fails to send hotplug event to ALSA hda hdmi audio"
   href="show_bug.cgi?id=32406">bug #32406</a>).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374186325.80adDAA1.4691--

--===============0662576806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0662576806==--

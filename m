From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75464] [nv4e] [vdpau] causes hangs
Date: Mon, 24 Feb 2014 20:03:38 +0000
Message-ID: <bug-75464-8800-kBArC4egNy@http.bugs.freedesktop.org/>
References: <bug-75464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0454841082=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75464-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0454841082==
Content-Type: multipart/alternative; boundary="1393272218.Ad2e02.25666"; charset="us-ascii"


--1393272218.Ad2e02.25666
Date: Mon, 24 Feb 2014 20:03:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75464

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think the right move here is to just disable nv4x in vdpau entirely until
somehow has time to take a look at what's going on. VDPAU doesn't provide hw
decoding for nv4x anyways at this point, and the presentation stuff isn't
_that_ useful when you don't have the video decoding bits.

Unfortunately I'm not quite sure how to do that... should
vdpau-nouveau/target.c look at the returned screen, cast it to a nouveau_screen
and check the chipset? Not sure if that'd be considered an abstraction
violation. Also unsure what one could add to st/vdpau for this, as nv4x
_should_ be able to support the presentation bits of vdpau, it just... doesn't.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393272218.Ad2e02.25666
Date: Mon, 24 Feb 2014 20:03:38 +0000
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
   title="NEW --- - [nv4e] [vdpau] causes hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75464#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv4e] [vdpau] causes hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75464">bug 75464</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think the right move here is to just disable nv4x in vdpau entirely until
somehow has time to take a look at what's going on. VDPAU doesn't provide hw
decoding for nv4x anyways at this point, and the presentation stuff isn't
_that_ useful when you don't have the video decoding bits.

Unfortunately I'm not quite sure how to do that... should
vdpau-nouveau/target.c look at the returned screen, cast it to a nouveau_screen
and check the chipset? Not sure if that'd be considered an abstraction
violation. Also unsure what one could add to st/vdpau for this, as nv4x
_should_ be able to support the presentation bits of vdpau, it just... doesn't.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393272218.Ad2e02.25666--

--===============0454841082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0454841082==--

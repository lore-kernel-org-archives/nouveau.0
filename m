From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73200] vdpau-GL interop fails due to different
	screen objects
Date: Wed, 01 Jan 2014 06:34:55 +0000
Message-ID: <bug-73200-8800-ICDfPxD203@http.bugs.freedesktop.org/>
References: <bug-73200-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1035423545=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73200-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1035423545==
Content-Type: multipart/alternative; boundary="1388558094.5Fd4FCC1.4364"; charset="us-ascii"


--1388558094.5Fd4FCC1.4364
Date: Wed, 1 Jan 2014 06:34:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73200

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
It would help if you attached a sample app that shows the failure. I don't
think there are any NV_vdpau_interop piglit tests.

Something needs to be done in the src/gallium/targets/*-nouveau/* logic. Radeon
(somehow, I haven't traced it all through yet) seems to use
auxiliary/vl/vl_winsys_dri.c. Nouveau has a drm_configuration for dri-nouveau
but not vdpau-nouveau -- perhaps that needs to be copied over as well? I have
no idea what it does, but it has something about sharing fd's in the code --
could be relevant to the problem at hand.

[Frankly I'm not entirely sure how this is supposed to work given megadrivers,
but I'm sure it's just a lack of understanding on my part rather than a
shortcoming of the system.]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388558094.5Fd4FCC1.4364
Date: Wed, 1 Jan 2014 06:34:54 +0000
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
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200">bug 73200</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>It would help if you attached a sample app that shows the failure. I don't
think there are any NV_vdpau_interop piglit tests.

Something needs to be done in the src/gallium/targets/*-nouveau/* logic. Radeon
(somehow, I haven't traced it all through yet) seems to use
auxiliary/vl/vl_winsys_dri.c. Nouveau has a drm_configuration for dri-nouveau
but not vdpau-nouveau -- perhaps that needs to be copied over as well? I have
no idea what it does, but it has something about sharing fd's in the code --
could be relevant to the problem at hand.

[Frankly I'm not entirely sure how this is supposed to work given megadrivers,
but I'm sure it's just a lack of understanding on my part rather than a
shortcoming of the system.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388558094.5Fd4FCC1.4364--

--===============1035423545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1035423545==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74195] [NVCE] Responsivity to input with vsync on is
 slower after update
Date: Wed, 29 Jan 2014 22:38:47 +0000
Message-ID: <bug-74195-8800-z7LdF8OBzM@http.bugs.freedesktop.org/>
References: <bug-74195-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0181566136=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74195-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0181566136==
Content-Type: multipart/alternative; boundary="1391035126.BE6FA72.18173"; charset="us-ascii"


--1391035126.BE6FA72.18173
Date: Wed, 29 Jan 2014 22:38:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74195

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Actually the current code handles the intr == ~0 bit. The only other thing of
mild consequence is that drm_device->irq_enabled is no longer set.

Can you try adding

dev->irq_enabled = true;

to nouveau_drm.c:nouveau_drm_load somewhere after things look like they
succeed? Or perhaps right before the nouveau_display_create, where it was
before the patch. [And in an ideal world, one would also set it to false at
some point, e.g. nouveau_drm_unload, but I doubt that's important for this
experiment.]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391035126.BE6FA72.18173
Date: Wed, 29 Jan 2014 22:38:46 +0000
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
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195">bug 74195</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Actually the current code handles the intr == ~0 bit. The only other thing of
mild consequence is that drm_device-&gt;irq_enabled is no longer set.

Can you try adding

dev-&gt;irq_enabled = true;

to nouveau_drm.c:nouveau_drm_load somewhere after things look like they
succeed? Or perhaps right before the nouveau_display_create, where it was
before the patch. [And in an ideal world, one would also set it to false at
some point, e.g. nouveau_drm_unload, but I doubt that's important for this
experiment.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391035126.BE6FA72.18173--

--===============0181566136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0181566136==--

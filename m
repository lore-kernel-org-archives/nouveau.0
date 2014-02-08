From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54587] [NV1F] Flickering screen on Geforece 4
Date: Sat, 08 Feb 2014 13:57:22 +0000
Message-ID: <bug-54587-8800-3dIG3MSzMp@http.bugs.freedesktop.org/>
References: <bug-54587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0925099713=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54587-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0925099713==
Content-Type: multipart/alternative; boundary="1391867842.231DbF7B2.3255"; charset="us-ascii"


--1391867842.231DbF7B2.3255
Date: Sat, 8 Feb 2014 13:57:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54587

--- Comment #25 from Vesa <piip-O5WfVfzUwx8@public.gmane.org> ---
There is no digital connector available. This is ten years old mother board
with integrated graphic adapter :)

Adding video=TV-1:d removes most of the interference.

At 1920x1080 (monitor native resolution) there are still some odd lines here
and there, moving a mouse increases interference and moving a window makes the
screen very wild. I am not sure where I got this resolution, maybe from
nvidia's driver.

At 1024x768 the screen is stable if mouse is not moved, moving a window causes
interference, a few lines at the top of the screen are missing.

At 800x600 the screen is stable even when moving a mouse, moving a window
causes some odd lines to appear.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391867842.231DbF7B2.3255
Date: Sat, 8 Feb 2014 13:57:22 +0000
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
   title="NEW --- - [NV1F] Flickering screen on Geforece 4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54587#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1F] Flickering screen on Geforece 4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54587">bug 54587</a>
              from <span class="vcard"><a class="email" href="mailto:piip&#64;mail.com" title="Vesa &lt;piip&#64;mail.com&gt;"> <span class="fn">Vesa</span></a>
</span></b>
        <pre>There is no digital connector available. This is ten years old mother board
with integrated graphic adapter :)

Adding video=TV-1:d removes most of the interference.

At 1920x1080 (monitor native resolution) there are still some odd lines here
and there, moving a mouse increases interference and moving a window makes the
screen very wild. I am not sure where I got this resolution, maybe from
nvidia's driver.

At 1024x768 the screen is stable if mouse is not moved, moving a window causes
interference, a few lines at the top of the screen are missing.

At 800x600 the screen is stable even when moving a mouse, moving a window
causes some odd lines to appear.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391867842.231DbF7B2.3255--

--===============0925099713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0925099713==--

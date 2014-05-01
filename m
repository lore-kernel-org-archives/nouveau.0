From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Thu, 01 May 2014 07:35:14 +0000
Message-ID: <bug-78092-8800-Ewi97bCgoT@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0562897639=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0562897639==
Content-Type: multipart/alternative; boundary="1398929713.2E010.4558"; charset="us-ascii"


--1398929713.2E010.4558
Date: Thu, 1 May 2014 07:35:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #18 from Anton Gubarkov <anton.gubarkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
A full restart gives me 2 providers finally. Issue closed. Root cause = missing
CONFIG_VGA_SWITCHEROO.
stats from glxshperes:


anton@2349-pb8edcn ~ $ DRI_PRIME=1 glxspheres
Polygons in scene: 62464
Visual ID of window: 0x60
Context is Direct
OpenGL Renderer: Mesa DRI Intel(R) Haswell Mobile 
389.730071 frames/sec - 434.938759 Mpixels/sec
313.258202 frames/sec - 349.596154 Mpixels/sec
315.264621 frames/sec - 351.835317 Mpixels/sec
312.586974 frames/sec - 348.847063 Mpixels/sec
313.750305 frames/sec - 350.145340 Mpixels/sec
310.040738 frames/sec - 346.005464 Mpixels/sec
252.324787 frames/sec - 434.635791 Mpixels/sec
142.339972 frames/sec - 617.778255 Mpixels/sec

anton@2349-pb8edcn ~ $ DRI_PRIME=0 glxspheres
Polygons in scene: 62464
Visual ID of window: 0x60
Context is Direct
OpenGL Renderer: Mesa DRI Intel(R) Haswell Mobile 
61.427659 frames/sec - 68.553267 Mpixels/sec
59.934683 frames/sec - 66.887106 Mpixels/sec
59.953323 frames/sec - 66.907908 Mpixels/sec
59.984469 frames/sec - 66.942667 Mpixels/sec
59.952780 frames/sec - 66.907303 Mpixels/sec
59.972983 frames/sec - 66.929849 Mpixels/sec
59.970282 frames/sec - 66.926834 Mpixels/sec
59.969874 frames/sec - 66.926380 Mpixels/sec

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398929713.2E010.4558
Date: Thu, 1 May 2014 07:35:13 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:anton.gubarkov&#64;gmail.com" title="Anton Gubarkov &lt;anton.gubarkov&#64;gmail.com&gt;"> <span class="fn">Anton Gubarkov</span></a>
</span></b>
        <pre>A full restart gives me 2 providers finally. Issue closed. Root cause = missing
CONFIG_VGA_SWITCHEROO.
stats from glxshperes:


anton&#64;2349-pb8edcn ~ $ DRI_PRIME=1 glxspheres
Polygons in scene: 62464
Visual ID of window: 0x60
Context is Direct
OpenGL Renderer: Mesa DRI Intel(R) Haswell Mobile 
389.730071 frames/sec - 434.938759 Mpixels/sec
313.258202 frames/sec - 349.596154 Mpixels/sec
315.264621 frames/sec - 351.835317 Mpixels/sec
312.586974 frames/sec - 348.847063 Mpixels/sec
313.750305 frames/sec - 350.145340 Mpixels/sec
310.040738 frames/sec - 346.005464 Mpixels/sec
252.324787 frames/sec - 434.635791 Mpixels/sec
142.339972 frames/sec - 617.778255 Mpixels/sec

anton&#64;2349-pb8edcn ~ $ DRI_PRIME=0 glxspheres
Polygons in scene: 62464
Visual ID of window: 0x60
Context is Direct
OpenGL Renderer: Mesa DRI Intel(R) Haswell Mobile 
61.427659 frames/sec - 68.553267 Mpixels/sec
59.934683 frames/sec - 66.887106 Mpixels/sec
59.953323 frames/sec - 66.907908 Mpixels/sec
59.984469 frames/sec - 66.942667 Mpixels/sec
59.952780 frames/sec - 66.907303 Mpixels/sec
59.972983 frames/sec - 66.929849 Mpixels/sec
59.970282 frames/sec - 66.926834 Mpixels/sec
59.969874 frames/sec - 66.926380 Mpixels/sec</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398929713.2E010.4558--

--===============0562897639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0562897639==--

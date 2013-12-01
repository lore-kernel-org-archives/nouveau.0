From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Sun, 01 Dec 2013 17:01:32 +0000
Message-ID: <bug-64323-8800-J2S3mVbahH@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2131256498=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64323-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2131256498==
Content-Type: multipart/alternative; boundary="1385917293.34F06A754.1204"; charset="us-ascii"


--1385917293.34F06A754.1204
Date: Sun, 1 Dec 2013 17:01:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

--- Comment #25 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 90056
  --> https://bugs.freedesktop.org/attachment.cgi?id=90056&action=edit
yet another try (author imirkin)

Here are some numbers while running dota2. Game is up-to date as of time of
this post.

* recorded a timedemo using "record timedemo1"
* executed via "steam -applaunch 570 +con_logfile timedemo1.log +cl_showfps 2
+timedemoquit timedemo1"

mesa master (fb5f5b81883f360dcbbf407a0f6f5606bc0c0495)

* master
903 frames 45.906 seconds 19.67 fps (50.84 ms/f) 2.519 fps variability
Only in-game corruption, flickering textures. HUD is rendered fine

* master + attached patch
903 frames 56.210 seconds 16.06 fps (62.25 ms/f) 0.696 fps variability
No visible corruption or flicker at all.

* master + 81517 patch
903 frames 70.074 seconds 12.89 fps (77.60 ms/f) 0.974 fps variability
Only in-game corruption, flickering textures. Mostly plain colour or rainbow
texture. HUD _is affected by the flicker_
Note: it used to work previously...

The rainbow texture is part of some courier special effects. Those effect were
not used in this match. Some memory corruption maybe ?

* master + revert commit 48a45ec24ae74c00d1487552e94d9f824a428f58
903 frames 68.625 seconds 13.16 fps (76.00 ms/f) 0.319 fps variability
No visible corruption or flicker at all.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385917293.34F06A754.1204
Date: Sun, 1 Dec 2013 17:01:33 +0000
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
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=90056" name="attach_90056" title="yet another try (author imirkin)">attachment 90056</a> <a href="attachment.cgi?id=90056&amp;action=edit" title="yet another try (author imirkin)">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=64323&amp;attachment=90056'>[review]</a>
yet another try (author imirkin)

Here are some numbers while running dota2. Game is up-to date as of time of
this post.

* recorded a timedemo using &quot;record timedemo1&quot;
* executed via &quot;steam -applaunch 570 +con_logfile timedemo1.log +cl_showfps 2
+timedemoquit timedemo1&quot;

mesa master (fb5f5b81883f360dcbbf407a0f6f5606bc0c0495)

* master
903 frames 45.906 seconds 19.67 fps (50.84 ms/f) 2.519 fps variability
Only in-game corruption, flickering textures. HUD is rendered fine

* master + attached patch
903 frames 56.210 seconds 16.06 fps (62.25 ms/f) 0.696 fps variability
No visible corruption or flicker at all.

* master + 81517 patch
903 frames 70.074 seconds 12.89 fps (77.60 ms/f) 0.974 fps variability
Only in-game corruption, flickering textures. Mostly plain colour or rainbow
texture. HUD _is affected by the flicker_
Note: it used to work previously...

The rainbow texture is part of some courier special effects. Those effect were
not used in this match. Some memory corruption maybe ?

* master + revert commit 48a45ec24ae74c00d1487552e94d9f824a428f58
903 frames 68.625 seconds 13.16 fps (76.00 ms/f) 0.319 fps variability
No visible corruption or flicker at all.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385917293.34F06A754.1204--

--===============2131256498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2131256498==--

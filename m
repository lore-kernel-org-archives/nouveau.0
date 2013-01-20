From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59597] Segmentation fault when moving (part of)
 window outside screen area
Date: Sun, 20 Jan 2013 10:26:16 +0000
Message-ID: <bug-59597-8800-3avRFohPDK@http.bugs.freedesktop.org/>
References: <bug-59597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0548039116=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0548039116==
Content-Type: multipart/alternative; boundary="1358677576.bB2Fcd6F0.19207"; charset="us-ascii"


--1358677576.bB2Fcd6F0.19207
Date: Sun, 20 Jan 2013 10:26:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59597

--- Comment #4 from bugs.freedesktop-AKmYONJMgVsEZ6m2XrtfIFpr/1R2p/CL@public.gmane.org ---
Adding to the information originally posted.

The crash only occurs when moving a window down below the bottom of the screen
area, not right or left. 

My graphics card is produced by Zotac.
I intended to write: Zotac GeForce GTX 660 Ti Amp Edition, as the graphics
card.

I've been trying to install a version 1.0.3 driver to see if that fixes the
issue, but so far I can't find it (nouveau.freedesktop.org responds with a HTTP
503 Service Unavailable).


Let me know if I can do anything to give a better backtrace. I've tried to
install the xserver-xorg-video-nouveau-dbg package, but that didn't seem to
give any better backtrace. 


Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358677576.bB2Fcd6F0.19207
Date: Sun, 20 Jan 2013 10:26:16 +0000
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
   title="NEW --- - Segmentation fault when moving (part of) window outside screen area"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59597#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Segmentation fault when moving (part of) window outside screen area"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59597">bug 59597</a>
              from <span class="vcard"><a class="email" href="mailto:bugs.freedesktop&#64;lindbergonline.dk" title="bugs.freedesktop&#64;lindbergonline.dk">bugs.freedesktop&#64;lindbergonline.dk</a>
</span></b>
        <pre>Adding to the information originally posted.

The crash only occurs when moving a window down below the bottom of the screen
area, not right or left. 

My graphics card is produced by Zotac.
I intended to write: Zotac GeForce GTX 660 Ti Amp Edition, as the graphics
card.

I've been trying to install a version 1.0.3 driver to see if that fixes the
issue, but so far I can't find it (nouveau.freedesktop.org responds with a HTTP
503 Service Unavailable).


Let me know if I can do anything to give a better backtrace. I've tried to
install the xserver-xorg-video-nouveau-dbg package, but that didn't seem to
give any better backtrace. 


Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358677576.bB2Fcd6F0.19207--

--===============0548039116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0548039116==--

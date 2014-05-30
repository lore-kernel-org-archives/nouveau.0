From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Fri, 30 May 2014 09:18:36 +0000
Message-ID: <bug-75761-8800-u4O8wyoaAT@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0826058552=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0826058552==
Content-Type: multipart/alternative; boundary="1401441516.AC2cF7d4.9703"; charset="us-ascii"


--1401441516.AC2cF7d4.9703
Date: Fri, 30 May 2014 09:18:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #26 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
What did the -1 as crtc mean?

I'm not sure how this is weston-specific, though. Weston programs a pageflip on
a certain crtc, and then relies on that particular crtc to send back a pageflip
event as requested.

So if that's the culprit, is Nouveau on some particular hardware sending back
pageflip events on the wrong crtc? Or maybe mixing up crtcs so that no event
gets sent?

This would be easy to test by adding a weston_log("got pageflip event\n") to
src/compositor-drm.c:745, in function page_flip_handler(), and another in line
723 in vblank_handler(). The vblank_handler should be unused atm. I think.

If Weston never gets the pageflip event, its repaint loop would be stuck, which
would explain the symptoms. A side effect would be that clients would never get
frame callbacks, which means that e.g. weston-simple-shm would not be consuming
any CPU. Normally it should take at least few percent of one core. Otherwise
everything would seem to just work, since Weston does not hang but only not
repaint.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401441516.AC2cF7d4.9703
Date: Fri, 30 May 2014 09:18:36 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>What did the -1 as crtc mean?

I'm not sure how this is weston-specific, though. Weston programs a pageflip on
a certain crtc, and then relies on that particular crtc to send back a pageflip
event as requested.

So if that's the culprit, is Nouveau on some particular hardware sending back
pageflip events on the wrong crtc? Or maybe mixing up crtcs so that no event
gets sent?

This would be easy to test by adding a weston_log(&quot;got pageflip event\n&quot;) to
src/compositor-drm.c:745, in function page_flip_handler(), and another in line
723 in vblank_handler(). The vblank_handler should be unused atm. I think.

If Weston never gets the pageflip event, its repaint loop would be stuck, which
would explain the symptoms. A side effect would be that clients would never get
frame callbacks, which means that e.g. weston-simple-shm would not be consuming
any CPU. Normally it should take at least few percent of one core. Otherwise
everything would seem to just work, since Weston does not hang but only not
repaint.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401441516.AC2cF7d4.9703--

--===============0826058552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0826058552==--

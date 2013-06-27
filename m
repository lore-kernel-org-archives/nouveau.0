From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Enabling Xinerama with nouveau driver causes
 Segmentation fault
Date: Thu, 27 Jun 2013 17:28:24 +0000
Message-ID: <bug-66255-8800-O9gzn7WvUX@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2108020513=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2108020513==
Content-Type: multipart/alternative; boundary="1372354104.b86C4E1.2210"; charset="us-ascii"


--1372354104.b86C4E1.2210
Date: Thu, 27 Jun 2013 17:28:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

--- Comment #8 from Trev Jackson <trev.g7pvs-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
Using the ZaphodHeads and Xinerama enabled and having commented out the lines
below:

/*
 #ifdef NOUVEAU_PIXMAP_SHARING
        if (crtc->randr_crtc->scanout_pixmap)
                x = y = 0;
        else
 #endif
*/

It now starts without crashing, however I'm getting some odd effects and
although I can drag a window to the bottom double display it isn't visible and
I'm getting the full width of the screen buffer in the top left window, so when
I move the mouse across the desktop moves sideways, showing what is on the
right hand display (although clicking on the copy on the left window has no
effect). The top right display is the only screen that appears correctly.

Best Regards

Trev

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372354104.b86C4E1.2210
Date: Thu, 27 Jun 2013 17:28:24 +0000
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
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:trev.g7pvs&#64;ntlworld.com" title="Trev Jackson &lt;trev.g7pvs&#64;ntlworld.com&gt;"> <span class="fn">Trev Jackson</span></a>
</span></b>
        <pre>Using the ZaphodHeads and Xinerama enabled and having commented out the lines
below:

/*
 #ifdef NOUVEAU_PIXMAP_SHARING
        if (crtc-&gt;randr_crtc-&gt;scanout_pixmap)
                x = y = 0;
        else
 #endif
*/

It now starts without crashing, however I'm getting some odd effects and
although I can drag a window to the bottom double display it isn't visible and
I'm getting the full width of the screen buffer in the top left window, so when
I move the mouse across the desktop moves sideways, showing what is on the
right hand display (although clicking on the copy on the left window has no
effect). The top right display is the only screen that appears correctly.

Best Regards

Trev</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372354104.b86C4E1.2210--

--===============2108020513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2108020513==--

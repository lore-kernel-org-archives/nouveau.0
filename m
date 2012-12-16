From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Sun, 16 Dec 2012 17:50:34 +0000
Message-ID: <bug-56461-8800-LL92lerbUn@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0626139278=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0626139278==
Content-Type: multipart/alternative; boundary="1355680234.8be31.17304"; charset="us-ascii"


--1355680234.8be31.17304
Date: Sun, 16 Dec 2012 17:50:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #25 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
I've been bisecting and it appears that there are at least 2 further
regressions...

At one point in the bisection, the display goes from working to visible, but
with what look like hsync problems. I can see all the lines on the display, but
each line is shifting horizontally by about 16 pixels or so - giving a
shifting, fuzzy picture.

I've pinned this problem down to the following commit:

486a45c2  drm/nouveau/i2c: do parsing of i2c-related vbios info in
nouveau_i2c.c

There are no differences in the console output between this commit and its
working parent commit.

Much later in the bisection, this hsync problem is replaced with the
fade-to-black problem I described before. I haven't finished bisecting this
yet, but will continue.

Chris.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355680234.8be31.17304
Date: Sun, 16 Dec 2012 17:50:34 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>I've been bisecting and it appears that there are at least 2 further
regressions...

At one point in the bisection, the display goes from working to visible, but
with what look like hsync problems. I can see all the lines on the display, but
each line is shifting horizontally by about 16 pixels or so - giving a
shifting, fuzzy picture.

I've pinned this problem down to the following commit:

486a45c2  drm/nouveau/i2c: do parsing of i2c-related vbios info in
nouveau_i2c.c

There are no differences in the console output between this commit and its
working parent commit.

Much later in the bisection, this hsync problem is replaced with the
fade-to-black problem I described before. I haven't finished bisecting this
yet, but will continue.

Chris.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355680234.8be31.17304--

--===============0626139278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0626139278==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Wed, 12 Dec 2012 00:07:18 +0000
Message-ID: <bug-56461-8800-uVmLnDzk7I@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0270870356=="
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


--===============0270870356==
Content-Type: multipart/alternative; boundary="1355270838.B2d1bdd1.9639"; charset="us-ascii"


--1355270838.B2d1bdd1.9639
Date: Wed, 12 Dec 2012 00:07:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #15 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
It still NULL derefd with that patch - in the same place, but with a different
call stack. However, after looking at where it was happening, I found another
commit to cherry-pick that fixes it:

afada5e0  drm/nv04/disp: disable vblank interrupts when disabling display

The first of the commits that was previously NULL derefing is now black screen
hanging instead, so I think I've found the problem commit - 2a44e499.

To recap...

The last working commit is d2edab4a with dea7e0ac & 095f979a cherry-picked.

The first hanging commit is 2a44e499 with dea7e0ac, 095f979a & afada5e0
cherry-picked.

I'm attaching the console output for these 2 runs.

Chris.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355270838.B2d1bdd1.9639
Date: Wed, 12 Dec 2012 00:07:18 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>It still NULL derefd with that patch - in the same place, but with a different
call stack. However, after looking at where it was happening, I found another
commit to cherry-pick that fixes it:

afada5e0  drm/nv04/disp: disable vblank interrupts when disabling display

The first of the commits that was previously NULL derefing is now black screen
hanging instead, so I think I've found the problem commit - 2a44e499.

To recap...

The last working commit is d2edab4a with dea7e0ac &amp; 095f979a cherry-picked.

The first hanging commit is 2a44e499 with dea7e0ac, 095f979a &amp; afada5e0
cherry-picked.

I'm attaching the console output for these 2 runs.

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

--1355270838.B2d1bdd1.9639--

--===============0270870356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0270870356==--

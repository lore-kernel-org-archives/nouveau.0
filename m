From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Wed, 05 Mar 2014 20:30:26 +0000
Message-ID: <bug-75279-8800-QUuOYmwqsx@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0111143516=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0111143516==
Content-Type: multipart/alternative; boundary="1394051426.aA010bB02.22795"; charset="us-ascii"


--1394051426.aA010bB02.22795
Date: Wed, 5 Mar 2014 20:30:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #33 from Benoit Jacob <bjacob-4eJtQOnFJqFBDgjK7y7TUQ@public.gmane.org> ---
The stack to the free() points to line 203 here, while the stack to where the
free'd data is subsequently used points to line 205 here:

http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nouveau_fence.c?id=ce6dd69697ae62d9336bbd4f5808bc4d75cdcc04#n203


   if (fence == screen->fence.current)
      nouveau_fence_next(screen);

   do {
      nouveau_fence_update(screen, FALSE);  // <--- free here!

      if (fence->state == NOUVEAU_FENCE_STATE_SIGNALLED) // <-- use-after-free
         return TRUE;


So it seems like nouveau_fence_update (which was apparently inlined) destroys
the fence object... do you need to call nouveau_fence_ref() to keep it alive?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394051426.aA010bB02.22795
Date: Wed, 5 Mar 2014 20:30:26 +0000
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
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:bjacob&#64;mozilla.com" title="Benoit Jacob &lt;bjacob&#64;mozilla.com&gt;"> <span class="fn">Benoit Jacob</span></a>
</span></b>
        <pre>The stack to the free() points to line 203 here, while the stack to where the
free'd data is subsequently used points to line 205 here:

<a href="http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nouveau_fence.c?id=ce6dd69697ae62d9336bbd4f5808bc4d75cdcc04#n203">http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nouveau_fence.c?id=ce6dd69697ae62d9336bbd4f5808bc4d75cdcc04#n203</a>


   if (fence == screen-&gt;fence.current)
      nouveau_fence_next(screen);

   do {
      nouveau_fence_update(screen, FALSE);  // &lt;--- free here!

      if (fence-&gt;state == NOUVEAU_FENCE_STATE_SIGNALLED) // &lt;-- use-after-free
         return TRUE;


So it seems like nouveau_fence_update (which was apparently inlined) destroys
the fence object... do you need to call nouveau_fence_ref() to keep it alive?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394051426.aA010bB02.22795--

--===============0111143516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0111143516==--

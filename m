From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Wed, 05 Mar 2014 20:41:24 +0000
Message-ID: <bug-75279-8800-vmwRKQFLts@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0224511245=="
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


--===============0224511245==
Content-Type: multipart/alternative; boundary="1394052084.daDc2.26424"; charset="us-ascii"


--1394052084.daDc2.26424
Date: Wed, 5 Mar 2014 20:41:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #34 from Benoit Jacob <bjacob-4eJtQOnFJqFBDgjK7y7TUQ@public.gmane.org> ---
Also, here's the story of how that caused Firefox to keep spinning here. The
mozilla change that made this bug noticeable (by having Firefox stuck for a
minute there) was https://bugzilla.mozilla.org/show_bug.cgi?id=860254 . Before
that, this use-after-free read was being lucky enough to read the data that was
still present in memory even after the free(), so fence->state still had the
expected value; but after that mozilla-side change, our memory allocator
started immediately poisoning free'd memory, so fence->state had a totally
wrong value, causing this loop here to spin indefinitely.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394052084.daDc2.26424
Date: Wed, 5 Mar 2014 20:41:24 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:bjacob&#64;mozilla.com" title="Benoit Jacob &lt;bjacob&#64;mozilla.com&gt;"> <span class="fn">Benoit Jacob</span></a>
</span></b>
        <pre>Also, here's the story of how that caused Firefox to keep spinning here. The
mozilla change that made this bug noticeable (by having Firefox stuck for a
minute there) was <a href="https://bugzilla.mozilla.org/show_bug.cgi?id=860254">https://bugzilla.mozilla.org/show_bug.cgi?id=860254</a> . Before
that, this use-after-free read was being lucky enough to read the data that was
still present in memory even after the free(), so fence-&gt;state still had the
expected value; but after that mozilla-side change, our memory allocator
started immediately poisoning free'd memory, so fence-&gt;state had a totally
wrong value, causing this loop here to spin indefinitely.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394052084.daDc2.26424--

--===============0224511245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0224511245==--

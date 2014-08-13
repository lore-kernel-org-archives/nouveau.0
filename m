From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82527] xset dpms force {off, standby,
 suspend} returns after ~20 seconds (GeForce 8400 GS)
Date: Wed, 13 Aug 2014 17:36:51 +0000
Message-ID: <bug-82527-8800-lyRzdbZn35@http.bugs.freedesktop.org/>
References: <bug-82527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1401882092=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82527-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1401882092==
Content-Type: multipart/alternative; boundary="1407951410.76dB1.28042"; charset="us-ascii"


--1407951410.76dB1.28042
Date: Wed, 13 Aug 2014 17:36:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82527

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Two comments/questions:

(1)

1:10 slim[256]: (EE) module ABI major version (13) doesn't match the server's
version (15)

That seems a little unhappy... I hope that's not referring to the ddx's module.
I guess you have an old module? As long as nouveau's not involved in this, it
shouldn't matter.

(2)

Did you try to do a "xset dpms force off" in that log, or was that not
included. In case it wasn't included, could you?

Lastly, I forgot that the drm core may also provide some useful information.
Would you mind adding "drm.debug=0xe" to the kernel command line in addition to
the nouveau.debug setting I mentioned earlier, and provide a log which also
includes you trying to "xset dpms force off"?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407951410.76dB1.28042
Date: Wed, 13 Aug 2014 17:36:50 +0000
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
   title="NEW --- - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527">bug 82527</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Two comments/questions:

(1)

1:10 slim[256]: (EE) module ABI major version (13) doesn't match the server's
version (15)

That seems a little unhappy... I hope that's not referring to the ddx's module.
I guess you have an old module? As long as nouveau's not involved in this, it
shouldn't matter.

(2)

Did you try to do a &quot;xset dpms force off&quot; in that log, or was that not
included. In case it wasn't included, could you?

Lastly, I forgot that the drm core may also provide some useful information.
Would you mind adding &quot;drm.debug=0xe&quot; to the kernel command line in addition to
the nouveau.debug setting I mentioned earlier, and provide a log which also
includes you trying to &quot;xset dpms force off&quot;?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407951410.76dB1.28042--

--===============1401882092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1401882092==--

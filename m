From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Thu, 01 Aug 2013 16:29:18 +0000
Message-ID: <bug-56615-8800-MjehfRcajg@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0459507206=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0459507206==
Content-Type: multipart/alternative; boundary="1375374558.fbFFE2.9538"; charset="us-ascii"


--1375374558.fbFFE2.9538
Date: Thu, 1 Aug 2013 16:29:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #16 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I wouldn't worry about that backtrace, it's related to something else I think.

Would you mind switching to nouveau/master? You can just add it as a remote to
your current git setup, no need to check out a whole new tree.

Could you post a full dmesg from a nouveau/master kernel booted with
"nouveau.debug=PDISP=debug"? The dmesg that you've already posted seems to
suggest everything is broken (e.g. PDISP is disabled which is a very bad sign).

Also, to be clear, if you boot with DP plugged in, and start X, then you get a
hang, right? Does the whole system hang, or just the display? Can you ssh in?
If you can ssh in, what happens when you try to turn stuff off/on with xrandr?
(Obviously with DISPLAY=:0 so as to connect to the laptop's X.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375374558.fbFFE2.9538
Date: Thu, 1 Aug 2013 16:29:18 +0000
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
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I wouldn't worry about that backtrace, it's related to something else I think.

Would you mind switching to nouveau/master? You can just add it as a remote to
your current git setup, no need to check out a whole new tree.

Could you post a full dmesg from a nouveau/master kernel booted with
&quot;nouveau.debug=PDISP=debug&quot;? The dmesg that you've already posted seems to
suggest everything is broken (e.g. PDISP is disabled which is a very bad sign).

Also, to be clear, if you boot with DP plugged in, and start X, then you get a
hang, right? Does the whole system hang, or just the display? Can you ssh in?
If you can ssh in, what happens when you try to turn stuff off/on with xrandr?
(Obviously with DISPLAY=:0 so as to connect to the laptop's X.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375374558.fbFFE2.9538--

--===============0459507206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0459507206==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Tue, 25 Feb 2014 17:17:07 +0000
Message-ID: <bug-75279-8800-Mcley0s2Gg@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0061707934=="
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


--===============0061707934==
Content-Type: multipart/alternative; boundary="1393348627.AaE606482.28494"; charset="us-ascii"


--1393348627.AaE606482.28494
Date: Tue, 25 Feb 2014 17:17:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #21 from Benoit Jacob <bjacob-4eJtQOnFJqFBDgjK7y7TUQ@public.gmane.org> ---
 - Are you guys using multi-threaded gl ?

Not here. We could be if Frederic was 1) using non-default preferences such as
layers.acceleration.force-enabled and 2) viewing specific Web pages (e.g. using
WebGL). But here we are talking about a startup hang occurring before this
could kick into play.

Frederic, can you say if you have any force-enabled prefs set in about:config?

 - Considering that the problem is not available with a standalone glxtest app,
do you have a link to a FF build that one can test against ?

Sure. You need a Nightly build, but not a current one since we have landed a
work-around (avoiding to call XCloseDisplay here). This one, from Feb. 20,
should reproduce:

http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02-mozilla-central/

E.g.
http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02-mozilla-central/firefox-30.0a1.en-US.linux-x86_64.tar.bz2

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393348627.AaE606482.28494
Date: Tue, 25 Feb 2014 17:17:07 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:bjacob&#64;mozilla.com" title="Benoit Jacob &lt;bjacob&#64;mozilla.com&gt;"> <span class="fn">Benoit Jacob</span></a>
</span></b>
        <pre> - Are you guys using multi-threaded gl ?

Not here. We could be if Frederic was 1) using non-default preferences such as
layers.acceleration.force-enabled and 2) viewing specific Web pages (e.g. using
WebGL). But here we are talking about a startup hang occurring before this
could kick into play.

Frederic, can you say if you have any force-enabled prefs set in about:config?

 - Considering that the problem is not available with a standalone glxtest app,
do you have a link to a FF build that one can test against ?

Sure. You need a Nightly build, but not a current one since we have landed a
work-around (avoiding to call XCloseDisplay here). This one, from Feb. 20,
should reproduce:

<a href="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02-mozilla-central/">http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02-mozilla-central/</a>

E.g.
<a href="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02-mozilla-central/firefox-30.0a1.en-US.linux-x86_64.tar.bz2">http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2014-02-20-03-02-02-mozilla-central/firefox-30.0a1.en-US.linux-x86_64.tar.bz2</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393348627.AaE606482.28494--

--===============0061707934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0061707934==--
